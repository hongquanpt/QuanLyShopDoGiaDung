using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using ShopBanDoGiaDung.Data;
using System.Security.Claims;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using System.Text;
using ShopBanDoGiaDung.Common;
using QuanLyShopDoGiaDung.Common;
using ShopBanDoGiaDung.Models;

namespace ShopBanDoGiaDung.Controllers
{
    public class AccessController : Controller
    {
        private readonly OnlineShopContext _context;

        public AccessController(OnlineShopContext context)
        {
            _context = context;
        }
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;

            //nếu bạn muốn các chữ cái in thường thay vì in hoa thì bạn thay chữ "X" in hoa trong "X2" thành "x"
        }
        public IActionResult Login()
        {
            ViewBag.prevouisPage = Request.Headers.Referer.ToString();
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginInfo loginInfo)
        {
          try {
              ViewData["action"] = "login";
            var user = await _context.Taikhoans.SingleOrDefaultAsync(c => c.Email == loginInfo.Email);
            if (user == null)
            {
                ViewData["ValidateMessage"] = "Tài khoản không tồn tại";
                return View();
            }
            var f_password = GetMD5(loginInfo.Password);
            if (user.MatKhau != f_password)
            {
                ViewData["ValidateMessage"] = "Mật khẩu không chính xác";
                return View();
            }
            if (user.MatKhau == f_password)
            {
                List<Claim> claims = new List<Claim>()
                  {
                      new Claim(ClaimTypes.NameIdentifier,loginInfo.Email),
                      new Claim("OtherProperties","Example Role")

                  };
                //lu thogn tin vao session
                HttpContext.Session.SetString("email", loginInfo.Email);
                HttpContext.Session.SetInt32("Ma", user.MaTaiKhoan);
                HttpContext.Session.SetString("role", user.Quyen);
                HttpContext.Session.SetString("SDT", user.Sdt);
                HttpContext.Session.SetString("DiaChi", user.DiaChi);

                ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                AuthenticationProperties properties = new AuthenticationProperties()
                {
                    AllowRefresh = true,
                    // IsPersistent = loginInfo.KeepLoggedIn
                };
                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme,
                new ClaimsPrincipal(claimsIdentity), properties);
                if(!String.IsNullOrEmpty(loginInfo.previousPage)){
                    return Redirect(loginInfo.previousPage);
                }
                if (user.Quyen == "Admin")
                {
                    return RedirectToAction("Index", "Admin");
                }
                return RedirectToAction("Index", "Home");
            }
            return View();

          }catch(Exception ex){
              ViewData["ValidateMessage"] = "Đăng nhập thất bại";
            return View();
             
          }
        }

        [HttpPost]
        public async Task<IActionResult> Register(RegisterInfo registerInfo)
        {
           try{
              ViewData["action"] = "register";
            var user = await _context.Taikhoans.SingleOrDefaultAsync(c => c.Email == registerInfo.Email);
            if (user != null)
            {
                ViewData["ValidateMessage"] = "Tài khoản đã tồn tại";
                 return RedirectToAction("Login", "Access");
            }
            var f_password = GetMD5(registerInfo.Password);
            Taikhoan newTk = new Taikhoan(){
                Ten= registerInfo.Ten ,
                Email = registerInfo.Email,
                MatKhau = registerInfo.Password,
                Quyen = "khach"
            };
            _context.Taikhoans.Add(newTk);
            await _context.SaveChangesAsync(); 
            List<Claim> claims = new List<Claim>()
                  {
                      new Claim(ClaimTypes.NameIdentifier,registerInfo.Email),
                      new Claim("OtherProperties","Example Role")

                  };
             HttpContext.Session.SetString("email", registerInfo.Email);
             HttpContext.Session.SetInt32("Ma", newTk.MaTaiKhoan);

             ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
             AuthenticationProperties properties = new AuthenticationProperties()
                {
                    AllowRefresh = true
                };
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme,
            new ClaimsPrincipal(claimsIdentity), properties); 
            if(!String.IsNullOrEmpty(registerInfo.previousPage)){
                return Redirect(registerInfo.previousPage);
            }
            return RedirectToAction("Index", "Home");
           }catch(Exception ex) {
            ViewData["ValidateMessage"] = "Đăng ký thất bại";
              return View();
           }
        }

        public ActionResult Logout()
        {
           
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }

    }
}

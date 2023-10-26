using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Extensions.Logging;
using QuanLyShopDoGiaDung.Models;
using ShopBanDoGiaDung.Data;

namespace QuanLyShopDoGiaDung.Controllers
{
    public class CartController : Controller
    {
        public const string SessionCart = "sessionCart";
        private readonly ILogger<CartController> _logger;
        private readonly OnlineShopContext _context;

        public CartController(ILogger<CartController> logger, OnlineShopContext context)
        {
            _context = context;
            _logger = logger;
        }

         public IActionResult Index()
            {
                var cart = HttpContext.Session.Get(SessionCart);
                var list = new List<CartModel>();
                if (cart != null)
                {
                    var json = Encoding.UTF8.GetString(cart);
                     list = JsonSerializer.Deserialize<List<CartModel>>(json);
                }
                return View(list);
            }

         [HttpPost]
        public JsonResult AddItem(int productId)
        {

            var product = _context.Sanphams.FirstOrDefault(c => c.MaSp == productId);
            var cart = HttpContext.Session.Get(SessionCart);
            if(product.SoLuongTrongKho > 0)
            {
                if (cart != null)
                {
                    var json = Encoding.UTF8.GetString(cart);
                    var  list = JsonSerializer.Deserialize<List<CartModel>>(json);
                    if (list.Exists(x => x.sanpham.MaSp == productId))
                    {

                        foreach (var item in list)
                        {
                            if (item.sanpham.MaSp == productId)
                            {
                                item.soluong += 1;
                            }
                        }
                    }
                    else
                    {
                        //tạo mới đối tượng cart item
                        var item = new CartModel();
                        item.sanpham = product;
                        item.soluong = 1;
                        list.Add(item);
                    }
                    //Gán vào session
                   var jsonSetSession = JsonSerializer.Serialize(list);
                   var byteArrayCart = Encoding.UTF8.GetBytes(jsonSetSession);
                   HttpContext.Session.Set(SessionCart,byteArrayCart);
                }
                else
                {
                    //tạo mới đối tượng cart item
                    var item = new CartModel();
                    item.sanpham = product;
                    item.soluong = 1;
                    var list = new List<CartModel>();
                    list.Add(item);
                    //Gán vào session
                     var jsonSetSession = JsonSerializer.Serialize(list);
                      var byteArrayCart = Encoding.UTF8.GetBytes(jsonSetSession);
                    HttpContext.Session.Set(SessionCart,byteArrayCart);
                }
                return Json(new
                {
                    status = true
                });
            }
            else
            {
                return Json(new
                {
                    status = false
                });
            }          
        }

         public ActionResult Total()
        {
            var cart = HttpContext.Session.Get(SessionCart);
            var json = Encoding.UTF8.GetString(cart);
            var  list = JsonSerializer.Deserialize<List<CartModel>>(json);
            int total = 0;
            foreach (var item in list)
            {
                total += Int32.Parse(item.sanpham.GiaTien.ToString()) * Int32.Parse(item.soluong.ToString());
            }
            ViewBag.tong = total;

            return PartialView();
        }

         public JsonResult Delete(long id)
        {
            var cart = HttpContext.Session.Get(SessionCart);
            var json = Encoding.UTF8.GetString(cart);
            var  list = JsonSerializer.Deserialize<List<CartModel>>(json);
            list.RemoveAll(x => x.sanpham.MaSp == id);
            //Gán vào session
            var jsonSetSession = JsonSerializer.Serialize(list);
            var byteArrayCart = Encoding.UTF8.GetBytes(jsonSetSession);
            HttpContext.Session.Set(SessionCart,byteArrayCart);
            return Json(new
            {
                status = true
            });
        }


         [HttpPost]
        public JsonResult Update(int productId, int amount)
        {

            var cart = HttpContext.Session.Get(SessionCart);
            var json = Encoding.UTF8.GetString(cart);
            var  list = JsonSerializer.Deserialize<List<CartModel>>(json);
            float price = 0;
        

            foreach (var item in list)
            {

                if(item.sanpham.MaSp == productId){
                    item.soluong = amount;
                    price = amount * Convert.ToInt32(item.sanpham.GiaTien);
                }
            }
           var jsonSetSession = JsonSerializer.Serialize(list);
            var byteArrayCart = Encoding.UTF8.GetBytes(jsonSetSession);
            HttpContext.Session.Set(SessionCart,byteArrayCart);
            return Json(new
            {
                status = true,
                productId = productId ,
                price = price
                
            });
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View("Error!");
        }
    }
}
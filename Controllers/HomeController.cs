using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QuanLyShopDoGiaDung.authorize;
using ShopBanDoGiaDung.Data;
using ShopBanDoGiaDung.Models;
using System.Diagnostics;
using ShopBanDoGiaDung.Common;
using QuanLyShopDoGiaDung.Common;


namespace ShopBanDoGiaDung.Controllers
{
    public class HomeController : Controller
    {
        private readonly OnlineShopContext _context;
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, OnlineShopContext context)
        {
            _logger = logger;
            _context = context;
        }

      /*  [CustomAuthorize("khach")]*/
        public IActionResult Index()
        {
            var sanpham = (from a in _context.Sanphams
                           orderby a.SoLuongDaBan descending
                           select a).Take(6);
            var model = sanpham.ToList();
            ViewBag.sanpham = model;
            ViewBag.danhmucsp = _context.Danhmucsanphams.ToList();
            ViewBag.hang = _context.Hangsanxuats.ToList();
            return View();
        }

        public ActionResult SPHang(int id, string ten)
        {
            ViewBag.tenhang = ten;
            var model = _context.Sanphams.Where(s => s.MaHang == id).ToList();
            ViewBag.sanpham = model;
            return View();
        }
        public ActionResult SPDanhMuc(int id, string ten)
        {
            var model = _context.Sanphams.Where(s => s.MaDanhMuc == id).ToList();
            ViewBag.sanpham = model;
            ViewBag.tendanhmuc = ten;
            return View();
        }

         public ActionResult ProductDetail(int id)
        {

            var danhgia = from a in _context.Taikhoans
                          join b in _context.Danhgiasanphams on a.MaTaiKhoan equals b.MaTaiKhoan
                          join c in _context.Sanphams on b.MaSp equals c.MaSp
                          where c.MaSp == id
                          orderby b.NgayDanhGia descending
                          select new CommentView()
                          {
                              TenTaiKhoan = a.Ten,
                              DanhGia = b.DanhGia,
                              NoiDung = b.NoiDungBinhLuan,
                              ThoiGian = b.NgayDanhGia
                          };
            var dsdanhgia = danhgia.ToList();
            int? sum = 0;
            foreach (var item in dsdanhgia)
            {
                sum += item.DanhGia;
            }
            double sao = Math.Round((double)sum / dsdanhgia.Count(), 1);
            ViewBag.sao = sao;
            //var danhgia = obj.DANHGIASANPHAMs.Where(s => s.MaSP.Equals(id) && s.MaTaiKhoan.Equals(makh)).ToList();
            var model = _context.Sanphams.Find(id);
            ViewBag.sanpham = model;
            ViewBag.danhgia = dsdanhgia;
            return View();
        }

         public ActionResult ProductDetail1(int id)
        {

            var danhgia = from a in _context.Taikhoans
                          join b in _context.Danhgiasanphams on a.MaTaiKhoan equals b.MaTaiKhoan
                          join c in _context.Sanphams on b.MaSp equals c.MaSp
                          where c.MaSp == id
                          orderby b.NgayDanhGia descending
                          select new CommentView()
                          {
                              TenTaiKhoan = a.Ten,
                              DanhGia = b.DanhGia,
                              NoiDung = b.NoiDungBinhLuan,
                              ThoiGian = b.NgayDanhGia
                          };
            var dsdanhgia = danhgia.ToList();
            int? sum = 0;
            foreach (var item in dsdanhgia)
            {
                sum += item.DanhGia;
            }
            double sao = Math.Round((double)sum / dsdanhgia.Count(), 1);
            ViewBag.sao = sao;
            var model = _context.Sanphams.Find(id);
            ViewBag.sanpham = model;
            ViewBag.danhgia = dsdanhgia;
            return View();
        }



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

    }
}
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QuanLyShopDoGiaDung.authorize;
using ShopBanDoGiaDung.Data;
using ShopBanDoGiaDung.Models;
using System.Diagnostics;
using QuanLyShopDoGiaDung.Common;
using QuanLyShopDoGiaDung.DTO;


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

        public ActionResult SPHang(int idHang, string ten,int PageIndex, int PageSize)
        {
            if(PageIndex == 0 || PageSize == 0 ){
                PageIndex = 1;
                PageSize = 100;
            }
            ViewBag.tenhang = ten;
            IQueryable<Sanpham> query = (IQueryable<Sanpham>)_context.Sanphams.Where(s=> s.MaHang == idHang);
            List<Sanpham> model = query.ToList();
            var count = query.Count();
             PaginatedList<Sanpham> data = new PaginatedList<Sanpham>(model,count,PageIndex, PageSize );     
            ViewBag.sanpham = data;
            return View();
        }
        public ActionResult SPDanhMuc(int idCategory, string ten, int PageIndex, int PageSize)
        {
            if(PageIndex == 0 || PageSize == 0 ){
                PageIndex = 1;
                PageSize = 100;
            }
            ViewBag.tendanhmuc = ten;
            IQueryable<Sanpham> query = (IQueryable<Sanpham>)_context.Sanphams.Where(s=> s.MaDanhMuc == idCategory);
            List<Sanpham> model = query.ToList();
            var count = query.Count();
             PaginatedList<Sanpham> data = new PaginatedList<Sanpham>(model,count,PageIndex, PageSize );     
            ViewBag.sanpham = data;
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

        public ActionResult AllProduct(int PageIndex, int PageSize)
        {
            if(PageIndex == 0 || PageSize == 0){
                PageIndex = 1;
                PageSize=100;
            }
            IQueryable<Sanpham> model = (IQueryable<Sanpham>)_context.Sanphams;
            var count = model.Count();
            List<Sanpham> dt = model.Skip((PageIndex -1 )* PageSize).Take(PageSize).ToList();
            PaginatedList<Sanpham> data = new PaginatedList<Sanpham>(dt,count,PageIndex, PageSize );     
            ViewBag.sanpham = data;
            return View();
        }


        public ActionResult profile()
        {
            var ma =  HttpContext.Session.GetInt32("Ma");
            var model = _context.Taikhoans.Where(s => s.MaTaiKhoan == ma).ToList();
            ViewBag.taikhoan = model;
            return View();
        }
        

         [HttpPost]
        public async Task<ActionResult> ChangeProfile( TaiKhoanDto tk)
        {
            var it =await _context.Taikhoans.FindAsync(tk.MaTaiKhoan);
            if(it == null) {
                return RedirectToAction("profile");
            }
            it.Ten = tk.Ten;
            it.Email = tk.Email;
            it.DiaChi = tk.DiaChi;
            it.Sdt = tk.Sdt;
            it.NgaySinh = tk.NgaySinh;
            HttpContext.Session.SetString("email",it.Email);
            HttpContext.Session.SetString("SDT", it.Sdt);
            HttpContext.Session.SetString("DiaChi", it.DiaChi);
            await _context.SaveChangesAsync();
            return RedirectToAction("profile");
        }


         public ActionResult MyOrder()
        {
            var ma = HttpContext.Session.GetInt32("Ma");
            var kq = from a in _context.Donhangs
                     join b in _context.Vanchuyens on a.MaDonHang equals b.MaDonHang
                     where a.MaTaiKhoan == ma
                     orderby a.MaDonHang descending
                     select new MyOrder()
                     {
                         MaDonHang = a.MaDonHang,
                         TongTien = a.TongTien,
                         NguoiNhan = b.NguoiNhan,
                         DiaChi = b.DiaChi,
                         NgayMua = a.NgayLap,
                         TinhTrang = a.TinhTrang
                     };
            var kq1 = from a in _context.Donhangs
                      join b in _context.Vanchuyens on a.MaDonHang equals b.MaDonHang
                      where a.MaTaiKhoan == ma && a.TinhTrang == 0
                      orderby a.MaDonHang descending
                      select new MyOrder()
                      {
                          MaDonHang = a.MaDonHang,
                          TongTien = a.TongTien,
                          NguoiNhan = b.NguoiNhan,
                          DiaChi = b.DiaChi,
                          NgayMua = a.NgayLap,
                          TinhTrang = a.TinhTrang
                      };
            var kq2 = from a in _context.Donhangs
                      join b in _context.Vanchuyens on a.MaDonHang equals b.MaDonHang
                      where a.MaTaiKhoan == ma && a.TinhTrang == 1
                      orderby a.MaDonHang descending
                      select new MyOrder()
                      {
                          MaDonHang = a.MaDonHang,
                          TongTien = a.TongTien,
                          NguoiNhan = b.NguoiNhan,
                          DiaChi = b.DiaChi,
                          NgayMua = a.NgayLap,
                          TinhTrang = a.TinhTrang
                      };
            var kq3 = from a in _context.Donhangs
                      join b in _context.Vanchuyens on a.MaDonHang equals b.MaDonHang
                      where a.MaTaiKhoan == ma && a.TinhTrang == 2
                      orderby a.MaDonHang descending
                      select new MyOrder()
                      {
                          MaDonHang = a.MaDonHang,
                          TongTien = a.TongTien,
                          NguoiNhan = b.NguoiNhan,
                          DiaChi = b.DiaChi,
                          NgayMua = a.NgayLap,
                          TinhTrang = a.TinhTrang
                      };
            var kq4 = from a in _context.Donhangs
                      join b in _context.Vanchuyens on a.MaDonHang equals b.MaDonHang
                      where a.MaTaiKhoan == ma && a.TinhTrang == 3
                      orderby a.MaDonHang descending
                      select new MyOrder()
                      {
                          MaDonHang = a.MaDonHang,
                          TongTien = a.TongTien,
                          NguoiNhan = b.NguoiNhan,
                          DiaChi = b.DiaChi,
                          NgayMua = a.NgayLap,
                          TinhTrang = a.TinhTrang
                      };
            var kq5 = from a in _context.Donhangs
                      join b in _context.Vanchuyens on a.MaDonHang equals b.MaDonHang
                      where a.MaTaiKhoan == ma && a.TinhTrang == 4
                      orderby a.MaDonHang descending
                      select new MyOrder()
                      {
                          MaDonHang = a.MaDonHang,
                          TongTien = a.TongTien,
                          NguoiNhan = b.NguoiNhan,
                          DiaChi = b.DiaChi,
                          NgayMua = a.NgayLap,
                          TinhTrang = a.TinhTrang
                      };
            var ds = kq.ToList();
            var ds1 = kq1.ToList();
            var ds2 = kq2.ToList();
            var ds3 = kq3.ToList();
            var ds4 = kq4.ToList();
            var ds5 = kq5.ToList();
            ViewBag.dstatca = ds;
            ViewBag.dschuathanhtoan = ds1;
            ViewBag.dschoxacnhan = ds2;
            ViewBag.dsdangvanchuyen = ds3;
            ViewBag.dsdahoanthanh = ds4;
            ViewBag.dsdahuy = ds5;
            return View();
        }

         public ActionResult MyOrderDetail(int id)
        {
            var kq = from a in _context.Chitietdonhangs
                     join b in _context.Sanphams on a.MaSp equals b.MaSp
                     where a.MaDonHang == id
                     select new MyOrderDetail()
                     {
                         MaSanPham = b.MaSp,
                         TenSP = b.TenSp,
                         Anh = b.Anh1,
                         GiaBan = b.GiaTien,
                         SoLuong = a.SoLuongMua,
                         ThanhTien = b.GiaTien * a.SoLuongMua
                     };
            var ds = kq.ToList();
            return PartialView(ds);
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

    }
}
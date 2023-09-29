using Microsoft.AspNetCore.Mvc;
using ShopBanDoGiaDung.Data;
using System;
using ShopBanDoGiaDung.Models;

namespace ShopBanDoGiaDung.Controllers

{
    public class AdminController : Controller
    {
        OnlineShopContext obj = new OnlineShopContext();
        public IActionResult Index()
        {
            return View();
        }
        #region Quản lý
        #region Quản lý tài khoản
        public IActionResult QuanLyTK()
        {
            var model = obj.Taikhoans.Where(s => s.Quyen == "khach").ToList();
            ViewBag.ds = model;
            return View();
        }
        public IActionResult XoaTK(int MaTK)
        {
            var tk = obj.Taikhoans.Find(MaTK);
            if (tk != null)
            {
                obj.Taikhoans.Remove(tk);
                obj.SaveChanges();
                return Json(new
                {
                    status = true
                });
            }
            else
            {
                // Xử lý trường hợp tk là null (nếu cần)
                return Json(new
                {
                    status = false,
                    message = "Không tìm thấy tài khoản"
                });
            }

        }
        
        #endregion
        #region Quản lý sản phẩm
        public IActionResult QuanLySP()
        {
            var model = obj.Sanphams.ToList();
            ViewBag.ds = model;
            return View();  
        }
        public IActionResult XoaSP(int maSP)
        {
            var tk = obj.Sanphams.Find(maSP);
            if (tk != null)
            {
                obj.Sanphams.Remove(tk);
                obj.SaveChanges();
                return Json(new
                {
                    status = true
                });
            }
            else
            {
                // Xử lý trường hợp tk là null (nếu cần)
                return Json(new
                {
                    status = false,
                    message = "Không tìm thấy tài khoản"
                });
            }            
        }
        public IActionResult SuaSP(int ma) {
            var sp = obj.Sanphams.Find(ma);
            var dshang = obj.Hangsanxuats.ToList();
            var dsdm = obj.Danhmucsanphams.ToList();
            ViewBag.sp = sp;
            if(sp != null)
            {
                var dm = obj.Danhmucsanphams.Find(sp.MaDanhMuc);
                var hang = obj.Hangsanxuats.Find(sp.MaHang);
                if(dm != null && hang!=null)
                {
                    ViewBag.tendm = dm.TenDanhMuc;
                    ViewBag.tenhang = hang.TenHang;
                    ViewBag.dsdm = dsdm;
                    ViewBag.dshang = dshang;
                    return View();
                }
                else
                {
                    // Xử lý trường hợp tk là null (nếu cần)
                    return Json(new
                    {
                        status = false,
                        message = "Không tìm thấy tài khoản"
                    });
                }

            }
             else
            {
                // Xử lý trường hợp tk là null (nếu cần)
                return Json(new
                {
                    status = false,
                    message = "Không tìm thấy tài khoản"
                });
            }
        }
        #endregion
        #region Quản lý hãng
        public IActionResult QuanLyHang()
        {
            var model = obj.Hangsanxuats.ToList();
            ViewBag.ds = model;
            return View();
        }
        public IActionResult ThemHang( string ten)
        {
            Models.Hangsanxuat hsx= new Models.Hangsanxuat();
            hsx.TenHang = ten;
            obj.Hangsanxuats.Add(hsx);
            obj.SaveChanges();
            return Json(new 
            { 
                status = true 
            });
        }
        public IActionResult XoaHang(int ma)
        {
            Models.Hangsanxuat hsx = new Models.Hangsanxuat();
            hsx = obj.Hangsanxuats.Find(ma);
            obj.Hangsanxuats.Remove(hsx);
            obj.SaveChanges();
            return Json(new
            {
                status = true
            });
        }
        #endregion
        #region Quản lý danh mục
        public IActionResult QuanLyDM()
        {
            var model = obj.Danhmucsanphams.ToList();
            ViewBag.ds= model;
            return View();
        }
        public IActionResult XoaDM(int ma)
        {
            Models.Danhmucsanpham hsx = new Danhmucsanpham();
            hsx = obj.Danhmucsanphams.Find(ma);
            obj.Danhmucsanphams.Remove(hsx);
            obj.SaveChanges();
            return Json(new
            {
                status = true
            });
        }
        #endregion
        #region Quản lý đơn hàng
        public IActionResult QuanLyDH()
        {

            var kq = from a in obj.Donhangs
                     join b in obj.Vanchuyens on a.MaDonHang equals b.MaDonHang
                     select new MyOrder()
                     {
                         MaDonHang = a.MaDonHang,
                         TongTien = a.TongTien,
                         NguoiNhan = b.NguoiNhan,
                         DiaChi = b.DiaChi,
                         NgayMua = a.NgayLap,
                         TinhTrang = a.TinhTrang
                     };
            var kq1 = from a in obj.Donhangs
                      join b in obj.Vanchuyens on a.MaDonHang equals b.MaDonHang
                      where a.TinhTrang == 0
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
            var kq2 = from a in obj.Donhangs
                      join b in obj.Vanchuyens on a.MaDonHang equals b.MaDonHang
                      where a.TinhTrang == 1
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
            var kq3 = from a in obj.Donhangs
                      join b in obj.Vanchuyens on a.MaDonHang equals b.MaDonHang
                      where a.TinhTrang == 2
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
            var kq4 = from a in obj.Donhangs
                      join b in obj.Vanchuyens on a.MaDonHang equals b.MaDonHang
                      where a.TinhTrang == 3
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
            var kq5 = from a in obj.Donhangs
                      join b in obj.Vanchuyens on a.MaDonHang equals b.MaDonHang
                      where a.TinhTrang == 4
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
        #endregion
        #endregion
        #region Thống kê
        #region Thống kê doanh số bán ra
        [HttpGet]
        public IActionResult TKDoanhThu()
        {
            return View();
        }
        [HttpPost]
       public IActionResult TKDoanhthu(int year)
        {
            var ds = obj.Donhangs.Where(s => s.NgayLap.Value.Year.ToString().Equals(year.ToString())).ToList();
            var list = new List<ThongKeDoanhThu>();
            long? sum1 = 0;
            long? sum2 = 0;
            long? sum3 = 0;
            long? sum4 = 0;
            long? sum5 = 0;
            long? sum6 = 0;
            long? sum7 = 0;
            long? sum8 = 0;
            long? sum9 = 0;
            long? sum10 = 0;
            long? sum11 = 0;
            long? sum12 = 0;
            foreach (var item in ds)
            {

                if (item.NgayLap.Value.Month.ToString() == "1")
                {
                    sum1 += item.TongTien;
                }
            }
            ThongKeDoanhThu tk1 = new ThongKeDoanhThu();
            tk1.Thang = 1;
            tk1.DoanhThu = sum1;
            list.Add(tk1);
            foreach (var item in ds)
            {

                if (item.NgayLap.Value.Month.ToString() == "2")
                {
                    sum2 += item.TongTien;
                }

            }
            ThongKeDoanhThu tk2 = new ThongKeDoanhThu();
            tk2.Thang = 2;
            tk2.DoanhThu = sum2;
            list.Add(tk2);
            foreach (var item in ds)
            {

                if (item.NgayLap.Value.Month.ToString() == "3")
                {
                    sum3 += item.TongTien;
                }

            }
            ThongKeDoanhThu tk3 = new ThongKeDoanhThu();
            tk3.Thang = 3;
            tk3.DoanhThu = sum3;
            list.Add(tk3);
            foreach (var item in ds)
            {
                long? sum = 0;
                if (item.NgayLap.Value.Month.ToString() == "4")
                {
                    sum4 += item.TongTien;
                }

            }
            ThongKeDoanhThu tk4 = new ThongKeDoanhThu();
            tk4.Thang = 4;
            tk4.DoanhThu = sum4;
            list.Add(tk4);
            foreach (var item in ds)
            {

                if (item.NgayLap.Value.Month.ToString() == "5")
                {
                    sum5 += item.TongTien;
                }

            }
            ThongKeDoanhThu tk5 = new ThongKeDoanhThu();
            tk5.Thang = 5;
            tk5.DoanhThu = sum5;
            list.Add(tk5);
            foreach (var item in ds)
            {

                if (item.NgayLap.Value.Month.ToString() == "6")
                {
                    sum6 += item.TongTien;
                }

            }
            ThongKeDoanhThu tk6 = new ThongKeDoanhThu();
            tk6.Thang = 6;
            tk6.DoanhThu = sum6;
            list.Add(tk6);
            foreach (var item in ds)
            {

                if (item.NgayLap.Value.Month.ToString() == "7")
                {
                    sum7 += item.TongTien;
                }

            }
            ThongKeDoanhThu tk7 = new ThongKeDoanhThu();
            tk7.Thang = 7;
            tk7.DoanhThu = sum7;
            list.Add(tk7);
            foreach (var item in ds)
            {

                if (item.NgayLap.Value.Month.ToString() == "8")
                {
                    sum8 += item.TongTien;
                }

            }
            ThongKeDoanhThu tk8 = new ThongKeDoanhThu();
            tk8.Thang = 8;
            tk8.DoanhThu = sum8;
            list.Add(tk8);
            foreach (var item in ds)
            {
                ;
                if (item.NgayLap.Value.Month.ToString() == "9")
                {
                    sum9 += item.TongTien;
                }

            }
            ThongKeDoanhThu tk9 = new ThongKeDoanhThu();
            tk9.Thang = 9;
            tk9.DoanhThu = sum9;
            list.Add(tk9);
            foreach (var item in ds)
            {

                if (item.NgayLap.Value.Month.ToString() == "10")
                {
                    sum10 += item.TongTien;
                }

            }
            ThongKeDoanhThu tk10 = new ThongKeDoanhThu();
            tk10.Thang = 10;
            tk10.DoanhThu = sum10;
            list.Add(tk10);
            foreach (var item in ds)
            {

                if (item.NgayLap.Value.Month.ToString() == "11")
                {
                    sum11 += item.TongTien;
                }

            }
            ThongKeDoanhThu tk11 = new ThongKeDoanhThu();
            tk11.Thang = 11;
            tk11.DoanhThu = sum11;
            list.Add(tk11);
            foreach (var item in ds)
            {

                if (item.NgayLap.Value.Month.ToString() == "12")
                {
                    sum12 += item.TongTien;
                }

            }
            ThongKeDoanhThu tk12 = new ThongKeDoanhThu();
            tk12.Thang = 12;
            tk12.DoanhThu = sum12;
            list.Add(tk12);

            return Json(new
            {
                status = true,
                data = list
            });
        }
        #endregion
        #region Thống kê sản phẩm
        #endregion
        #endregion
    }
}

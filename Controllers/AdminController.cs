using Microsoft.AspNetCore.Mvc;
using ShopBanDoGiaDung.Data;
using System;
using ShopBanDoGiaDung.Models;
using Microsoft.AspNetCore.Hosting;
using System.Linq;
namespace ShopBanDoGiaDung.Controllers

{
    public class AdminController : Controller
    {
        private readonly OnlineShopContext obj;
        public AdminController (OnlineShopContext obj)
        {
            this.obj = obj;
        }
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
        public IActionResult ThemSP()
        {
            var dsdm = obj.Danhmucsanphams.ToList();
            var dshang = obj.Hangsanxuats.ToList();
            ViewBag.dsdm = dsdm;
            ViewBag.dshang = dshang;
            return View();
        }
        [HttpPost]
        public ActionResult ThemSP(Models.Sanpham sp, IFormFile image1, IFormFile image2, IFormFile image3, IFormFile image4, IFormFile image5, IFormFile image6, string DanhMuc, string Hang)
        {
            var spmoi = new Models.Sanpham();
            spmoi.TenSp = sp.TenSp;
            spmoi.MoTa = sp.MoTa;
            spmoi.GiaTien = sp.GiaTien;
            spmoi.SoLuongTrongKho = sp.SoLuongTrongKho;
            spmoi.SoLuongDaBan = 0;

            if (image1 != null && image1.Length > 0)
            {
                string fileName = Path.GetFileName(image1.FileName);
                string uploadPath = Path.Combine("wwwroot", "Admin", "images", fileName);

                using (var fileStream = new FileStream(uploadPath, FileMode.Create))
                {
                    image1.CopyTo(fileStream);
                }

                spmoi.Anh1 = fileName;
            }

            if (image2 != null && image2.Length > 0)
            {
                string fileName = Path.GetFileName(image2.FileName);
                string uploadPath = Path.Combine("wwwroot", "Admin", "images", fileName);

                using (var fileStream = new FileStream(uploadPath, FileMode.Create))
                {
                    image2.CopyTo(fileStream);
                }

                spmoi.Anh2 = fileName;
            }

            if (image3 != null && image3.Length > 0)
            {
                string fileName = Path.GetFileName(image3.FileName);
                string uploadPath = Path.Combine("wwwroot", "Admin", "images", fileName);

                using (var fileStream = new FileStream(uploadPath, FileMode.Create))
                {
                    image3.CopyTo(fileStream);
                }

                spmoi.Anh3 = fileName;
            }
            if (image4 != null && image4.Length > 0)
            {
                string fileName = Path.GetFileName(image4.FileName);
                string uploadPath = Path.Combine("wwwroot", "Admin", "images", fileName);

                using (var fileStream = new FileStream(uploadPath, FileMode.Create))
                {
                    image4.CopyTo(fileStream);
                }

                spmoi.Anh4 = fileName;
            }
            if (image5 != null && image5.Length > 0)
            {
                string fileName = Path.GetFileName(image5.FileName);
                string uploadPath = Path.Combine("wwwroot", "Admin", "images", fileName);

                using (var fileStream = new FileStream(uploadPath, FileMode.Create))
                {
                    image5.CopyTo(fileStream);
                }

                spmoi.Anh5 = fileName;
            }
            if (image6 != null && image6.Length > 0)
            {
                string fileName = Path.GetFileName(image6.FileName);
                string uploadPath = Path.Combine("wwwroot", "Admin", "images", fileName);

                using (var fileStream = new FileStream(uploadPath, FileMode.Create))
                {
                    image6.CopyTo(fileStream);
                }

                spmoi.Anh6 = fileName;
            }
            // Lặp lại cho image3, image4, image5, và image6

            var dm = obj.Danhmucsanphams.FirstOrDefault(s => s.TenDanhMuc == DanhMuc);
            if (dm != null)
            {
                spmoi.MaDanhMuc = dm.MaDanhMuc;
            }

            var hang = obj.Hangsanxuats.FirstOrDefault(s => s.TenHang == Hang);
            if (hang != null)
            {
                spmoi.MaHang = hang.MaHang;
            }

            obj.Sanphams.Add(spmoi);
            obj.SaveChanges();

            return RedirectToAction("QuanLySP");
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
                    message = "Không tìm thấy sản phẩm"
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
                        message = "Không tìm thấy sản phẩm"
                    });
                }

            }
             else
            {
                // Xử lý trường hợp tk là null (nếu cần)
                return Json(new
                {
                    status = false,
                    message = "Không tìm thấy sản phẩm"
                });
            }
        }
       
        [HttpPost]
        public async Task<IActionResult> SuaSP(Models.Sanpham sp, IFormFile image1, IFormFile image2, IFormFile image3, IFormFile image4, IFormFile image5, IFormFile image6, string DanhMuc, string Hang)
        {
            var spmoi = obj.Sanphams.Find(sp.MaSp);
            if(spmoi != null)
            {
                spmoi.TenSp = sp.TenSp;
                spmoi.MoTa = sp.MoTa;
                spmoi.GiaTien = sp.GiaTien;
                spmoi.SoLuongTrongKho = sp.SoLuongTrongKho;
                spmoi.SoLuongDaBan = sp.SoLuongDaBan;

                // Đường dẫn đến thư mục lưu trữ tệp ảnh
                string currentDirectory = System.IO.Directory.GetCurrentDirectory();
                string uploadPath = Path.Combine(currentDirectory, "wwwroot", "Admin", "images");


                // Hàm để lưu tệp ảnh
                async Task SaveImage(IFormFile image, string imageName, string propertyName)
                {
                    if (image != null)
                    {
                        string imagePath = Path.Combine(uploadPath, imageName);
                        using (var stream = new FileStream(imagePath, FileMode.Create))
                        {
                            await image.CopyToAsync(stream);
                        }
                        // Gán tên tệp ảnh vào thuộc tính tương ứng
                        typeof(Models.Sanpham).GetProperty(propertyName)?.SetValue(spmoi, imageName);
                    }
                    else
                    {
                        // Giữ nguyên ảnh cũ nếu không có ảnh mới
                        typeof(Models.Sanpham).GetProperty(propertyName)?.SetValue(spmoi, typeof(Models.Sanpham).GetProperty(propertyName)?.GetValue(sp));
                    }
                }

                // Lưu từng ảnh

                if (spmoi.Anh1 != null)
                {
                    await SaveImage(image1, spmoi.Anh1, nameof(spmoi.Anh1));
                }

                if (spmoi.Anh2 != null)
                {
                    await SaveImage(image2, spmoi.Anh2, nameof(spmoi.Anh2));
                }
                if (spmoi.Anh3 != null)
                {
                    await SaveImage(image3, spmoi.Anh3, nameof(spmoi.Anh3));
                }

                if (spmoi.Anh4 != null)
                {
                    await SaveImage(image4, spmoi.Anh4, nameof(spmoi.Anh4));
                }
                if (spmoi.Anh5 != null)
                {
                    await SaveImage(image5, spmoi.Anh5, nameof(spmoi.Anh5));
                }

                if (spmoi.Anh6 != null)
                {
                    await SaveImage(image6, spmoi.Anh6, nameof(spmoi.Anh6));
                }
                // Tìm danh mục và hãng dựa trên tên
                var dm = obj.Danhmucsanphams.FirstOrDefault(s => s.TenDanhMuc == DanhMuc);
                if (dm != null)
                {
                    spmoi.MaDanhMuc = dm.MaDanhMuc;
                }

                var hang = obj.Hangsanxuats.FirstOrDefault(s => s.TenHang == Hang);
                if (hang != null)
                {
                    spmoi.MaHang = hang.MaHang;
                }

                obj.SaveChanges();
                return RedirectToAction("QuanLySP");
            }
            else
            {
                return Json(new
                {
                    status = false
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
        [HttpPost]
        public IActionResult ThemHang( string tenhang)
        {
            Models.Hangsanxuat hsx= new Models.Hangsanxuat();
            hsx.TenHang = tenhang;
            obj.Hangsanxuats.Add(hsx);
            obj.SaveChanges();
            return Json(new 
            { 
                status = true 
            });
        }
        public IActionResult XoaHang(int matk)
        {         
            var hsx = obj.Hangsanxuats.Find(matk);
            if(hsx != null)
            {
                obj.Hangsanxuats.Remove(hsx);
                obj.SaveChanges();
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
        public IActionResult SuaHang(int id) { 
            var model= obj.Hangsanxuats.Find(id);
            return View(model); 
        }
        [HttpPost]
        public IActionResult SuaHang(int id, string name) {
            var hsx = obj.Hangsanxuats.Find(id);
            if(hsx != null)
            {
                hsx.TenHang = name;
                obj.SaveChanges();
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
        #endregion
        #region Quản lý danh mục
        public IActionResult QuanLyDM()
        {
            var model = obj.Danhmucsanphams.ToList();
            ViewBag.ds= model;
            return View();
        }
        public IActionResult XoaDM(int madm)
        {           
           var hsx = obj.Danhmucsanphams.Find(madm);
            if (hsx != null)
            {
                obj.Danhmucsanphams.Remove(hsx);
                obj.SaveChanges();
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
        public IActionResult ThemDM(string tendm)
        {
            Models.Danhmucsanpham dm = new Danhmucsanpham();
            dm.TenDanhMuc = tendm;
            obj.Danhmucsanphams.Add(dm);
            obj.SaveChanges();
            return Json(new
            {
                status= true
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
        public IActionResult XacNhanDH(int madh)
        {
            var dh = obj.Donhangs.Find(madh);
            if (dh != null) 
            {
                dh.TinhTrang = 2;
                obj.SaveChanges();
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
        public IActionResult VanChuyenDH(int madh)
        {
            var dh=obj.Donhangs.Find( madh);
            if (dh != null)
            {
                dh.TinhTrang = 3;
                obj.SaveChanges();
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
        public IActionResult MyOrderDetail(int id)
        {
            var kq = from a in obj.Chitietdonhangs
                     join b in obj.Sanphams on a.MaSp equals b.MaSp
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
            var ds = obj.Donhangs.Where(s => s.NgayLap != null && s.NgayLap.Value.Year.ToString().Equals(year.ToString())).ToList();
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

                if (item.NgayLap.HasValue && item.NgayLap.Value.Month.ToString() == "1")
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

                if (item.NgayLap.HasValue && item.NgayLap.Value.Month.ToString() == "2")
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

                if (item.NgayLap.HasValue && item.NgayLap.Value.Month.ToString() == "3")
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
              
                if (item.NgayLap.HasValue && item.NgayLap.Value.Month.ToString() == "4")
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

                if (item.NgayLap.HasValue && item.NgayLap.Value.Month.ToString() == "5")
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

                if (item.NgayLap.HasValue && item.NgayLap.Value.Month.ToString() == "6")
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

                if (item.NgayLap.HasValue && item.NgayLap.Value.Month.ToString() == "7")
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

                if (item.NgayLap.HasValue && item.NgayLap.Value.Month.ToString() == "8")
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
                if (item.NgayLap.HasValue && item.NgayLap.Value.Month.ToString() == "9")
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

                if (item.NgayLap.HasValue && item.NgayLap.Value.Month.ToString() == "10")
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

                if (item.NgayLap.HasValue && item.NgayLap.Value.Month.ToString() == "11")
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

                if (item.NgayLap.HasValue && item.NgayLap.Value.Month.ToString() == "12")
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

using System.Data.Entity;
using Microsoft.AspNetCore.Mvc;
using ShopBanDoGiaDung.Data;
using ShopBanDoGiaDung.Models;

namespace QuanLyShopDoGiaDung.ViewComponents
{
    public class DanhMucViewComponent: ViewComponent

    {
        private readonly OnlineShopContext _context;
        public DanhMucViewComponent(OnlineShopContext context){
            _context = context;
        }
        public  IViewComponentResult Invoke()
        {
            List<Danhmucsanpham> lst =  _context.Danhmucsanphams.ToList();
            return View(lst);
        }
        
    }
}
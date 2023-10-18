

using System.Data.Entity;
using Microsoft.AspNetCore.Mvc;
using ShopBanDoGiaDung.Data;
using ShopBanDoGiaDung.Models;

namespace QuanLyShopDoGiaDung.ViewComponents
{
    public class HangViewComponent: ViewComponent
    {
        private readonly OnlineShopContext _context;
        public HangViewComponent(OnlineShopContext context) {
            _context = context;
        }

         public IViewComponentResult Invoke()
        {
            List<Hangsanxuat> lst = _context.Hangsanxuats.ToList();
            return View(lst);
        }
    }
}
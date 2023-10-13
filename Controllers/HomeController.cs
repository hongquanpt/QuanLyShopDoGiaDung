using Microsoft.AspNetCore.Mvc;
using ShopBanDoGiaDung.Data;
using ShopBanDoGiaDung.Models;
using System.Diagnostics;

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

        public IActionResult Index()
        {
            var sanpham = (from a in _context.Sanphams
                           orderby a.SoLuongDaBan descending
                           select a).Take(6);
            var model = sanpham.ToList();
            ViewBag.sanpham = model;
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
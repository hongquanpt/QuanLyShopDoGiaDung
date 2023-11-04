using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QuanLyShopDoGiaDung.Common
{
    public class RegisterInfo
    {
        public string Ten { get; set; } 
        public string Email { get; set; }  
        public string Password {    get;set;}
        public string Quyen {get;set;}

        public string? previousPage {get; set;}
    }
}
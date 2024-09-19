using System;
using System.ComponentModel.DataAnnotations;

namespace BillingSoftware.Model
{
    public class UserProfileModel
    {
       [Key]
        public int userid { get; set; }
        public int companyid {  get; set; }
        public string user_name { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public string confirm_password { get; set; }
        public int m_companyid { get; set; }
        public string s_companyid { get; set; }
        public string[] main_menu { get; set;}
        public string[] sub_menu {  get; set;}
        public string main_menus { get; set; }
        public string sub_menus { get; set; }
        public string img { get; set; }
        public bool isactive { get; set; }
        public int cuid {  get; set; }    
    }

    public class UserLoginModel
    {
        [Key]
        public int userid { get; set; }
        public int companyid { get; set; }
        public string user_name { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public int m_companyid { get; set; }
    }
}

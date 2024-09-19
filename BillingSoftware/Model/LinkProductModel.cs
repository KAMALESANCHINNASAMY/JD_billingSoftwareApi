using System.Collections.Generic;

namespace BillingSoftware.Model
{
    public class LinkProductModel
    {
        public int linkid { get; set; }
        public int productid { get; set; }
        public int companyid { get; set; }
        public int cuid { get; set; }
        public string product_name { get; set; }
        public string n_product_name { get; set; }
        public List<LinkProductNestedModel> linkproduct_nested { get; set; }
    }

    public class LinkProductNestedModel
    {
        public int link_n_id { get; set; }
        public int linkid { get; set;}
        public int n_productid { get; set; }
        public string qty { get; set;}
    }
}

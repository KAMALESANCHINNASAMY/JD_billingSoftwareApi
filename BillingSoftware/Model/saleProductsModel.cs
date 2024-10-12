using System.Collections.Generic;
using System.Net.NetworkInformation;

namespace BillingSoftware.Model
{
    public class saleProductsModel
    {
        public int entryid { get; set; }
        public int purchaseid { get; set; }
        public int customerid { get; set; }
        public int third_partyid { get; set; }
        public string date { get; set; }
        public string bill_no { get; set; }
        public string credit_days { get; set; }
        public string total { get; set; }
        public int cuid { get; set; }
        public int companyid { get; set; }
        public string customer_name { get; set; }
        public string party_name { get; set; }
        public string gst_in { get; set; }
        public List<saleProductsModelNested> sale_nested { get; set; }
    }
    public class saleProductsModelNested
    {
        public int entry_n_id { get; set; }
        public int entryid { get; set;}
        public int purchaseid { get; set; }
        public int purchase_n_id { get; set; }
        public int productid { get; set; }
        public string product_name { get; set; }
        public string gst_percentage { get; set; }
        public string price { get; set; }
        public string discount { get; set; }
        public string qty { get; set; }
        public string total { get; set; }
        public string re_amount { get; set; }
        public string cgst_amount { get; set; }
        public string sgst_amount { get; set; }
        public string igst_amount { get; set; }
        public string net_total { get; set; }
    }
}

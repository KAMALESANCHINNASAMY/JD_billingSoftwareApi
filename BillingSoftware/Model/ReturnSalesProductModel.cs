using System.Collections.Generic;

namespace BillingSoftware.Model
{
    public class ReturnSalesProductModel
    {
        public int returnid { get; set; }
        public int entryid { get; set; }
        public int customerid { get; set; }
        public string bill_no { get; set; }
        public string return_no { get; set; }
        public string return_date { get; set; }
        public string return_total { get; set; }
        public int companyid { get; set; }
        public int cuid { get; set; }
        public string customer_name { get; set; }
        public string total { get; set; }
        public List<NestedReturnSalesProductModel> salesProduct_nested { get; set; }
    }

    public class NestedReturnSalesProductModel
    {
        public int return_n_id { get; set; }
        public int returnid { get; set; }
        public int entry_n_id { get; set; }
        public int productid { get; set; }
        public string gst_percentage { get; set; }
        public string price { get; set; }
        public string discount { get; set; }
        public string qty { get; set; }
        public string ret_qty { get; set; }
        public string total { get; set; }
        public string ret_total { get; set; }
        public string re_amount { get; set; }
        public string ret_re_amount { get; set; }
        public string cgst_amount { get; set; }
        public string ret_cgst_amount { get; set; }
        public string sgst_amount { get; set; }
        public string ret_sgst_amount { get; set; }
        public string igst_amount { get; set; }
        public string ret_igst_amount { get; set; }
        public string net_total { get; set; }
        public string ret_net_total { get; set; }
    }
}

using System.Collections.Generic;

namespace BillingSoftware.Model
{
    public class RawProductPurchaseModel
    {
        public int purchaseid { get; set; }
        public int supplierid { get; set; }
        public string supplier_name { get; set; }
        public string gst_in { get; set; }
        public string date { get; set; }
        public string supplier_bill_no { get; set; }
        public string bill_no { get; set; }
        public string credit_days { get; set; }
        public string total { get; set; }
        public int cuid { get; set; }
        public int companyid { get; set; }
        public List<RawProductPurchaseNestedModel> purchase_nested { get; set; }
    }

    public class RawProductPurchaseNestedModel
    {
        public int purchase_n_id { get; set; }
        public int purchaseid { get; set; }
        public int n_productid { get; set; }
        public string supplier_bill_no { get; set; }
        public string gst_percentage { get; set; }
        public string price { get; set; }
        public string discount { get; set; }
        public string qty { get; set; }
        public string total { get; set; }
        public string cgst_amount { get; set; }
        public string sgst_amount { get; set; }
        public string igst_amount { get; set; }
        public string net_total { get; set; }
    }
}

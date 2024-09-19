namespace BillingSoftware.Model
{
    public class SareegstHistoryModel
    {
        public int entryid { get; set; }
        public int entry_n_id { get; set; }
        public int stockid { get; set; }
        public int purchaseid { get; set; }
        public int purchase_n_id { get; set; }
        public string return_date { get; set; }
        public string return_no { get; set; }
        public string invoice_no { get; set; }
        public int third_partyid { get; set; }
        public string party_name { get; set; }
        public string weaver_name { get; set; }
        public string purchase_date { get; set; }
        public string return_total { get; set; }
        public string return_net_total { get; set; }
        public string return_qty { get; set; }
        public string bill_date { get; set; }
        public string si_code { get; set; }
        public string ref_code { get; set; }
        public int brandid { get; set; }
        public int itemid { get; set; }
        public string customer_name { get; set; }

        public string purchase_return_qty {  get; set; }
  
        public string purchase_return_nettotal { get; set; }

        public string sales_customer_name {  get; set; }

        public string sales_return_cust_name {  get; set; }
        public string purchase_return_date {  get; set; }
        public string sold_qty {  get; set; }

        public string sold_date {  get; set; }

        public string sales_return_date { get; set; }
        public string purchase_qty {  get; set; }

        public string purchase_net_total { get; set; }
        public string sold_net_total { get; set; }

        public string sales_return_qty { get; set; }

        public string sales_si_code {  get; set; }

        public string sales_ref_code {  get; set; }

        public string sales_return_net_total { get; set; }

        public string purchase_return_si_code { get; set; }

        public string puchase_return_ref_code { get; set; }

        public string sales_return_si_code { get; set; }

        public string sales_return_ref_code { get; set; }

        public string supplier_bill_no { get; set; }
        public string supplier_name { get; set; }

        public int supplierid { get; set; }

        public int customerid { get; set; }
        public string gst_in { get; set; }
        public string state { get; set; }
        public string state_code { get; set; }
        public string item_name { get; set; }
        public string brand_name { get; set; }
        public string date { get; set; }
        public string bill_no { get; set; }
        public string total_qty { get; set; }
        public string sold_qty_gst { get; set; }
        public string sold_qty_nogst { get; set; }
        public string avail_qty { get; set; }
        public string gst_percentage { get; set; }
        public string hsn_number { get; set; }
        public string price { get; set; }
        public string discount { get; set; }
        public string qty { get; set; }
        public string total { get; set; }
        public string cgst_amount { get; set; }
        public string sgst_amount { get; set; }
        public string igst_amount { get; set; }
        public string net_total { get; set; }
        public bool isactive { get; set; }
        public bool activestatus { get; set; }
        public bool purchasein { get; set; }
        public bool purchasereturn { get; set; }
        public bool salesin { get; set; }
        public bool salesreturn { get; set; }
        public bool third_party_gst { get; set; }
        public bool third_party_nongst { get; set; }
        public bool weavers { get; set; }
        public int companyid { get; set; }

    }
}

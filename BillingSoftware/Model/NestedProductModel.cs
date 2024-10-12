namespace BillingSoftware.Model
{
    public class NestedProductModel
    {
        public int n_productid { get; set; }
        public string n_product_name { get; set; }
        public string price { get; set; }
        public int unitid { get; set; }
        public int item_groupid { get; set; }
        public int companyid { get; set; }
        public int cuid { get; set; }
        public string unit_name { get; set; }
        public string hsn_number { get; set; }
        public string gst_percentage { get; set; }
        public decimal pa_qty { get; set; }
        public decimal ra_qty { get; set; }        
        public decimal av_a_qty { get; set; }
        public decimal av_qty { get; set; }
        public decimal sa_qty { get; set; }
        public decimal sra_qty { get; set; }
        public int supplierid { get; set; }
        public string supplier_name { get; set; }
        public string date { get; set; }
        public string bill_no { get; set; }
        public string n_productids { get; set; }
        public string qtys { get; set; }
        public string a_qtys { get; set; }
    }
}

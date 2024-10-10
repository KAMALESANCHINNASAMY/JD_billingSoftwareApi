namespace BillingSoftware.Model
{
    public class ProductMasterModel
    {
        public int productid { get; set; }
        public string product_name { get; set; }
        public string price { get; set; }
        public int unitid { get; set; }
        public int item_groupid { get; set; }
        public int companyid { get; set; }
        public int cuid { get; set; }
        public string unit_name { get; set; }
        public string hsn_number { get; set; }
        public string gst_percentage { get; set; }
        public decimal p_qty { get; set; }
        public decimal rp_qty { get; set; }
        public decimal s_qty { get; set; }
        public decimal rs_qty { get; set; }
        public decimal av_qty { get; set; }
    }
}

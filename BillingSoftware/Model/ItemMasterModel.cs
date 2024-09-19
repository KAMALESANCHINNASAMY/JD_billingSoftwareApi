namespace BillingSoftware.Model
{
    public class ItemMasterModel
    {
        public int itemid { get; set; }

        public int companyid {  get; set; }

        public int unitid { get; set; }

        public string brand_name { get; set; }

        public string unit_name {  get; set; }

        public int gstid { get; set; }

        public int hsnid {  get; set; }

        public int item_groupid {  get; set; }

        public string item_code {  get; set; }

        public string item_name {  get; set; }

        public string item_group_name { get; set; }

        public string hsn_number { get; set; }

        public string gst_percentage {  get; set; }

        public int brandid { get; set;}

        public bool isactive { get; set; }

        public int cuid { get; set; }

    }
}

namespace BillingSoftware.Model
{
    public class ItemGroupModel
    {
        public int item_groupid { get; set; }

        public int companyid { get; set; }

        public string item_group_name { get; set; }

        public int hsnid {  get; set; }

        public string hsn_number { get; set; }

        public string gst_percentage { get; set; }

        public bool isactive { get; set; }

        public int cuid { get; set; }
    }
}

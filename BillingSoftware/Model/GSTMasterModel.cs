namespace BillingSoftware.Model
{
    public class GSTMasterModel
    {
        public  int gstid {  get; set; }

        public int companyid {  get; set; }

        public string gst_ID { get; set; }

        public string gst_percentage { get; set; }

        public string igst_percentage {  get; set; }

        public string c_gst { get; set; }

        public string s_gst {  get; set; }

        public bool isactive { get; set; }

        public int cuid { get; set; }
    }
}

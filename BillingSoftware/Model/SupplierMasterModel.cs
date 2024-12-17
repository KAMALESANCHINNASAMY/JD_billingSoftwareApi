using System.Collections.Generic;

namespace BillingSoftware.Model
{
    public class SupplierMasterModel
    {
        public int supplierid { get; set; }
        public string supplier_name { get; set; }
        public string mobile_no { get; set; }
        public string state { get; set; }
        public string state_code { get; set; }
        public string gst_in { get; set; }
        public string balance { get; set; }        
        public string c_balance { get; set; }
        public string address { get; set; }
        public string shipping_address { get; set; }
        public int companyid { get; set; }
        public int cuid { get; set; }
    }
}

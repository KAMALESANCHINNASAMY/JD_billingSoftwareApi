using System.Collections.Generic;

namespace BillingSoftware.Model
{
    public class ThirdPartyMasterModel
    {
        public int third_partyid { get; set; }
        public string party_name { get; set; }
        public string short_code { get; set; }
        public string mobile { get; set; }
        public string state { get; set; }
        public string state_code { get; set; }
        public string address { get; set; }
        public string balance { get; set; }
        public string c_balance { get; set; }
        public string gst_in { get; set; }
        public int companyid { get; set; }
        public int cuid { get; set; }        
    }
}

using System.Collections.Generic;

namespace BillingSoftware.Model
{
    public class SupplyThirdPartyModel
    {
        public int supplyid { get; set; }
        public int returnid { get; set; }
        public int third_partyid { get; set; }
        public string date { get; set; }
        public string bill_no { get; set; }
        public string return_no { get; set; }
        public string return_date { get; set; }
        public int companyid { get; set; }
        public int cuid { get; set; }
        public string party_name { get; set; }
        public int productid { get; set; }
        public string qty { get; set; }
        public List<SupplyThirdPartyModelNested> supply_nested { get; set; }
    }
    public class SupplyThirdPartyModelNested
    {
        public int supply_n_id { get; set; }
        public int supplyid { get; set; }
        public int n_productid { get; set; }
        public string a_qty { get; set; }
        public string ret_a_qty { get; set; }
        public string ret_qty { get; set; }
        public string qty { get; set; }
    }
}

using System.Collections.Generic;

namespace BillingSoftware.Model
{
    public class WeaverSareesModel
    {
        public int purchaseid { get; set; }
        public int weaverid { get; set; }
        public string si_codes { get; set; }
        public string weaver_name { get; set; }
        public string short_code { get; set; }
        public string date { get; set; }
        public string mode { get; set; }
        public bool isactive { get; set; }
        public int companyid { get; set; }
        public int cuid { get; set; }
        public List<WeaverSareesNestedModel> weaver_nested { get; set; }
        public List<giventoweaversModel> giventoweavers { get; set; }
    }

    public class WeaverSareesNestedModel
    {
        public int purchase_n_id { get; set; }
        public int purchaseid { get; set; }
        public string si_code { get; set; }
        public string ref_code { get; set; }
        public int brandid { get; set; }
        public int itemid { get; set; }
        public string qty { get; set; }
        public int givenid { get; set; }
        public string r_gram { get; set; }
        public string r_advance { get; set; }
        public string description { get; set; }
    }

    public class giventoweaversModel
    {
        public int purchase_n_id { get; set; }
        public int purchaseid { get; set; }
        public int givenid { get; set; }
        public int brandid { get; set; }
        public int itemid { get; set; }
        public string g_gram { get; set; }
        public string g_rate { get; set; }
        public string g_total { get; set; }
        public string g_advance { get; set; }
        public string qty { get; set; }
        public string description { get; set; }
    }
}

namespace BillingSoftware.Model
{
    public class WeaverMasterModel
    {
        public int weaverid { get; set; }
        public string weaver_name { get; set; }
        public string short_code { get; set; }
        public string mobile { get; set; }
        public string address { get; set; }
        public string balance { get; set; }

        public string state_code {  get; set; }

        public string state {  get; set; }
        public int companyid { get; set; }
        public int cuid { get; set; }

    }
}

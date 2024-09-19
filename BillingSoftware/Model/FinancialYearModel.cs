namespace BillingSoftware.Model
{
    public class FinancialYearModel
    {
        public int finyearid { get; set; }
        public int companyid { get;set; }

        public string company_name { get; set; }
        public string finyear { get; set; }
        public string fromdate { get; set; }
        public string todate { get; set; }
        public bool isactive { get; set; }
        public bool status { get; set; }
        public int cuid { get; set; }

    }
}

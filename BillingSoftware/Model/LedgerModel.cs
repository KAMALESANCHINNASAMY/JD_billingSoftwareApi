namespace BillingSoftware.Model
{
    public class LedgerModel
    {
        public string date { get; set; }
        public string bill_no { get; set; }
        public decimal debit { get; set; }
        public decimal credit { get; set; }
        public string descrip_tion { get; set; }
        public int sort_order { get; set; }
    }
}

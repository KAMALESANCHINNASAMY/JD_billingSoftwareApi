namespace BillingSoftware.Model
{
    public class ExpenseEntryModel
    {
        public int entryid { get; set; }
        public int expenseid { get; set; }
        public string amount { get; set; }
        public string date { get; set; }
        public string description { get; set; }
        public bool issale_am { get; set; }
        public bool ishand_cash_am { get; set; }
        public bool isbank_am { get; set; }
        public int bankid { get; set; }
        public int companyid { get; set; }
        public int cuid { get; set; }
        public string expense_name { get; set; }
    }
}

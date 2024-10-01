using System.Collections.Generic;

namespace BillingSoftware.Model
{
    public class SupplierPaymentModel
    {
        public int paymentid { get; set; }
        public int supplierid { get; set; }
        public string date { get; set; }
        public string balance { get; set; }
        public string amount_mode { get; set; }
        public string payment_type { get; set; }
        public string cheque_no { get; set; }
        public string c_date { get; set; }
        public string c_amount { get; set; }
        public string adnp_amount { get; set; }
        public int advanceid { get; set; }
        public string supplier_bill_no { get; set; }
        public int bankid { get; set; }
        public string bill_no { get; set; }
        public string supplier_name { get; set; }
        public string total { get; set; }
        public string total_amount { get; set; }
        public string deduction_amount { get; set; }
        public int companyid { get; set; }
        public int cuid { get; set; }

        public List<SupplierPaymentNestedModel> supplierpayment_nested { get; set; }
    }
    public class SupplierPaymentNestedModel
    {
        public int payment_n_id { get; set; }
        public int purchaseid { get; set; }
        public int supplierid { get; set; }
        public string date { get; set; }
        public string bill_no { get; set; }
        public string total { get; set; }
        public string total_amount { get; set; }
        public string deduction_amount { get; set; }
        public decimal tot { get; set; }
        public string retTot { get; set; }
        public decimal totalcal { get; set; }
        public decimal de { get; set; }
        public bool isbill { get; set; }
        public bool isbal { get; set; }
    }
}



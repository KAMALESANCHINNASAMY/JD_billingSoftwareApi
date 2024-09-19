using System.Collections.Generic;

namespace BillingSoftware.Model
{
    public class ThirdPartyPurchaseGstDebitModel
    {

        public int thirdPartyDebitid { get; set; }

        public int purchaseid { get; set; }

        public string party_name { get; set; }


        public string mobile_no { get; set; }


        public string return_totaln { get; set; }

        public string return_qtyn { get; set; }

        public string gst_in { get; set; }


        public string state { get; set; }

        public string state_code { get; set; }

        public string address { get; set; }

        public int third_partyid { get; set; }

        public string purchase_date { get; set; }


        public string invoice_no { get; set; }

        public string invoice_date { get; set; }

        public string return_no { get; set; }

        public string return_date { get; set; }

        public string return_total { get; set; }

        public string total { get; set; }


        public string return_cgst_amount { get; set; }


        public string return_sgst_amount { get; set; }


        public string return_igst_amount { get; set; }


        public string return_net_total { get; set; }

        public int companyid { get; set; }

        public int cuid { get; set; }
        public string mobile { get; set; }

        public List<thirdParty_Purchasegst_Debitnested_Model> thirdPartyGst_Debit_nested { get; set; }

        public List<thirdParty_PurchaseNongst_Debitnested_Model> thirdPartyNonGst_Debit_nested { get; set; }

    }

    public class thirdParty_Purchasegst_Debitnested_Model

    {

        public int thirdPartyDebitid { get; set; }

        public int third_partyid { get; set; }

        public string purchase_date { get; set; }


        public string invoice_no { get; set; }

        public string invoice_date { get; set; }

        public string return_no { get; set; }

        public string return_date { get; set; }

        public int thirdPartyDebit_n_id { get; set; }

        public int purchase_n_id { get; set; }

        public int purchaseid { get; set; }

        public int stockid { get; set; }

        public string ref_code { get; set; }

        public string si_code { get; set; }

        public int brandid { get; set; }

        public int itemid { get; set; }

        public string item_name { get; set; }

        public string hsn_number { get; set; }

        public string gst_percentage { get; set; }

        public string price { get; set; }

        public string discount { get; set; }

        public string qty { get; set; }

        public string return_qty { get; set; }

        public string total { get; set; }

        public string return_total { get; set; }

        public string cgst_amount { get; set; }

        public string return_cgst_amount { get; set; }

        public string sgst_amount { get; set; }

        public string return_sgst_amount { get; set; }

        public string igst_amount { get; set; }

        public string return_igst_amount { get; set; }

        public string net_total { get; set; }

        public string return_net_total { get; set; }
       




    }

    public class thirdParty_PurchaseNongst_Debitnested_Model
    {

        public int thirdPartyDebitid { get; set; }

        public int third_partyid { get; set; }

        public string purchase_date { get; set; }

        public string item_name { get; set; }

        public string invoice_no { get; set; }

        public string invoice_date { get; set; }

        public string return_no { get; set; }

        public string return_date { get; set; }

        public int thirdPartyDebit_n_id { get; set; }

        public int purchase_n_id { get; set; }

        public int purchaseid { get; set; }

        public string ref_code { get; set; }

        public string si_code { get; set; }

        public int brandid { get; set; }

        public int itemid { get; set; }

        public string hsn_number { get; set; }

        public string price { get; set; }

        public string discount { get; set; }

        public string qty { get; set; }

        public string return_qty { get; set; }

        public string total { get; set; }

        public string return_total { get; set; }

        public string net_total { get; set; }

        public string return_net_total { get; set; }



    }
}


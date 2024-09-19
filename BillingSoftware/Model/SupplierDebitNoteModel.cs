using System.Collections.Generic;

namespace BillingSoftware.Model
{
    public class SupplierDebitNoteModel
    {
       public int s_debitid {  get; set; }

        public int purchaseid { get; set; }

        public int supplierid { get; set; }

        public string supplier_name { get; set; }

        public string supplier_bill_no { get; set; }

        public string date {  get; set; }

        public string return_no {  get; set; }

        public string return_date {  get; set; }

        public string brand_name {  get; set; }

        public string item_name {  get; set; }

        public string return_qty { get; set; }

        public string return_cgst_amount { get; set; }

        public string return_sgst_amount { get; set; }

        public string return_igst_amount { get; set; }

        public string return_total {  get; set; }

        public string invoice_no { get; set; }

        public string invoice_date { get; set; }

        public string gst_in { get; set; }

        public string address {  get; set; }

        public string state {  get; set; }

        public string state_code { get; set; }

        public string smgst_in { get; set; }

        public string balance { get; set; }

        public string total {  get; set; }

        public string return_totaln { get; set; }

        public int cuid { get; set; }

        public int companyid { get; set; }

        public List<SupplierDebit_NestedModel> SupplierDebit_nested { get; set; }


    }
    public class SupplierDebit_NestedModel
    {
        public int s_debitid_n_id { get; set; }

        public int s_debitid {  get; set; }

        public int purchase_n_id { get;  set; }

        public int purchaseid { get; set; }

        public int supplierid { get; set; }

        public string bill_no { get; set; }
        public string supplier_bill_no { get; set; }

        public string supplier_name { get; set; }

        public string date { get; set; }

        public string gst_in { get; set; }

        public string brand_name {  get; set; }

        public int brandid {  get; set; }

        public string item_name { get; set; }

        public int itemid { get; set; }

        public string hsn_number { get; set; }

        public string gst_percentage { get; set; }

        public string price { get; set; }

        public string discount { get; set; }

        public string qty { get; set; }

        public string return_qty {  get; set; }


        public string total { get; set; }

        public string return_total {  get; set; }


        public string rmpntotal {  get; set; }

        public string cgst_amount { get; set; }

        public string return_cgst_amount {  get; set; }

        public string sgst_amount { get; set; }

        public string return_sgst_amount { get; set; }

        public string igst_amount { get; set; }

        public string return_igst_amount { get; set; }


        public string net_total { get; set; }

        public string return_net_total { get;set; }



    }
}

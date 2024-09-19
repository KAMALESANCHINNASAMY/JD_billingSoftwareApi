using BillingSoftware.Helpers;
using BillingSoftware.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using System.Data;
using System;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;

namespace BillingSoftware.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ThirdPartyGstDebitController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;

        public ThirdPartyGstDebitController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<SalesBillingModel> Get_Maxid_third_partyPurchasegst_debit(int companyid)
        {
            DataTable dtData = null;
            List<SalesBillingModel> mItems = new List<SalesBillingModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_Maxid_third_partyPurchasegst_debit", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SalesBillingModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }


        [HttpGet]
        public List<ThirdPartyPurchaseModel> get_thirdparty_purchase_bythirdpartyid(int third_partyid, int companyid)
        {
            DataTable dtData = null;
            List<ThirdPartyPurchaseModel> mItems = new List<ThirdPartyPurchaseModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_thirdparty_purchase_bythirdpartyid", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@third_partyid", third_partyid);
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ThirdPartyPurchaseModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<thirdParty_Purchasegst_Debitnested_Model> get_third_partyPurchasegst_debit_nested(int thirdPartyDebitid)
        {
            DataTable dtData = null;
            List<thirdParty_Purchasegst_Debitnested_Model> mItems = new List<thirdParty_Purchasegst_Debitnested_Model>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_third_partyPurchasegst_debit_nested", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@thirdPartyDebitid", thirdPartyDebitid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<thirdParty_Purchasegst_Debitnested_Model>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }
        [HttpGet]
        public List<ThirdPartyPurchaseGstDebitModel> get_third_partyPurchasegst_debit(int companyid, string return_date)
        {
            DataTable dtData = null;
            List<ThirdPartyPurchaseGstDebitModel> mItems = new List<ThirdPartyPurchaseGstDebitModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_third_partyPurchasegst_debit", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@return_date", return_date);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ThirdPartyPurchaseGstDebitModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<ThirdPartyPurchaseNestedModel> Get_ThirdPartyPurchasegst_nestedBy_Si_code (int companyid, string si_code)
        {
            DataTable dtData = null;
            List<ThirdPartyPurchaseNestedModel> mItems = new List<ThirdPartyPurchaseNestedModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_ThirdPartyPurchasegst_nestedBy_Si_code", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@si_code", si_code);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ThirdPartyPurchaseNestedModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<ThirdPartyPurchaseNestedModel> Get_ThirdPartyPurchasegst_nestedBy_ref_code(int companyid, string ref_code)
        {
            DataTable dtData = null;
            List<ThirdPartyPurchaseNestedModel> mItems = new List<ThirdPartyPurchaseNestedModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_ThirdPartyPurchasegst_nestedBy_ref_code", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@ref_code", ref_code);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ThirdPartyPurchaseNestedModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_third_partyPurchasegst_debit")]
        public ResponseModel Insert_third_partyPurchasegst_debit(ThirdPartyPurchaseGstDebitModel newMat)
        {
            ResponseModel objmodel = new ResponseModel();
            string errorDesc = string.Empty;
            string errorCode = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlParameter outErrorCode = new SqlParameter("@o_ErrorCode", SqlDbType.Int) { Direction = ParameterDirection.Output };
                    SqlParameter outErrorDesc = new SqlParameter("@o_ErrorDescription", SqlDbType.VarChar, 5000) { Direction = ParameterDirection.Output };
                    if (newMat.thirdPartyDebitid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_third_partyPurchasegst_debit", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@thirdPartyDebitid", newMat.thirdPartyDebitid);
                        cmd.Parameters.AddWithValue("@third_partyid", newMat.third_partyid);
                        cmd.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                        cmd.Parameters.AddWithValue("@purchase_date", newMat.purchase_date);
                        cmd.Parameters.AddWithValue("@invoice_no", newMat.invoice_no);
                        cmd.Parameters.AddWithValue("@invoice_date", newMat.invoice_date);
                        cmd.Parameters.AddWithValue("@return_no", newMat.return_no);
                        cmd.Parameters.AddWithValue("@return_date", newMat.return_date);
                        cmd.Parameters.AddWithValue("@total", newMat.total);
                        cmd.Parameters.AddWithValue("@return_total", newMat.return_total);
                        cmd.Parameters.AddWithValue("@companyid", newMat.companyid);
                        cmd.Parameters.AddWithValue("@cuid", newMat.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newMat.purchaseid);
                        if (objmodel.status == "Saved successfully")
                        {
                            foreach (var assign in newMat.thirdPartyGst_Debit_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    if (assign.thirdPartyDebit_n_id > 0)
                                    {
                                        SqlCommand cmd1 = new SqlCommand("update_third_partyPurchasegst_debit_nested", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@thirdPartyDebit_n_id", assign.thirdPartyDebit_n_id);
                                        cmd1.Parameters.AddWithValue("@purchase_n_id", assign.purchase_n_id);
                                        cmd1.Parameters.AddWithValue("@purchaseid", assign.purchaseid);
                                        cmd1.Parameters.AddWithValue("@qty", assign.qty);
                                        cmd1.Parameters.AddWithValue("@return_qty", assign.return_qty);
                                        cmd1.Parameters.AddWithValue("@total", assign.total);
                                        cmd1.Parameters.AddWithValue("@return_total", assign.return_total);
                                        cmd1.Parameters.AddWithValue("@cgst_amount", assign.cgst_amount);
                                        cmd1.Parameters.AddWithValue("@return_cgst_amount", assign.return_cgst_amount);
                                        cmd1.Parameters.AddWithValue("@sgst_amount", assign.sgst_amount);
                                        cmd1.Parameters.AddWithValue("@return_sgst_amount", assign.return_sgst_amount);
                                        cmd1.Parameters.AddWithValue("@igst_amount", assign.igst_amount);
                                        cmd1.Parameters.AddWithValue("@return_igst_amount", assign.return_igst_amount);
                                        cmd1.Parameters.AddWithValue("@net_total", assign.net_total);
                                        cmd1.Parameters.AddWithValue("@return_net_total", assign.return_net_total);
                                        con11.Open();
                                        cmd1.ExecuteNonQuery();
                                    }
                                    else
                                    {
                                        SqlCommand cmd1 = new SqlCommand("Insert_third_partyPurchasegst_debit_nested", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@thirdPartyDebitid", objmodel.recordid);
                                        cmd1.Parameters.AddWithValue("@purchase_n_id", assign.purchase_n_id);
                                        cmd1.Parameters.AddWithValue("@purchaseid", assign.purchaseid);
                                        cmd1.Parameters.AddWithValue("@ref_code", assign.ref_code);
                                        cmd1.Parameters.AddWithValue("@si_code", assign.si_code);
                                        cmd1.Parameters.AddWithValue("@brandid", assign.brandid);
                                        cmd1.Parameters.AddWithValue("@itemid", assign.itemid);
                                        cmd1.Parameters.AddWithValue("@hsn_number", assign.hsn_number);
                                        cmd1.Parameters.AddWithValue("@gst_percentage", assign.gst_percentage);
                                        cmd1.Parameters.AddWithValue("@price", assign.price);
                                        cmd1.Parameters.AddWithValue("@discount", assign.discount);
                                        cmd1.Parameters.AddWithValue("@qty", assign.qty);
                                        cmd1.Parameters.AddWithValue("@return_qty", assign.return_qty);
                                        cmd1.Parameters.AddWithValue("@total", assign.total);
                                        cmd1.Parameters.AddWithValue("@return_total", assign.return_total);
                                        cmd1.Parameters.AddWithValue("@cgst_amount", assign.cgst_amount);
                                        cmd1.Parameters.AddWithValue("@return_cgst_amount", assign.return_cgst_amount);
                                        cmd1.Parameters.AddWithValue("@sgst_amount", assign.sgst_amount);
                                        cmd1.Parameters.AddWithValue("@return_sgst_amount", assign.return_sgst_amount);
                                        cmd1.Parameters.AddWithValue("@igst_amount", assign.igst_amount);
                                        cmd1.Parameters.AddWithValue("@return_igst_amount", assign.return_igst_amount);
                                        cmd1.Parameters.AddWithValue("@net_total", assign.net_total);
                                        cmd1.Parameters.AddWithValue("@return_net_total", assign.return_net_total);
                                        con11.Open();
                                        cmd1.ExecuteNonQuery();
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_third_partyPurchasegst_debit", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                        cmd.Parameters.AddWithValue("@third_partyid", newMat.third_partyid);
                        cmd.Parameters.AddWithValue("@purchase_date", newMat.purchase_date);
                        cmd.Parameters.AddWithValue("@invoice_no", newMat.invoice_no);
                        cmd.Parameters.AddWithValue("@invoice_date", newMat.invoice_date);
                        cmd.Parameters.AddWithValue("@return_no", newMat.return_no);
                        cmd.Parameters.AddWithValue("@return_date", newMat.return_date);
                        cmd.Parameters.AddWithValue("@total", newMat.total);
                        cmd.Parameters.AddWithValue("@return_total", newMat.return_total);
                        cmd.Parameters.AddWithValue("@companyid", newMat.companyid);
                        cmd.Parameters.AddWithValue("@cuid", newMat.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(errorCode);
                        if (objmodel.status == "Saved successfully")
                        {
                            foreach (var assign in newMat.thirdPartyGst_Debit_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("Insert_third_partyPurchasegst_debit_nested", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@thirdPartyDebitid", objmodel.recordid);
                                    cmd1.Parameters.AddWithValue("@purchase_n_id", assign.purchase_n_id);
                                    cmd1.Parameters.AddWithValue("@purchaseid", assign.purchaseid);
                                    cmd1.Parameters.AddWithValue("@ref_code", assign.ref_code);
                                    cmd1.Parameters.AddWithValue("@si_code", assign.si_code);
                                    cmd1.Parameters.AddWithValue("@brandid", assign.brandid);
                                    cmd1.Parameters.AddWithValue("@itemid", assign.itemid);
                                    cmd1.Parameters.AddWithValue("@hsn_number", assign.hsn_number);
                                    cmd1.Parameters.AddWithValue("@gst_percentage", assign.gst_percentage);
                                    cmd1.Parameters.AddWithValue("@price", assign.price);
                                    cmd1.Parameters.AddWithValue("@discount", assign.discount);
                                    cmd1.Parameters.AddWithValue("@qty", assign.qty);
                                    cmd1.Parameters.AddWithValue("@return_qty", assign.return_qty);
                                    cmd1.Parameters.AddWithValue("@total", assign.total);
                                    cmd1.Parameters.AddWithValue("@return_total", assign.return_total);
                                    cmd1.Parameters.AddWithValue("@cgst_amount", assign.cgst_amount);
                                    cmd1.Parameters.AddWithValue("@return_cgst_amount", assign.return_cgst_amount);
                                    cmd1.Parameters.AddWithValue("@sgst_amount", assign.sgst_amount);
                                    cmd1.Parameters.AddWithValue("@return_sgst_amount", assign.return_sgst_amount);
                                    cmd1.Parameters.AddWithValue("@igst_amount", assign.igst_amount);
                                    cmd1.Parameters.AddWithValue("@return_igst_amount", assign.return_igst_amount);
                                    cmd1.Parameters.AddWithValue("@net_total", assign.net_total);
                                    cmd1.Parameters.AddWithValue("@return_net_total", assign.return_net_total);
                                    con11.Open();
                                    cmd1.ExecuteNonQuery();
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                objmodel.Errormessg = ex.Message;
            }
            return objmodel;
        }
    }
}

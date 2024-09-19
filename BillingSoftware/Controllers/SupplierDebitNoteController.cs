using BillingSoftware.Helpers;
using BillingSoftware.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System.Collections.Generic;
using System.Data;
using System;

namespace BillingSoftware.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class SupplierDebitNoteController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        public SupplierDebitNoteController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<SupplierDebitNoteModel> Get_supplier_debit_note(int companyid, string return_date)
        {
            DataTable dtData = null;
            List<SupplierDebitNoteModel> mItems = new List<SupplierDebitNoteModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_supplier_debit_note", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@return_date", return_date);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SupplierDebitNoteModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return mItems;
        }

        [HttpGet]
        public List<SupplierDebitNoteModel> Get_Maxid_supplier_debit_note(int companyid)
        {
            DataTable dtData = null;
            List<SupplierDebitNoteModel> mItems = new List<SupplierDebitNoteModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_Maxid_supplier_debit_note", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);                    
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SupplierDebitNoteModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return mItems;
        }

        [HttpGet]
        public List<SupplierDebit_NestedModel> get_supplier_debit_note_nested(int s_debitid)
        {
            DataTable dtData = null;
            List<SupplierDebit_NestedModel> mItems = new List<SupplierDebit_NestedModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_supplier_debit_note_nested", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@s_debitid", s_debitid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SupplierDebit_NestedModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<SupplierDebit_NestedModel> get_rawmaterial_purchase_by_supplier_bill_no(int companyid, int purchaseid)
        {
            DataTable dtData = null;
            List<SupplierDebit_NestedModel> mItems = new List<SupplierDebit_NestedModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_rawmaterial_purchase_by_supplier_bill_no", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@purchaseid", purchaseid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SupplierDebit_NestedModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<RawMaterialPurchaseModel> get_supplierbno_by_supid(int companyid, int supplierid)
        {
            DataTable dtData = null;
            List<RawMaterialPurchaseModel> mItems = new List<RawMaterialPurchaseModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_supplierbno_by_supid", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@supplierid", supplierid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<RawMaterialPurchaseModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }
        [HttpPost]
        [ActionName("Insert_supplier_debit_note")]
        public ResponseModel Insert_supplier_debit_note(SupplierDebitNoteModel newMat)
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
                    if (newMat.s_debitid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_supplier_debit_note", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@s_debitid", newMat.s_debitid);
                        cmd.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                        cmd.Parameters.AddWithValue("@supplierid", newMat.supplierid);
                        cmd.Parameters.AddWithValue("@supplier_bill_no", newMat.supplier_bill_no);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@return_no", newMat.return_no);
                        cmd.Parameters.AddWithValue("@return_date", newMat.return_date);
                        cmd.Parameters.AddWithValue("@total", newMat.total);
                        cmd.Parameters.AddWithValue("@return_total", newMat.return_total);
                        cmd.Parameters.AddWithValue("@gst_in", newMat.gst_in);
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
                            foreach (var assign in newMat.SupplierDebit_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    if (assign.s_debitid_n_id > 0)
                                    {
                                        SqlCommand cmd1 = new SqlCommand("Update_supplier_debit_note_nested", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@purchase_n_id", assign.purchase_n_id);
                                        cmd1.Parameters.AddWithValue("@s_debitid_n_id", assign.s_debitid_n_id);
                                        cmd1.Parameters.AddWithValue("@s_debitid", assign.s_debitid);
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
                                        SqlCommand cmd1 = new SqlCommand("Insert_supplier_debit_note_nested", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@s_debitid", newMat.s_debitid);
                                        cmd1.Parameters.AddWithValue("@purchase_n_id", assign.purchase_n_id);
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
                        SqlCommand cmd = new SqlCommand("Insert_supplier_debit_note", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                        cmd.Parameters.AddWithValue("@supplierid", newMat.supplierid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@supplier_bill_no", newMat.supplier_bill_no);
                        cmd.Parameters.AddWithValue("@return_no", newMat.return_no);
                        cmd.Parameters.AddWithValue("@return_date", newMat.return_date);
                        cmd.Parameters.AddWithValue("@total", newMat.total);
                        cmd.Parameters.AddWithValue("@return_total", newMat.return_total);
                        cmd.Parameters.AddWithValue("@gst_in", newMat.gst_in);
                        cmd.Parameters.AddWithValue("@cuid", newMat.cuid);
                        cmd.Parameters.AddWithValue("@companyid", newMat.companyid);
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
                            foreach (var assign in newMat.SupplierDebit_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("Insert_supplier_debit_note_nested", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@s_debitid", objmodel.recordid);
                                    cmd1.Parameters.AddWithValue("@purchase_n_id", assign.purchase_n_id);
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

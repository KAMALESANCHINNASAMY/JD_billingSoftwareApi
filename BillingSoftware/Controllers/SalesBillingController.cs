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
    public class SalesBillingController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;

        public SalesBillingController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<StockTableModel> get_stock_table_by_SiCode(int companyid, string si_code)
        {
            DataTable dtData = null;
            List<StockTableModel> mItems = new List<StockTableModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_stock_table_by_SiCode", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@si_code", si_code);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<StockTableModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<StockTableModel> get_stock_table_by_refcode(int companyid, string ref_code)
        {
            DataTable dtData = null;
            List<StockTableModel> mItems = new List<StockTableModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_stock_table_by_refcode", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@ref_code", ref_code);
                    con.Open(); 
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<StockTableModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<SalesBillingModel> Get_Maxid_sales_billing(int companyid)
        {
            DataTable dtData = null;
            List<SalesBillingModel> mItems = new List<SalesBillingModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_Maxid_sales_billing", con);
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
        public List<SalesBillingModel> get_sales_billing(int companyid,string date)
        {
            DataTable dtData = null;
            List<SalesBillingModel> mItems = new List<SalesBillingModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_sales_billing", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@date", date);
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
        public List<StockTableModel> get_sales_billing_nested(int entryid)
        {
            DataTable dtData = null;
            List<StockTableModel> mItems = new List<StockTableModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_sales_billing_nested", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@entryid", entryid);                    
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<StockTableModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }



        [HttpPost]
        [ActionName("Insert_sales_billing")]
        public ResponseModel Insert_sales_billing(SalesBillingModel newMat)
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
                    if (newMat.entryid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_sales_billing", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@entryid", newMat.entryid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@customerid", newMat.customerid);
                        cmd.Parameters.AddWithValue("@credit_days", newMat.credit_days);
                        cmd.Parameters.AddWithValue("@balance", newMat.balance);
                        cmd.Parameters.AddWithValue("@billing_address", newMat.billing_address);
                        cmd.Parameters.AddWithValue("@shipping_address", newMat.shipping_address);
                        cmd.Parameters.AddWithValue("@total", newMat.total);
                        cmd.Parameters.AddWithValue("@companyid", newMat.companyid);
                        cmd.Parameters.AddWithValue("@cuid", newMat.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newMat.entryid);
                        if (objmodel.status == "Saved successfully")
                        {
                            foreach (var assign in newMat.sales_bill_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    //if (assign.entry_n_id > 0)
                                    //{
                                    //    SqlCommand cmd1 = new SqlCommand("update_sales_billing_nested", con11);
                                    //    cmd1.CommandType = CommandType.StoredProcedure;
                                    //    cmd1.Parameters.AddWithValue("@entry_n_id", assign.entry_n_id);
                                    //    cmd1.Parameters.AddWithValue("@entryid", newMat.entryid);
                                    //    cmd1.Parameters.AddWithValue("@stockid", assign.stockid);
                                    //    cmd1.Parameters.AddWithValue("@ref_code", assign.ref_code);
                                    //    cmd1.Parameters.AddWithValue("@si_code", assign.si_code);
                                    //    cmd1.Parameters.AddWithValue("@brandid", assign.brandid);
                                    //    cmd1.Parameters.AddWithValue("@itemid", assign.itemid);
                                    //    cmd1.Parameters.AddWithValue("@hsn_number", assign.hsn_number);
                                    //    cmd1.Parameters.AddWithValue("@gst_percentage", assign.gst_percentage);
                                    //    cmd1.Parameters.AddWithValue("@price", assign.price);
                                    //    cmd1.Parameters.AddWithValue("@discount", assign.discount);
                                    //    cmd1.Parameters.AddWithValue("@qty", assign.qty);
                                    //    cmd1.Parameters.AddWithValue("@total", assign.total);
                                    //    cmd1.Parameters.AddWithValue("@cgst_amount", assign.cgst_amount);
                                    //    cmd1.Parameters.AddWithValue("@sgst_amount", assign.sgst_amount);
                                    //    cmd1.Parameters.AddWithValue("@igst_amount", assign.igst_amount);
                                    //    cmd1.Parameters.AddWithValue("@net_total", assign.net_total);
                                    //    con11.Open();
                                    //    cmd1.ExecuteNonQuery();
                                    //}
                                    //else
                                    //{
                                        SqlCommand cmd1 = new SqlCommand("Insert_sales_billing_nested", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@entryid", objmodel.recordid);
                                        cmd1.Parameters.AddWithValue("@stockid", assign.stockid);
                                        cmd1.Parameters.AddWithValue("@ref_code", assign.ref_code);
                                        cmd1.Parameters.AddWithValue("@si_code", assign.si_code);
                                        cmd1.Parameters.AddWithValue("@brandid", assign.brandid);
                                        cmd1.Parameters.AddWithValue("@itemid", assign.itemid);
                                        cmd1.Parameters.AddWithValue("@hsn_number", assign.hsn_number);
                                        cmd1.Parameters.AddWithValue("@gst_percentage", assign.gst_percentage);
                                        cmd1.Parameters.AddWithValue("@price", assign.price);
                                        cmd1.Parameters.AddWithValue("@discount", assign.discount);
                                        cmd1.Parameters.AddWithValue("@qty", assign.qty);
                                        cmd1.Parameters.AddWithValue("@total", assign.total);
                                        cmd1.Parameters.AddWithValue("@cgst_amount", assign.cgst_amount);
                                        cmd1.Parameters.AddWithValue("@sgst_amount", assign.sgst_amount);
                                        cmd1.Parameters.AddWithValue("@igst_amount", assign.igst_amount);
                                        cmd1.Parameters.AddWithValue("@net_total", assign.net_total);
                                        con11.Open();
                                        cmd1.ExecuteNonQuery();
                                   // }
                                }
                            }
                        }
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_sales_billing", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@customerid", newMat.customerid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@bill_no", newMat.bill_no);
                        cmd.Parameters.AddWithValue("@credit_days", newMat.credit_days);
                        cmd.Parameters.AddWithValue("@balance", newMat.balance);
                        cmd.Parameters.AddWithValue("@billing_address", newMat.billing_address);
                        cmd.Parameters.AddWithValue("@shipping_address", newMat.shipping_address);
                        cmd.Parameters.AddWithValue("@total", newMat.total);
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
                            foreach (var assign in newMat.sales_bill_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("Insert_sales_billing_nested", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@entryid", objmodel.recordid);
                                    cmd1.Parameters.AddWithValue("@stockid", assign.stockid);
                                    cmd1.Parameters.AddWithValue("@ref_code", assign.ref_code);
                                    cmd1.Parameters.AddWithValue("@si_code", assign.si_code);
                                    cmd1.Parameters.AddWithValue("@brandid", assign.brandid);
                                    cmd1.Parameters.AddWithValue("@itemid", assign.itemid);
                                    cmd1.Parameters.AddWithValue("@hsn_number", assign.hsn_number);
                                    cmd1.Parameters.AddWithValue("@gst_percentage", assign.gst_percentage);
                                    cmd1.Parameters.AddWithValue("@price", assign.price);
                                    cmd1.Parameters.AddWithValue("@discount", assign.discount);
                                    cmd1.Parameters.AddWithValue("@qty", assign.qty);
                                    cmd1.Parameters.AddWithValue("@total", assign.total);
                                    cmd1.Parameters.AddWithValue("@cgst_amount", assign.cgst_amount);
                                    cmd1.Parameters.AddWithValue("@sgst_amount", assign.sgst_amount);
                                    cmd1.Parameters.AddWithValue("@igst_amount", assign.igst_amount);
                                    cmd1.Parameters.AddWithValue("@net_total", assign.net_total);                                   
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

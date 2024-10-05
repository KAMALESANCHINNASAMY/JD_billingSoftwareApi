using BillingSoftware.Helpers;
using BillingSoftware.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System;
using Microsoft.Extensions.Options;

namespace BillingSoftware.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class PurchaseFromThirdPartyController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        public PurchaseFromThirdPartyController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<saleProductsModel> get_Maxid_purchase_from_thirdparty(int companyid)
        {
            DataTable dtData = null;
            List<saleProductsModel> mItems = new List<saleProductsModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_Maxid_purchase_from_thirdparty", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<saleProductsModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }
        [HttpGet]
        public List<saleProductsModel> get_purchase_from_thirdparty(int companyid, string date)
        {
            DataTable dtData = null;
            List<saleProductsModel> mItems = new List<saleProductsModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_purchase_from_thirdparty", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@date", date);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<saleProductsModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<saleProductsModelNested> get_purchase_from_thirdparty_nested(int purchaseid)
        {
            DataTable dtData = null;
            List<saleProductsModelNested> mItems = new List<saleProductsModelNested>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_purchase_from_thirdparty_nested", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@purchaseid", purchaseid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<saleProductsModelNested>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_purchase_from_thirdparty")]
        public ResponseModel Insert_purchase_from_thirdparty(saleProductsModel newMat)
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
                    if (newMat.purchaseid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_purchase_from_thirdparty", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                        cmd.Parameters.AddWithValue("@third_partyid", newMat.third_partyid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@bill_no", newMat.bill_no);                        
                        cmd.Parameters.AddWithValue("@total", newMat.total);
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
                            foreach (var assign in newMat.sale_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("Insert_purchase_from_thirdparty_nested", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                                    cmd1.Parameters.AddWithValue("@productid", assign.productid);
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
                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_purchase_from_thirdparty", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@third_partyid", newMat.third_partyid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@bill_no", newMat.bill_no);                        
                        cmd.Parameters.AddWithValue("@total", newMat.total);
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
                            foreach (var assign in newMat.sale_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("Insert_purchase_from_thirdparty_nested", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@purchaseid", objmodel.recordid);
                                    cmd1.Parameters.AddWithValue("@productid", assign.productid);
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


        [HttpDelete]
        [ActionName("Delete_purchase_from_thirdparty")]
        public ResponseModel Delete_purchase_from_thirdparty(int purchaseid)
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

                    SqlCommand cmd = new SqlCommand("Delete_purchase_from_thirdparty", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@purchaseid", purchaseid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(purchaseid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }
    }
}

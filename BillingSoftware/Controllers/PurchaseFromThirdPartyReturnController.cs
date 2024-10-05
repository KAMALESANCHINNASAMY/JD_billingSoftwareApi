﻿using BillingSoftware.Helpers;
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
    public class PurchaseFromThirdPartyReturnController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        private string errorCode;
        private object errorDesc;
        public PurchaseFromThirdPartyReturnController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            appSettings = appSettings;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<ReturnSalesProductModel> get_purchase_from_thirdpartybyid(int companyid, int third_partyid)
        {
            DataTable dtData = null;
            List<ReturnSalesProductModel> mItems = new List<ReturnSalesProductModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_purchase_from_thirdpartybyid", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@third_partyid", third_partyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ReturnSalesProductModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<ReturnSalesProductModel> get_Maxid_return_purchase_from_thirdparty(int companyid)
        {
            DataTable dtData = null;
            List<ReturnSalesProductModel> mItems = new List<ReturnSalesProductModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_Maxid_return_purchase_from_thirdparty", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ReturnSalesProductModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<ReturnSalesProductModel> get_return_purchase_from_thirdparty(int companyid, string return_date)
        {
            DataTable dtData = null;
            List<ReturnSalesProductModel> mItems = new List<ReturnSalesProductModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_return_purchase_from_thirdparty", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@return_date", return_date);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ReturnSalesProductModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<NestedReturnSalesProductModel> get_return_purchase_from_thirdparty_nested(int returnid)
        {
            DataTable dtData = null;
            List<NestedReturnSalesProductModel> mItems = new List<NestedReturnSalesProductModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_return_purchase_from_thirdparty_nested", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@returnid", returnid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<NestedReturnSalesProductModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_return_purchase_from_thirdparty")]
        public ResponseModel Insert_return_purchase_from_thirdparty(ReturnSalesProductModel newMat)
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
                    if (newMat.returnid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("update_return_purchase_from_thirdparty", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@returnid", newMat.returnid);
                        cmd.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                        cmd.Parameters.AddWithValue("@bill_no", newMat.bill_no);
                        cmd.Parameters.AddWithValue("@return_no", newMat.return_no);
                        cmd.Parameters.AddWithValue("@return_date", newMat.return_date);
                        cmd.Parameters.AddWithValue("@return_total", newMat.return_total);
                        cmd.Parameters.AddWithValue("@cuid", newMat.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newMat.returnid);
                        if (objmodel.status == "Saved successfully")
                        {
                            foreach (var assign in newMat.salesProduct_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("Insert_return_purchase_from_thirdparty_nested", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@returnid", objmodel.recordid);
                                    cmd1.Parameters.AddWithValue("@purchase_n_id", assign.purchase_n_id);
                                    cmd1.Parameters.AddWithValue("@productid", assign.productid);
                                    cmd1.Parameters.AddWithValue("@gst_percentage", assign.gst_percentage);
                                    cmd1.Parameters.AddWithValue("@price", assign.price);
                                    cmd1.Parameters.AddWithValue("@discount", assign.discount);
                                    cmd1.Parameters.AddWithValue("@qty", assign.qty);
                                    cmd1.Parameters.AddWithValue("@ret_qty", assign.ret_qty);
                                    cmd1.Parameters.AddWithValue("@total", assign.total);
                                    cmd1.Parameters.AddWithValue("@ret_total", assign.ret_total);
                                    cmd1.Parameters.AddWithValue("@cgst_amount", assign.cgst_amount);
                                    cmd1.Parameters.AddWithValue("@ret_cgst_amount", assign.ret_cgst_amount);
                                    cmd1.Parameters.AddWithValue("@sgst_amount", assign.sgst_amount);
                                    cmd1.Parameters.AddWithValue("@ret_sgst_amount", assign.ret_sgst_amount);
                                    cmd1.Parameters.AddWithValue("@igst_amount", assign.igst_amount);
                                    cmd1.Parameters.AddWithValue("@ret_igst_amount", assign.ret_igst_amount);
                                    cmd1.Parameters.AddWithValue("@net_total", assign.net_total);
                                    cmd1.Parameters.AddWithValue("@ret_net_total", assign.ret_net_total);
                                    con11.Open();
                                    cmd1.ExecuteNonQuery();
                                }
                            }
                        }
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_return_purchase_from_thirdparty", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                        cmd.Parameters.AddWithValue("@third_partyid", newMat.third_partyid);
                        cmd.Parameters.AddWithValue("@bill_no", newMat.bill_no);
                        cmd.Parameters.AddWithValue("@return_no", newMat.return_no);
                        cmd.Parameters.AddWithValue("@return_date", newMat.return_date);
                        cmd.Parameters.AddWithValue("@return_total", newMat.return_total);
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
                            foreach (var assign in newMat.salesProduct_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("Insert_return_purchase_from_thirdparty_nested", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@returnid", objmodel.recordid);
                                    cmd1.Parameters.AddWithValue("@purchase_n_id", assign.purchase_n_id);
                                    cmd1.Parameters.AddWithValue("@productid", assign.productid);
                                    cmd1.Parameters.AddWithValue("@gst_percentage", assign.gst_percentage);
                                    cmd1.Parameters.AddWithValue("@price", assign.price);
                                    cmd1.Parameters.AddWithValue("@discount", assign.discount);
                                    cmd1.Parameters.AddWithValue("@qty", assign.qty);
                                    cmd1.Parameters.AddWithValue("@ret_qty", assign.ret_qty);
                                    cmd1.Parameters.AddWithValue("@total", assign.total);
                                    cmd1.Parameters.AddWithValue("@ret_total", assign.ret_total);
                                    cmd1.Parameters.AddWithValue("@cgst_amount", assign.cgst_amount);
                                    cmd1.Parameters.AddWithValue("@ret_cgst_amount", assign.ret_cgst_amount);
                                    cmd1.Parameters.AddWithValue("@sgst_amount", assign.sgst_amount);
                                    cmd1.Parameters.AddWithValue("@ret_sgst_amount", assign.ret_sgst_amount);
                                    cmd1.Parameters.AddWithValue("@igst_amount", assign.igst_amount);
                                    cmd1.Parameters.AddWithValue("@ret_igst_amount", assign.ret_igst_amount);
                                    cmd1.Parameters.AddWithValue("@net_total", assign.net_total);
                                    cmd1.Parameters.AddWithValue("@ret_net_total", assign.ret_net_total);
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

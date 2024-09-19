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
    public class CustomerMasterController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        public CustomerMasterController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<CustomerMasterModel> get_customer_master(int companyid)
        {
            DataTable dtData = null;
            List<CustomerMasterModel> mItems = new List<CustomerMasterModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_customer_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<CustomerMasterModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<customerAdvanceModel> get_customer_advance(int customerid)
        {
            DataTable dtData = null;
            List<customerAdvanceModel> mItems = new List<customerAdvanceModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_customer_advance", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@customerid", customerid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<customerAdvanceModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_customer_master")]
        public ResponseModel Insert_customer_master(CustomerMasterModel newObj)
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
                    if (newObj.customerid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("update_customer_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@customerid", newObj.customerid);
                        cmd.Parameters.AddWithValue("@customer_name", newObj.customer_name);
                        cmd.Parameters.AddWithValue("@mobile_no", newObj.mobile_no);
                        cmd.Parameters.AddWithValue("@state", newObj.state);
                        cmd.Parameters.AddWithValue("@state_code", newObj.state_code);
                        cmd.Parameters.AddWithValue("@gst_in", newObj.gst_in);
                        cmd.Parameters.AddWithValue("@balance", newObj.balance);
                        cmd.Parameters.AddWithValue("@address", newObj.address);
                        cmd.Parameters.AddWithValue("@shipping_address", newObj.shipping_address);
                        cmd.Parameters.AddWithValue("@companyid", newObj.companyid);
                        cmd.Parameters.AddWithValue("@cuid", newObj.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newObj.customerid);

                        if (objmodel.status == "Saved successfully")
                        {
                            foreach (var advan in newObj.customeradvance)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    if (advan.advanceid > 0)
                                    {
                                        SqlCommand cmd1 = new SqlCommand("update_customer_advance", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@advanceid", advan.advanceid);
                                        cmd1.Parameters.AddWithValue("@customerid", newObj.customerid);
                                        cmd1.Parameters.AddWithValue("@date", advan.date);
                                        cmd1.Parameters.AddWithValue("@advance_amount", advan.advance_amount);
                                        cmd1.Parameters.AddWithValue("@description", advan.description);
                                        con11.Open();
                                        cmd1.ExecuteNonQuery();
                                    }
                                    else
                                    {
                                        SqlCommand cmd1 = new SqlCommand("insert_customer_advance", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@customerid", objmodel.recordid);
                                        cmd1.Parameters.AddWithValue("@date", advan.date);
                                        cmd1.Parameters.AddWithValue("@advance_amount", advan.advance_amount);
                                        cmd1.Parameters.AddWithValue("@description", advan.description);
                                        con11.Open();
                                        cmd1.ExecuteNonQuery();
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_customer_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@customer_name", newObj.customer_name);
                        cmd.Parameters.AddWithValue("@mobile_no", newObj.mobile_no);
                        cmd.Parameters.AddWithValue("@state", newObj.state);
                        cmd.Parameters.AddWithValue("@state_code", newObj.state_code);
                        cmd.Parameters.AddWithValue("@gst_in", newObj.gst_in);
                        cmd.Parameters.AddWithValue("@balance", newObj.balance);
                        cmd.Parameters.AddWithValue("@address", newObj.address);
                        cmd.Parameters.AddWithValue("@shipping_address", newObj.shipping_address);
                        cmd.Parameters.AddWithValue("@companyid", newObj.companyid);
                        cmd.Parameters.AddWithValue("@cuid", newObj.cuid);
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
                            foreach (var advan in newObj.customeradvance)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("insert_customer_advance", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@customerid", objmodel.recordid);
                                    cmd1.Parameters.AddWithValue("@date", advan.date);
                                    cmd1.Parameters.AddWithValue("@advance_amount", advan.advance_amount);
                                    cmd1.Parameters.AddWithValue("@description", advan.description);
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

            }
            return objmodel;
        }


        [HttpDelete]
        [ActionName("delete_customer_master")]
        public ResponseModel delete_customer_master(int customerid)
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

                    SqlCommand cmd = new SqlCommand("delete_customer_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@customerid", customerid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(customerid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }
    }
}


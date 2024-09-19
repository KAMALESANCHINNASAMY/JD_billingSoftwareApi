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
    public class CustomerPaymentController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;

        public CustomerPaymentController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<CustomerPaymentNestedModel> get_customer_Payment_details(int customerid)
        {
            DataTable dtData = null;
            List<CustomerPaymentNestedModel> mItems = new List<CustomerPaymentNestedModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_customer_Payment_details", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@customerid", customerid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<CustomerPaymentNestedModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }


        [HttpPost]
        [ActionName("Insert_customer_payment")]
        public ResponseModel Insert_customer_payment(CustomerPaymentModel newMat)
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

                    SqlCommand cmd = new SqlCommand("Insert_customer_payment", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@customerid", newMat.customerid);
                    cmd.Parameters.AddWithValue("@date", newMat.date);
                    cmd.Parameters.AddWithValue("@balance", newMat.balance);
                    cmd.Parameters.AddWithValue("@amount_mode", newMat.amount_mode);
                    cmd.Parameters.AddWithValue("@payment_type", newMat.payment_type);
                    cmd.Parameters.AddWithValue("@cheque_no", newMat.cheque_no);
                    cmd.Parameters.AddWithValue("@c_date", newMat.c_date);
                    cmd.Parameters.AddWithValue("@c_amount", newMat.c_amount);
                    cmd.Parameters.AddWithValue("@advanceid", newMat.advanceid);
                    cmd.Parameters.AddWithValue("@adnp_amount", newMat.adnp_amount);
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
                        foreach (var assign in newMat.customerpayment_nested)
                        {
                            using (SqlConnection con11 = new SqlConnection(Conn))
                            {
                                SqlCommand cmd1 = new SqlCommand("Insert_customer_payment_nested", con11);
                                cmd1.CommandType = CommandType.StoredProcedure;
                                cmd1.Parameters.AddWithValue("@paymentid", objmodel.recordid);
                                cmd1.Parameters.AddWithValue("@entryid", assign.entryid);
                                cmd1.Parameters.AddWithValue("@customerid", assign.customerid);
                                cmd1.Parameters.AddWithValue("@total_amount", assign.total_amount);
                                cmd1.Parameters.AddWithValue("@deduction_amount", assign.deduction_amount);
                                cmd1.Parameters.AddWithValue("@gst", assign.gst);
                                cmd1.Parameters.AddWithValue("@non_gst", assign.non_gst);
                                cmd1.Parameters.AddWithValue("@isbal", assign.isbal);
                                con11.Open();
                                cmd1.ExecuteNonQuery();
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


        [HttpGet]
        public List<CustomerPaymentModel> get_customer_payment(string fromdate, string todate, int customerid, int companyid)
        {
            DataTable dtData = null;
            List<CustomerPaymentModel> mItems = new List<CustomerPaymentModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_customer_payment", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@customerid", customerid);
                    cmd.Parameters.AddWithValue("@fromdate", fromdate);
                    cmd.Parameters.AddWithValue("@todate", todate);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<CustomerPaymentModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpDelete]
        [ActionName("delete_customer_payment")]
        public ResponseModel delete_customer_payment(int paymentid)
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

                    SqlCommand cmd = new SqlCommand("delete_customer_payment", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@paymentid", paymentid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(paymentid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }
    }
}

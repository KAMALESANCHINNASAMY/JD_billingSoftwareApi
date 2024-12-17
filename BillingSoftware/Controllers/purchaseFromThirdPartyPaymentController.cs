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
    public class purchaseFromThirdPartyPaymentController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;

        public purchaseFromThirdPartyPaymentController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<ThirdPartyPaymentNestedModel> get_purchase_from_thirdparty_payment_details(int third_partyid)
        {
            DataTable dtData = null;
            List<ThirdPartyPaymentNestedModel> mItems = new List<ThirdPartyPaymentNestedModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_purchase_from_thirdparty_payment_details", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@third_partyid", third_partyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ThirdPartyPaymentNestedModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_purchase_from_thirdparty_payment")]
        public ResponseModel Insert_purchase_from_thirdparty_payment(List<ThirdPartyPaymentModel> newMat)
        {
            ResponseModel objmodel = new ResponseModel();
            string errorDesc = string.Empty;
            string errorCode = string.Empty;
            try
            {
                foreach (var assign in newMat)
                {
                    using (SqlConnection con = new SqlConnection(Conn))
                    {
                        SqlParameter outErrorCode = new SqlParameter("@o_ErrorCode", SqlDbType.Int) { Direction = ParameterDirection.Output };
                        SqlParameter outErrorDesc = new SqlParameter("@o_ErrorDescription", SqlDbType.VarChar, 5000) { Direction = ParameterDirection.Output };

                        SqlCommand cmd = new SqlCommand("Insert_purchase_from_thirdparty_payment", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@third_partyid", assign.third_partyid);
                        cmd.Parameters.AddWithValue("@date", assign.date);
                        cmd.Parameters.AddWithValue("@bankid", assign.bankid);
                        cmd.Parameters.AddWithValue("@amount", assign.amount);
                        cmd.Parameters.AddWithValue("@description", assign.description);
                        cmd.Parameters.AddWithValue("@companyid", assign.companyid);
                        cmd.Parameters.AddWithValue("@cuid", assign.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(errorCode);
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
        public List<ThirdPartyPaymentModel> get_purchase_from_thirdparty_payment(string fromdate, string todate, int third_partyid, int companyid)
        {
            DataTable dtData = null;
            List<ThirdPartyPaymentModel> mItems = new List<ThirdPartyPaymentModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_purchase_from_thirdparty_payment", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@third_partyid", third_partyid);
                    cmd.Parameters.AddWithValue("@fromdate", fromdate);
                    cmd.Parameters.AddWithValue("@todate", todate);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ThirdPartyPaymentModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }


        [HttpDelete]
        [ActionName("delete_purchase_from_thirdparty_payment")]
        public ResponseModel delete_purchase_from_thirdparty_payment(int paymentid)
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

                    SqlCommand cmd = new SqlCommand("delete_purchase_from_thirdparty_payment", con);
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

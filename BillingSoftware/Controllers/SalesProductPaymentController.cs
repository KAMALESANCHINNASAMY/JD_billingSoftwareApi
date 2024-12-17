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
    public class SalesProductPaymentController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;

        public SalesProductPaymentController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<CustomerPaymentNestedModel> get_sales_product_payment_details(int customerid)
        {
            DataTable dtData = null;
            List<CustomerPaymentNestedModel> mItems = new List<CustomerPaymentNestedModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_sales_product_payment_details", con);
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
        [ActionName("Insert_sales_product_payment")]
        public ResponseModel Insert_sales_product_payment(List<CustomerPaymentModel> newMat)
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

                        SqlCommand cmd = new SqlCommand("Insert_sales_product_payment", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@customerid", assign.customerid);
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
    }
}

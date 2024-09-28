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
    public class ExpenseMasterController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        public ExpenseMasterController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<ExpenseMasterModel> get_expense_master(int companyid)
        {
            DataTable dtData = null;
            List<ExpenseMasterModel> mItems = new List<ExpenseMasterModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_expense_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ExpenseMasterModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_expense_master")]
        public ResponseModel Insert_expense_master(ExpenseMasterModel newObj)
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
                    if (newObj.expenseid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_expense_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@expenseid", newObj.expenseid);
                        cmd.Parameters.AddWithValue("@expense_name", newObj.expense_name);
                        cmd.Parameters.AddWithValue("@companyid", newObj.companyid);
                        cmd.Parameters.AddWithValue("@cuid", newObj.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newObj.expenseid);
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_expense_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@expense_name", newObj.expense_name);
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
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }


        [HttpDelete]
        [ActionName("Delete_expense_master")]
        public ResponseModel Delete_expense_master(int expenseid)
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

                    SqlCommand cmd = new SqlCommand("Delete_expense_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@expenseid", expenseid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(expenseid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }
    }
}

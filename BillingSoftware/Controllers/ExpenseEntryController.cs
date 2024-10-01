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
    public class ExpenseEntryController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        public ExpenseEntryController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<ExpenseEntryModel> get_expense_entry(int companyid,string date)
        {
            DataTable dtData = null;
            List<ExpenseEntryModel> mItems = new List<ExpenseEntryModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_expense_entry", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@date", date);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ExpenseEntryModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_expense_entry")]
        public ResponseModel Insert_expense_entry(List<ExpenseEntryModel> newList)
        {
            ResponseModel objmodel = new ResponseModel();
            string errorDesc = string.Empty;
            string errorCode = string.Empty;
            try
            {
                foreach (var newObj in newList)
                {
                    using (SqlConnection con = new SqlConnection(Conn))
                    {
                        SqlParameter outErrorCode = new SqlParameter("@o_ErrorCode", SqlDbType.Int) { Direction = ParameterDirection.Output };
                        SqlParameter outErrorDesc = new SqlParameter("@o_ErrorDescription", SqlDbType.VarChar, 5000) { Direction = ParameterDirection.Output };

                        if (newObj.entryid > 0)
                        {
                            SqlCommand cmd = new SqlCommand("Update_expense_entry", con);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@entryid", newObj.entryid);
                            cmd.Parameters.AddWithValue("@expenseid", newObj.expenseid);
                            cmd.Parameters.AddWithValue("@amount", newObj.amount);
                            cmd.Parameters.AddWithValue("@date", newObj.date);
                            cmd.Parameters.AddWithValue("@description", newObj.description);
                            cmd.Parameters.AddWithValue("@issale_am", newObj.issale_am);
                            cmd.Parameters.AddWithValue("@ishand_cash_am", newObj.ishand_cash_am);
                            cmd.Parameters.AddWithValue("@isbank_am", newObj.isbank_am);
                            cmd.Parameters.AddWithValue("@bankid", newObj.bankid);
                            cmd.Parameters.AddWithValue("@companyid", newObj.companyid);
                            cmd.Parameters.AddWithValue("@cuid", newObj.cuid);
                            cmd.Parameters.Add(outErrorCode);
                            cmd.Parameters.Add(outErrorDesc);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            errorCode = outErrorCode.Value.ToString();
                            errorDesc = outErrorDesc.Value.ToString();
                            objmodel.status = errorDesc;
                            objmodel.recordid = Convert.ToInt32(newObj.entryid);
                        }
                        else
                        {
                            SqlCommand cmd = new SqlCommand("Insert_expense_entry", con);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@expenseid", newObj.expenseid);
                            cmd.Parameters.AddWithValue("@amount", newObj.amount);
                            cmd.Parameters.AddWithValue("@date", newObj.date);
                            cmd.Parameters.AddWithValue("@description", newObj.description);
                            cmd.Parameters.AddWithValue("@issale_am", newObj.issale_am);
                            cmd.Parameters.AddWithValue("@ishand_cash_am", newObj.ishand_cash_am);
                            cmd.Parameters.AddWithValue("@isbank_am", newObj.isbank_am);
                            cmd.Parameters.AddWithValue("@bankid", newObj.bankid);
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
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }

        [HttpDelete]
        [ActionName("Delete_expense_entry")]
        public ResponseModel Delete_expense_entry(int entryid)
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

                    SqlCommand cmd = new SqlCommand("Delete_expense_entry", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@entryid", entryid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(entryid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }
    }
}

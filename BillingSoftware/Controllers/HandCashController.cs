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
    public class HandCashController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        public HandCashController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<HandCashModel> get_hand_cash_entry(int companyid)
        {
            DataTable dtData = null;
            List<HandCashModel> mItems = new List<HandCashModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_hand_cash_entry", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<HandCashModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_hand_cash_entry")]
        public ResponseModel Insert_hand_cash_entry(HandCashModel newObj)
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
                    if (newObj.cashid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_hand_cash_entry", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@cashid", newObj.cashid);
                        cmd.Parameters.AddWithValue("@amount", newObj.amount);
                        cmd.Parameters.AddWithValue("@date", newObj.date);
                        cmd.Parameters.AddWithValue("@description", newObj.description);
                        cmd.Parameters.AddWithValue("@companyid", newObj.companyid);
                        cmd.Parameters.AddWithValue("@cuid", newObj.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newObj.cashid);
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_hand_cash_entry", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@amount", newObj.amount);
                        cmd.Parameters.AddWithValue("@date", newObj.date);
                        cmd.Parameters.AddWithValue("@description", newObj.description);
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
        [ActionName("Delete_hand_cash_entry")]
        public ResponseModel Delete_hand_cash_entry(int cashid)
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

                    SqlCommand cmd = new SqlCommand("Delete_hand_cash_entry", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@cashid", cashid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(cashid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }
    }
}

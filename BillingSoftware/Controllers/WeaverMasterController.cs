using BillingSoftware.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System.Data;
using System;
using BillingSoftware.Helpers;
using System.Collections.Generic;

namespace BillingSoftware.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class WeaverMasterController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        public WeaverMasterController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<WeaverMasterModel> get_weaver_master(int companyid)
        {
            DataTable dtData = null;
            List<WeaverMasterModel> mItems = new List<WeaverMasterModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_weaver_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<WeaverMasterModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_weaver_master")]
        public ResponseModel Insert_weaver_master(WeaverMasterModel newObj)
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
                    if (newObj.weaverid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("update_weaver_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@weaverid", newObj.weaverid);
                        cmd.Parameters.AddWithValue("@weaver_name", newObj.weaver_name);
                        cmd.Parameters.AddWithValue("@short_code", newObj.short_code);
                        cmd.Parameters.AddWithValue("@mobile", newObj.mobile);
                        cmd.Parameters.AddWithValue("@address", newObj.address);
                        cmd.Parameters.AddWithValue("@state_code", newObj.state_code);
                        cmd.Parameters.AddWithValue("@state", newObj.state);
                        cmd.Parameters.AddWithValue("@balance", newObj.balance);
                        cmd.Parameters.AddWithValue("@companyid", newObj.companyid);
                        cmd.Parameters.AddWithValue("@cuid", newObj.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newObj.weaverid);
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_weaver_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@weaver_name", newObj.weaver_name);
                        cmd.Parameters.AddWithValue("@short_code", newObj.short_code);
                        cmd.Parameters.AddWithValue("@mobile", newObj.mobile);
                        cmd.Parameters.AddWithValue("@address", newObj.address);
                        cmd.Parameters.AddWithValue("@state_code", newObj.state_code);
                        cmd.Parameters.AddWithValue("@state", newObj.state);
                        cmd.Parameters.AddWithValue("@balance", newObj.balance);
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
        [ActionName("delete_weaver_master")]
        public ResponseModel delete_weaver_master(int weaverid)
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

                    SqlCommand cmd = new SqlCommand("delete_weaver_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@weaverid", weaverid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(weaverid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }
    }
}

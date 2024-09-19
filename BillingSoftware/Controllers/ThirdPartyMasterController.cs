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
    public class ThirdPartyMasterController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        public ThirdPartyMasterController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<ThirdPartyMasterModel> get_third_party_master(int companyid)
        {
            DataTable dtData = null;
            List<ThirdPartyMasterModel> mItems = new List<ThirdPartyMasterModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_third_party_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ThirdPartyMasterModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<ThirdPartyAdvanceModel> get_thirdparty_advance(int third_partyid)
        {
            DataTable dtData = null;
            List<ThirdPartyAdvanceModel> mItems = new List<ThirdPartyAdvanceModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_thirdparty_advance", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@third_partyid", third_partyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ThirdPartyAdvanceModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_third_party_master")]
        public ResponseModel Insert_third_party_master(ThirdPartyMasterModel newObj)
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
                    if (newObj.third_partyid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("update_third_party_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@third_partyid", newObj.third_partyid);
                        cmd.Parameters.AddWithValue("@party_name", newObj.party_name);
                        cmd.Parameters.AddWithValue("@short_code", newObj.short_code);
                        cmd.Parameters.AddWithValue("@mobile", newObj.mobile);
                        cmd.Parameters.AddWithValue("@state", newObj.state);
                        cmd.Parameters.AddWithValue("@state_code", newObj.state_code);
                        cmd.Parameters.AddWithValue("@address", newObj.address);
                        cmd.Parameters.AddWithValue("@gst_in", newObj.gst_in);
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
                        objmodel.recordid = Convert.ToInt32(newObj.third_partyid);

                        if (objmodel.status == "Saved successfully")
                        {
                            foreach (var advan in newObj.thirdpartyadvance)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    if (advan.advanceid > 0)
                                    {
                                        SqlCommand cmd1 = new SqlCommand("update_thirdparty_advance", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@advanceid", advan.advanceid);
                                        cmd1.Parameters.AddWithValue("@third_partyid", newObj.third_partyid);
                                        cmd1.Parameters.AddWithValue("@date", advan.date);
                                        cmd1.Parameters.AddWithValue("@advance_amount", advan.advance_amount);
                                        cmd1.Parameters.AddWithValue("@description", advan.description);
                                        con11.Open();
                                        cmd1.ExecuteNonQuery();
                                    }
                                    else
                                    {
                                        SqlCommand cmd1 = new SqlCommand("insert_thirdparty_advance", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@third_partyid", objmodel.recordid);
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
                        SqlCommand cmd = new SqlCommand("Insert_third_party_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@party_name", newObj.party_name);
                        cmd.Parameters.AddWithValue("@short_code", newObj.short_code);
                        cmd.Parameters.AddWithValue("@mobile", newObj.mobile);
                        cmd.Parameters.AddWithValue("@state", newObj.state);
                        cmd.Parameters.AddWithValue("@state_code", newObj.state_code);
                        cmd.Parameters.AddWithValue("@address", newObj.address);
                        cmd.Parameters.AddWithValue("@gst_in", newObj.gst_in);
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

                        if (objmodel.status == "Saved successfully")
                        {
                            foreach (var advan in newObj.thirdpartyadvance)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("insert_thirdparty_advance", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@third_partyid", objmodel.recordid);
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
        [ActionName("delete_third_party_master")]
        public ResponseModel delete_third_party_master(int third_partyid)
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

                    SqlCommand cmd = new SqlCommand("delete_third_party_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@third_partyid", third_partyid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(third_partyid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }
    }
}

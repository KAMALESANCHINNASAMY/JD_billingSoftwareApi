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
    public class WeaversGivenReceivedController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;

        public WeaversGivenReceivedController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<WeaverSareesModel> get_weavers_given_received(int companyid, string date)
        {
            DataTable dtData = null;
            List<WeaverSareesModel> mItems = new List<WeaverSareesModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_weavers_given_received", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@date", date);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<WeaverSareesModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<giventoweaversModel> get_giventoweavers(int purchaseid)
        {
            DataTable dtData = null;
            List<giventoweaversModel> mItems = new List<giventoweaversModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_giventoweavers", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@purchaseid", purchaseid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<giventoweaversModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("insert_given_to_weavers")]
        public ResponseModel insert_given_to_weavers(WeaverSareesModel newMat)
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
                    if (newMat.purchaseid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("update_given_to_weavers", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                        cmd.Parameters.AddWithValue("@weaverid", newMat.weaverid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@mode", newMat.mode);
                        cmd.Parameters.AddWithValue("@companyid", newMat.companyid);
                        cmd.Parameters.AddWithValue("@cuid", newMat.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newMat.purchaseid);
                        if (objmodel.status == "Saved successfully")
                        {
                            foreach (var assign in newMat.giventoweavers)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    if (assign.givenid > 0)
                                    {
                                        SqlCommand cmd1 = new SqlCommand("update_giventoweavers", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@givenid", assign.givenid);
                                        cmd1.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                                        cmd1.Parameters.AddWithValue("@brandid", assign.brandid);
                                        cmd1.Parameters.AddWithValue("@itemid", assign.itemid);
                                        cmd1.Parameters.AddWithValue("@g_gram", assign.g_gram);
                                        cmd1.Parameters.AddWithValue("@g_rate", assign.g_rate);
                                        cmd1.Parameters.AddWithValue("@g_total", assign.g_total);
                                        cmd1.Parameters.AddWithValue("@g_advance", assign.g_advance);
                                        cmd1.Parameters.AddWithValue("@description", assign.description);
                                        con11.Open();
                                        cmd1.ExecuteNonQuery();
                                    }
                                    else
                                    {
                                        SqlCommand cmd1 = new SqlCommand("insert_giventoweavers", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@purchaseid", objmodel.recordid);
                                        cmd1.Parameters.AddWithValue("@brandid", assign.brandid);
                                        cmd1.Parameters.AddWithValue("@itemid", assign.itemid);
                                        cmd1.Parameters.AddWithValue("@g_gram", assign.g_gram);
                                        cmd1.Parameters.AddWithValue("@g_rate", assign.g_rate);
                                        cmd1.Parameters.AddWithValue("@g_total", assign.g_total);
                                        cmd1.Parameters.AddWithValue("@g_advance", assign.g_advance);
                                        cmd1.Parameters.AddWithValue("@description", assign.description);
                                        con11.Open();
                                        cmd1.ExecuteNonQuery();
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("insert_given_to_weavers", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@weaverid", newMat.weaverid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@mode", newMat.mode);
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
                            foreach (var assign in newMat.giventoweavers)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("insert_giventoweavers", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@purchaseid", objmodel.recordid);
                                    cmd1.Parameters.AddWithValue("@brandid", assign.brandid);
                                    cmd1.Parameters.AddWithValue("@itemid", assign.itemid);
                                    cmd1.Parameters.AddWithValue("@g_gram", assign.g_gram);
                                    cmd1.Parameters.AddWithValue("@g_rate", assign.g_rate);
                                    cmd1.Parameters.AddWithValue("@g_total", assign.g_total);
                                    cmd1.Parameters.AddWithValue("@g_advance", assign.g_advance);
                                    cmd1.Parameters.AddWithValue("@description", assign.description);
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

        [HttpPost]
        [ActionName("insert_weavers_purchase_received")]
        public ResponseModel insert_weavers_purchase_received(WeaverSareesModel newMat)
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
                    if (newMat.purchaseid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("update_weavers_purchase_received", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                        cmd.Parameters.AddWithValue("@weaverid", newMat.weaverid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@mode", newMat.mode);
                        cmd.Parameters.AddWithValue("@companyid", newMat.companyid);
                        cmd.Parameters.AddWithValue("@cuid", newMat.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newMat.purchaseid);
                        if (objmodel.status == "Saved successfully")
                        {
                            foreach (var assign in newMat.weaver_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    if (assign.givenid > 0)
                                    {
                                        SqlCommand cmd2 = new SqlCommand("update_weavers_nested_received", con11);
                                        cmd2.CommandType = CommandType.StoredProcedure;
                                        cmd2.Parameters.AddWithValue("@purchase_n_id", assign.purchase_n_id);
                                        cmd2.Parameters.AddWithValue("@purchaseid", objmodel.recordid);
                                        cmd2.Parameters.AddWithValue("@date", newMat.date);
                                        cmd2.Parameters.AddWithValue("@si_code", assign.si_code);
                                        cmd2.Parameters.AddWithValue("@ref_code", assign.ref_code);
                                        cmd2.Parameters.AddWithValue("@brandid", assign.brandid);
                                        cmd2.Parameters.AddWithValue("@itemid", assign.itemid);
                                        cmd2.Parameters.AddWithValue("@qty", assign.qty);
                                        cmd2.Parameters.AddWithValue("@companyid", newMat.companyid);
                                        cmd2.Parameters.AddWithValue("@r_gram", assign.r_gram);
                                        cmd2.Parameters.AddWithValue("@r_advance", assign.r_advance);
                                        cmd2.Parameters.AddWithValue("@description", assign.description);
                                        con11.Open();
                                        cmd2.ExecuteNonQuery();
                                    }
                                    else
                                    {
                                        SqlCommand cmd2 = new SqlCommand("insert_weavers_nested_received", con11);
                                        cmd2.CommandType = CommandType.StoredProcedure;
                                        cmd2.Parameters.AddWithValue("@purchaseid", objmodel.recordid);
                                        cmd2.Parameters.AddWithValue("@date", newMat.date);
                                        cmd2.Parameters.AddWithValue("@si_code", assign.si_code);
                                        cmd2.Parameters.AddWithValue("@ref_code", assign.ref_code);
                                        cmd2.Parameters.AddWithValue("@brandid", assign.brandid);
                                        cmd2.Parameters.AddWithValue("@itemid", assign.itemid);
                                        cmd2.Parameters.AddWithValue("@qty", assign.qty);
                                        cmd2.Parameters.AddWithValue("@companyid", newMat.companyid);
                                        cmd2.Parameters.AddWithValue("@r_gram", assign.r_gram);
                                        cmd2.Parameters.AddWithValue("@r_advance", assign.r_advance);
                                        cmd2.Parameters.AddWithValue("@description", assign.description);
                                        con11.Open();
                                        cmd2.ExecuteNonQuery();
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("insert_weavers_purchase_received", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@weaverid", newMat.weaverid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@mode", newMat.mode);
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
                            foreach (var assign in newMat.weaver_nested)
                            {
                                using (SqlConnection con12 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd2 = new SqlCommand("insert_weavers_nested_received", con12);
                                    cmd2.CommandType = CommandType.StoredProcedure;
                                    cmd2.Parameters.AddWithValue("@purchaseid", objmodel.recordid);
                                    cmd2.Parameters.AddWithValue("@date", newMat.date);
                                    cmd2.Parameters.AddWithValue("@si_code", assign.si_code);
                                    cmd2.Parameters.AddWithValue("@ref_code", assign.ref_code);
                                    cmd2.Parameters.AddWithValue("@brandid", assign.brandid);
                                    cmd2.Parameters.AddWithValue("@itemid", assign.itemid);
                                    cmd2.Parameters.AddWithValue("@qty", assign.qty);
                                    cmd2.Parameters.AddWithValue("@companyid", newMat.companyid);
                                    cmd2.Parameters.AddWithValue("@r_gram", assign.r_gram);
                                    cmd2.Parameters.AddWithValue("@r_advance", assign.r_advance);
                                    cmd2.Parameters.AddWithValue("@description", assign.description);
                                    con12.Open();
                                    cmd2.ExecuteNonQuery();
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

        [HttpDelete]
        [ActionName("delete_given_to_weavers")]
        public ResponseModel delete_given_to_weavers(int purchaseid)
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

                    SqlCommand cmd = new SqlCommand("delete_given_to_weavers", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@purchaseid", purchaseid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(purchaseid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }
    }
}

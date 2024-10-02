using BillingSoftware.Helpers;
using BillingSoftware.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System.Collections.Generic;
using System.Data;
using System;

namespace BillingSoftware.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class GSTMasterController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        private string errorCode;
        private object errorDesc;

        public GSTMasterController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            appSettings = appSettings;
            Conn = new Database().GetConnectionString();
        }
        [HttpGet]

        public List<GSTMasterModel> get(int companyid)
        {
            DataTable dtData = null;
            List<GSTMasterModel> mItems = new List<GSTMasterModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_gst_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<GSTMasterModel>(dtData);
                    }
                }

            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_gst_master")]
        public ResponseModel Insert_gst_master(GSTMasterModel newGst)
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
                    if (newGst.gstid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_gst_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@gstid", newGst.gstid);
                        cmd.Parameters.AddWithValue("@companyid", newGst.companyid);
                        cmd.Parameters.AddWithValue("@gst_ID", newGst.gst_ID);
                        cmd.Parameters.AddWithValue("@gst_percentage", newGst.gst_percentage);
                        cmd.Parameters.AddWithValue("@igst_percentage", newGst.igst_percentage);
                        cmd.Parameters.AddWithValue("@c_gst", newGst.c_gst);
                        cmd.Parameters.AddWithValue("@s_gst", newGst.s_gst);
                        cmd.Parameters.AddWithValue("@cuid", newGst.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        //objmodel = new ResponseModel();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newGst.gstid);
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_gst_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@companyid", newGst.companyid);
                        cmd.Parameters.AddWithValue("@gst_ID", newGst.gst_ID);
                        cmd.Parameters.AddWithValue("@gst_percentage", newGst.gst_percentage);
                        cmd.Parameters.AddWithValue("@igst_percentage", newGst.igst_percentage);
                        cmd.Parameters.AddWithValue("@c_gst", newGst.c_gst);
                        cmd.Parameters.AddWithValue("@s_gst", newGst.s_gst);
                        cmd.Parameters.AddWithValue("@cuid", newGst.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        //objmodel = new ResponseModel();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(errorCode);
                    }
                }
            }
            catch (Exception ex)
            {
                return null;
            }
            return objmodel;
        }

        [HttpDelete]
        [ActionName("Delete_gst_master")]
        public ResponseModel Delete_gst_master(int gstid)
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

                    SqlCommand cmd = new SqlCommand("Delete_gst_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@gstid", gstid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(gstid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }

        [HttpGet]
        [ActionName("Get_MaxID_gst_master")]
        public List<GSTMasterModel> Get_MaxID_gst_master(int companyid)
        {
            DataTable dtData = null;
            SqlDataAdapter adapter = null;
            // CategoryModel mItem = null;
            List<GSTMasterModel> mItems = new List<GSTMasterModel>();
            GSTMasterModel Objcate = new GSTMasterModel();
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_MaxID_gst_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    mItems = Helper.ConvertToList<GSTMasterModel>(dtData);
                }
            }
            catch (Exception ex)
            {
                // log.ErrorFormat("Exception in GetCategoryById method in database layer:{0}|{1}", ex.Message, ex.StackTrace);
            }
            return mItems;
        }

    }
}

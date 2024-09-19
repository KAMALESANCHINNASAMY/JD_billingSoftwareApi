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
    public class UnitMasterController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        private string errorCode;
        private object errorDesc;

        public UnitMasterController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            appSettings = appSettings;
            Conn = new Database().GetConnectionString();
        }
        [HttpGet]
        public List<UnitMasterModel> get(int companyid)
        {
            DataTable dtData = null;
            List<UnitMasterModel> mItems = new List<UnitMasterModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;

            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_unit_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<UnitMasterModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_unit_master")]
        public ResponseModel Insert_unit_master(UnitMasterModel newUnit)
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
                    if (newUnit.unitid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_unit_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@unitid", newUnit.unitid);
                        cmd.Parameters.AddWithValue("@companyid", newUnit.companyid);
                        cmd.Parameters.AddWithValue("@unit_name", newUnit.unit_name);
                        cmd.Parameters.AddWithValue("@unit_code", newUnit.unit_code);
                        cmd.Parameters.AddWithValue("@cuid", newUnit.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        //objmodel = new ResponseModel();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newUnit.unitid);
                    }

                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_unit_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@companyid", newUnit.companyid);
                        cmd.Parameters.AddWithValue("@unit_name", newUnit.unit_name);
                        cmd.Parameters.AddWithValue("@unit_code", newUnit.unit_code);
                        cmd.Parameters.AddWithValue("@cuid", newUnit.cuid);
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
        [ActionName("Delete_unit_master")]
        public ResponseModel Delete_unit_master(int unitid)
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

                    SqlCommand cmd = new SqlCommand("Delete_unit_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@unitid", unitid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(unitid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }

    }
}

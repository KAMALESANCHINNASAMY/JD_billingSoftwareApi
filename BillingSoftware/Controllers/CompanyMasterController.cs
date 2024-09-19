using BillingSoftware.Helpers;
using BillingSoftware.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;

namespace BillingSoftware.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class CompanyMasterController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        private string errorCode;
        private object errorDesc;

        public CompanyMasterController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            appSettings = appSettings;
            Conn = new Database().GetConnectionString();
        }
        [HttpGet]
        public List<CompanyMasterModel> Get()
        {
            DataTable dtData = null;
            List<CompanyMasterModel> mItems = new List<CompanyMasterModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;

            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_company_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<CompanyMasterModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_company_master")]
        public ResponseModel Insert_company_master(CompanyMasterModel newCompany)
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
                    if (newCompany.companyid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_company_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@companyid", newCompany.companyid);
                        cmd.Parameters.AddWithValue("@company_sdate", newCompany.company_sdate ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@company_name", newCompany.company_name);
                        cmd.Parameters.AddWithValue("@display_name", newCompany.display_name);
                        cmd.Parameters.AddWithValue("@door_no", newCompany.door_no);
                        cmd.Parameters.AddWithValue("@building_name", newCompany.building_name);
                        cmd.Parameters.AddWithValue("@street_name", newCompany.street_name);
                        cmd.Parameters.AddWithValue("@streent_name1", newCompany.streent_name1);
                        cmd.Parameters.AddWithValue("@email", newCompany.email);
                        cmd.Parameters.AddWithValue("@c_location", newCompany.c_location);
                        cmd.Parameters.AddWithValue("@pincode", newCompany.pincode);
                        cmd.Parameters.AddWithValue("@post", newCompany.post);
                        cmd.Parameters.AddWithValue("@taluk", newCompany.taluk);
                        cmd.Parameters.AddWithValue("@district", newCompany.district);
                        cmd.Parameters.AddWithValue("@website", newCompany.website);
                        cmd.Parameters.AddWithValue("@owner_name", newCompany.owner_name);
                        cmd.Parameters.AddWithValue("@mobile", newCompany.mobile);
                        cmd.Parameters.AddWithValue("@office_phno", newCompany.office_phno);
                        cmd.Parameters.AddWithValue("@logo", newCompany.logo);
                        cmd.Parameters.AddWithValue("@bank_name", newCompany.bank_name);
                        cmd.Parameters.AddWithValue("@ac_holder_name", newCompany.ac_holder_name);
                        cmd.Parameters.AddWithValue("@ac_no", newCompany.ac_no);
                        cmd.Parameters.AddWithValue("@ifsc_code", newCompany.ifsc_code);
                        cmd.Parameters.AddWithValue("@gst_in", newCompany.gst_in);
                        cmd.Parameters.AddWithValue("@cuid", newCompany.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newCompany.companyid);
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_company_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@company_sdate", newCompany.company_sdate ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@company_name", newCompany.company_name);
                        cmd.Parameters.AddWithValue("@display_name", newCompany.display_name);
                        cmd.Parameters.AddWithValue("@door_no", newCompany.door_no);
                        cmd.Parameters.AddWithValue("@building_name", newCompany.building_name);
                        cmd.Parameters.AddWithValue("@street_name", newCompany.street_name);
                        cmd.Parameters.AddWithValue("@streent_name1", newCompany.streent_name1);
                        cmd.Parameters.AddWithValue("@email", newCompany.email);
                        cmd.Parameters.AddWithValue("@c_location", newCompany.c_location);
                        cmd.Parameters.AddWithValue("@pincode", newCompany.pincode);
                        cmd.Parameters.AddWithValue("@post", newCompany.post);
                        cmd.Parameters.AddWithValue("@taluk", newCompany.taluk);
                        cmd.Parameters.AddWithValue("@district", newCompany.district);
                        cmd.Parameters.AddWithValue("@website", newCompany.website);
                        cmd.Parameters.AddWithValue("@owner_name", newCompany.owner_name);
                        cmd.Parameters.AddWithValue("@mobile", newCompany.mobile);
                        cmd.Parameters.AddWithValue("@office_phno", newCompany.office_phno);
                        cmd.Parameters.AddWithValue("@logo", newCompany.logo);
                        cmd.Parameters.AddWithValue("@bank_name", newCompany.bank_name);
                        cmd.Parameters.AddWithValue("@ac_holder_name", newCompany.ac_holder_name);
                        cmd.Parameters.AddWithValue("@ac_no", newCompany.ac_no);
                        cmd.Parameters.AddWithValue("@ifsc_code", newCompany.ifsc_code);
                        cmd.Parameters.AddWithValue("@gst_in", newCompany.gst_in);
                        cmd.Parameters.AddWithValue("@cuid", newCompany.cuid);
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
                return null;
            }
            return objmodel;
        }

        [HttpDelete]
        [ActionName("Delete_company_master")]
        public ResponseModel Delete_company_master(int companyid)
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

                    SqlCommand cmd = new SqlCommand("Delete_company_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(companyid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }

        [HttpPut]
        [ActionName("UpdateActiveStatus_company_master")]
        public ResponseModel UpdateActiveStatus_company_master(int companyid)
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

                    SqlCommand cmd = new SqlCommand("UpdateActiveStatus_company_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(companyid);


                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            return objmodel;
        }

        [HttpGet]
        public List<CompanyMasterModel> GetActiveStsCompany()
        {
            DataTable dtData = null;
            List<CompanyMasterModel> mItems = new List<CompanyMasterModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("GetActiveStsCompany_company_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<CompanyMasterModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }
    }
}


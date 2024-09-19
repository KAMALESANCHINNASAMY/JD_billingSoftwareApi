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
using Microsoft.AspNetCore.Authorization;

namespace BillingSoftware.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class UserProfileController : ControllerBase
    {

        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;

        public UserProfileController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            appSettings = appSettings;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<UserProfileModel> Get(int companyid)
        {
            DataTable dtData = null;
            List<UserProfileModel> mItems = new List<UserProfileModel>();            
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;

            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_user_profile", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);

                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<UserProfileModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }
        [HttpPost]
        [ActionName("Insert_user_profile")]
        public ResponseModel Insert_user_profile(UserProfileModel newuser)
        {
            ResponseModel objmodel = new ResponseModel();
            string errorDesc = string.Empty;
            string errorCode = string.Empty;

            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    string mainMenu = string.Empty;
                    string subMenu = string.Empty;

                    foreach (var menu in newuser.main_menu)
                    {
                        mainMenu = string.Concat(mainMenu + Convert.ToString(menu) + ',');
                    }

                    foreach (var sub in newuser.sub_menu)
                    {
                        subMenu = string.Concat(subMenu + Convert.ToString(sub) + ',');
                    }

                    SqlParameter outErrorCode = new SqlParameter("@o_ErrorCode", SqlDbType.Int) { Direction = ParameterDirection.Output };
                    SqlParameter outErrorDesc = new SqlParameter("@o_ErrorDescription", SqlDbType.VarChar, 5000) { Direction = ParameterDirection.Output };
                    if (newuser.userid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_user_profile", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userid", newuser.userid);
                        cmd.Parameters.AddWithValue("@user_name", newuser.user_name);
                        cmd.Parameters.AddWithValue("@companyid", newuser.companyid);
                        cmd.Parameters.AddWithValue("@phone", newuser.phone);
                        cmd.Parameters.AddWithValue("@email", newuser.email);
                        cmd.Parameters.AddWithValue("@password", newuser.password);
                        cmd.Parameters.AddWithValue("@m_companyid", newuser.m_companyid);
                        cmd.Parameters.AddWithValue("@s_companyid", newuser.s_companyid);
                        cmd.Parameters.AddWithValue("@img", newuser.img ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@cuid", newuser.cuid);
                        cmd.Parameters.AddWithValue("@main_menus", mainMenu);
                        cmd.Parameters.AddWithValue("@sub_menus", subMenu);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        //objmodel = new ResponseModel();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newuser.userid);
                    }

                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_user_profile", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@user_name", newuser.user_name);
                        cmd.Parameters.AddWithValue("@companyid", newuser.companyid);
                        cmd.Parameters.AddWithValue("@phone", newuser.phone);
                        cmd.Parameters.AddWithValue("@email", newuser.email);
                        cmd.Parameters.AddWithValue("@password", newuser.password);
                        cmd.Parameters.AddWithValue("@m_companyid", newuser.m_companyid);
                        cmd.Parameters.AddWithValue("@s_companyid", newuser.s_companyid);
                        cmd.Parameters.AddWithValue("@img", newuser.img ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@cuid", newuser.cuid);
                        cmd.Parameters.AddWithValue("@main_menus", mainMenu);
                        cmd.Parameters.AddWithValue("@sub_menus", subMenu);
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
        [ActionName("Delete_user_profile")]
        public ResponseModel Delete_user_profile(int userid)
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

                    SqlCommand cmd = new SqlCommand("Delete_user_profile", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(userid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }


        [HttpGet]
        [ActionName("get_userbyid")]
        public List<UserProfileModel> get_userbyid(int userid)
        {
            DataTable dtData = null;
            List<UserProfileModel> mItems = new List<UserProfileModel>();            
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_userbyid", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userid", userid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<UserProfileModel>(dtData);
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

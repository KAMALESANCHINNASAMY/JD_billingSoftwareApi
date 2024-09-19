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
    public class ItemMasterController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        private string errorCode;
        private object errorDesc;

        public ItemMasterController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            appSettings = appSettings;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]

        public List<ItemMasterModel> get(int companyid)
        {
          
                DataTable dtData = null;
                List<ItemMasterModel> mItems = new List<ItemMasterModel>();
                SqlDataAdapter adapter = null;
                string jsonData = string.Empty;

            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_item_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ItemMasterModel>(dtData);
                    }
                }

            }
            catch (Exception ex)
            {

            }
                return mItems;

            }
        [HttpPost]
        [ActionName("Insert_item_master")]

        public ResponseModel Insert_item_master(ItemMasterModel newItem)
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
                    if (newItem.itemid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_item_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@itemid", newItem.itemid);
                        cmd.Parameters.AddWithValue("@companyid", newItem.companyid);
                        cmd.Parameters.AddWithValue("@unitid", newItem.unitid);
                        cmd.Parameters.AddWithValue("@item_groupid", newItem.item_groupid);
                        cmd.Parameters.AddWithValue("@item_code", newItem.item_code);
                        cmd.Parameters.AddWithValue("@brandid", newItem.brandid);
                        cmd.Parameters.AddWithValue("@item_name", newItem.item_name);
                        cmd.Parameters.AddWithValue("@cuid", newItem.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        //objmodel = new ResponseModel();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newItem.itemid);
                    }

                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_item_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@companyid", newItem.companyid);
                        cmd.Parameters.AddWithValue("@unitid", newItem.unitid);
                        cmd.Parameters.AddWithValue("@item_groupid", newItem.item_groupid);
                        cmd.Parameters.AddWithValue("@item_code", newItem.item_code);
                        cmd.Parameters.AddWithValue("@brandid", newItem.brandid);
                        cmd.Parameters.AddWithValue("@item_name", newItem.item_name);
                        cmd.Parameters.AddWithValue("@cuid", newItem.cuid);
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
        [ActionName("Delete_item_master")]
        public ResponseModel Delete_item_master(int itemid)
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

                    SqlCommand cmd = new SqlCommand("Delete_item_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@itemid", itemid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(itemid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }

        [HttpGet]
        [ActionName("Get_MaxID_item_master")]

        public List<ItemMasterModel> Get_MaxID_item_master(int companyid)
        {
            DataTable dtData = null;
            SqlDataAdapter adapter = null;
            // CategoryModel mItem = null;
            List<ItemMasterModel> mItems = new List<ItemMasterModel>();
            ItemMasterModel Objcate = new ItemMasterModel();
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_MaxID_item_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    mItems = Helper.ConvertToList<ItemMasterModel>(dtData);
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


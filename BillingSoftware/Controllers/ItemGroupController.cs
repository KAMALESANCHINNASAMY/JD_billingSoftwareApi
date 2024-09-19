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
    public class ItemGroupController : ControllerBase
    {

        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        private string errorCode;
        private object errorDesc;

        public ItemGroupController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            appSettings = appSettings;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]

        public List<ItemGroupModel> get(int companyid)
        {

            DataTable dtData = null;
            List<ItemGroupModel> mItems = new List<ItemGroupModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;

            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("Get_item_group", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<ItemGroupModel>(dtData);
                    }
                }

            }
            catch (Exception ex)
            {

            }
            return mItems;

        }
        [HttpPost]
        [ActionName("Insert_item_group")]

        public ResponseModel Insert_item_group(ItemGroupModel newItemGrp)
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
                    if (newItemGrp.item_groupid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_item_group", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@item_groupid", newItemGrp.item_groupid);
                        cmd.Parameters.AddWithValue("@companyid", newItemGrp.companyid);
                        cmd.Parameters.AddWithValue("@item_group_name", newItemGrp.item_group_name);
                        cmd.Parameters.AddWithValue("@hsnid", newItemGrp.hsnid);
                        cmd.Parameters.AddWithValue("@cuid", newItemGrp.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        //objmodel = new ResponseModel();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newItemGrp.item_groupid);
                    }

                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_item_group", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@companyid", newItemGrp.companyid);
                        cmd.Parameters.AddWithValue("@item_group_name", newItemGrp.item_group_name);
                        cmd.Parameters.AddWithValue("@hsnid", newItemGrp.hsnid);
                        cmd.Parameters.AddWithValue("@cuid", newItemGrp.cuid);
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
        [ActionName("Delete_item_group")]
        public ResponseModel item_groupid(int item_groupid)
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

                    SqlCommand cmd = new SqlCommand("Delete_item_group", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@item_groupid", item_groupid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(item_groupid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }

    }
}

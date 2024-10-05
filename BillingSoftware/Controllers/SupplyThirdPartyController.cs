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
    public class SupplyThirdPartyController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        public SupplyThirdPartyController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<SupplyThirdPartyModel> get_Maxid_supply_to_thirdparty(int companyid)
        {
            DataTable dtData = null;
            List<SupplyThirdPartyModel> mItems = new List<SupplyThirdPartyModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_Maxid_supply_to_thirdparty", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SupplyThirdPartyModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<SupplyThirdPartyModel> get_supply_to_thirdparty(int companyid, string date)
        {
            DataTable dtData = null;
            List<SupplyThirdPartyModel> mItems = new List<SupplyThirdPartyModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_supply_to_thirdparty", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@date", date);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SupplyThirdPartyModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<SupplyThirdPartyModelNested> get_supply_to_thirdparty_nested(int supplyid)
        {
            DataTable dtData = null;
            List<SupplyThirdPartyModelNested> mItems = new List<SupplyThirdPartyModelNested>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_supply_to_thirdparty_nested", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@supplyid", supplyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SupplyThirdPartyModelNested>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_supply_to_thirdparty")]
        public ResponseModel Insert_supply_to_thirdparty(SupplyThirdPartyModel newMat)
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
                    if (newMat.supplyid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_supply_to_thirdparty", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@supplyid", newMat.supplyid);
                        cmd.Parameters.AddWithValue("@third_partyid", newMat.third_partyid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@bill_no", newMat.bill_no);
                        cmd.Parameters.AddWithValue("@cuid", newMat.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newMat.supplyid);
                        if (objmodel.status == "Saved successfully")
                        {
                            foreach (var assign in newMat.supply_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("Insert_supply_to_thirdparty_nested", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@supplyid", newMat.supplyid);
                                    cmd1.Parameters.AddWithValue("@n_productid", assign.n_productid);
                                    cmd1.Parameters.AddWithValue("@a_qty", assign.a_qty);
                                    cmd1.Parameters.AddWithValue("@qty", assign.qty);
                                    con11.Open();
                                    cmd1.ExecuteNonQuery();
                                }
                            }
                        }
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_supply_to_thirdparty", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@third_partyid", newMat.third_partyid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@bill_no", newMat.bill_no);
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
                            foreach (var assign in newMat.supply_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("Insert_supply_to_thirdparty_nested", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@supplyid", objmodel.recordid);
                                    cmd1.Parameters.AddWithValue("@n_productid", assign.n_productid);
                                    cmd1.Parameters.AddWithValue("@a_qty", assign.a_qty);
                                    cmd1.Parameters.AddWithValue("@qty", assign.qty);
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

        [HttpDelete]
        [ActionName("Delete_supply_to_thirdparty")]
        public ResponseModel Delete_supply_to_thirdparty(int supplyid)
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

                    SqlCommand cmd = new SqlCommand("Delete_supply_to_thirdparty", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@supplyid", supplyid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(supplyid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }
    }
}

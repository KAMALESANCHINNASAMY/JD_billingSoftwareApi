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
    public class SupplierMasterController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        public SupplierMasterController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<SupplierMasterModel> get_supplier_master(int companyid)
        {
            DataTable dtData = null;
            List<SupplierMasterModel> mItems = new List<SupplierMasterModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_supplier_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SupplierMasterModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<supplierAdvanceModel> get_supplier_advance(int supplierid)
        {
            DataTable dtData = null;
            List<supplierAdvanceModel> mItems = new List<supplierAdvanceModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_supplier_advance", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@supplierid", supplierid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<supplierAdvanceModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_supplier_master")]
        public ResponseModel Insert_supplier_master(SupplierMasterModel newObj)
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
                    if (newObj.supplierid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("update_supplier_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@supplierid", newObj.supplierid);
                        cmd.Parameters.AddWithValue("@supplier_name", newObj.supplier_name);
                        cmd.Parameters.AddWithValue("@mobile_no", newObj.mobile_no);
                        cmd.Parameters.AddWithValue("@state", newObj.state);
                        cmd.Parameters.AddWithValue("@state_code", newObj.state_code);
                        cmd.Parameters.AddWithValue("@gst_in", newObj.gst_in);
                        cmd.Parameters.AddWithValue("@balance", newObj.balance);
                        cmd.Parameters.AddWithValue("@address", newObj.address);
                        cmd.Parameters.AddWithValue("@shipping_address", newObj.shipping_address);
                        cmd.Parameters.AddWithValue("@companyid", newObj.companyid);
                        cmd.Parameters.AddWithValue("@cuid", newObj.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newObj.supplierid);

                        if (objmodel.status == "Saved successfully")
                        {
                            foreach (var advan in newObj.supplieradvance)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    if (advan.advanceid > 0)
                                    {
                                        SqlCommand cmd1 = new SqlCommand("update_supplier_advance", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@advanceid", advan.advanceid);
                                        cmd1.Parameters.AddWithValue("@supplierid", newObj.supplierid);
                                        cmd1.Parameters.AddWithValue("@date", advan.date);
                                        cmd1.Parameters.AddWithValue("@advance_amount", advan.advance_amount);
                                        cmd1.Parameters.AddWithValue("@description", advan.description);
                                        con11.Open();
                                        cmd1.ExecuteNonQuery();
                                    }
                                    else
                                    {
                                        SqlCommand cmd1 = new SqlCommand("insert_supplier_advance", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@supplierid", objmodel.recordid);
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
                        SqlCommand cmd = new SqlCommand("Insert_supplier_master", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@supplier_name", newObj.supplier_name);
                        cmd.Parameters.AddWithValue("@mobile_no", newObj.mobile_no);
                        cmd.Parameters.AddWithValue("@state", newObj.state);
                        cmd.Parameters.AddWithValue("@state_code", newObj.state_code);
                        cmd.Parameters.AddWithValue("@gst_in", newObj.gst_in);
                        cmd.Parameters.AddWithValue("@balance", newObj.balance);
                        cmd.Parameters.AddWithValue("@address", newObj.address);
                        cmd.Parameters.AddWithValue("@shipping_address", newObj.shipping_address);
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
                            foreach (var advan in newObj.supplieradvance)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("insert_supplier_advance", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@supplierid", objmodel.recordid);
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
        [ActionName("delete_supplier_master")]
        public ResponseModel delete_supplier_master(int supplierid)
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

                    SqlCommand cmd = new SqlCommand("delete_supplier_master", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@supplierid", supplierid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(supplierid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }
    }
}

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
using System.ComponentModel.Design;

namespace BillingSoftware.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class RawMaterialPurchaseController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;

        public RawMaterialPurchaseController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<RawMaterialPurchaseModel> get_Maxid_material_purchase(int companyid)
        {
            DataTable dtData = null;
            List<RawMaterialPurchaseModel> mItems = new List<RawMaterialPurchaseModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_Maxid_material_purchase", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<RawMaterialPurchaseModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<RawMaterialPurchaseModel>get_raw_material_purchase(int companyid,string date)
        {
            DataTable dtData = null;
            List<RawMaterialPurchaseModel> mItems = new List<RawMaterialPurchaseModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_raw_material_purchase", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@date", date);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<RawMaterialPurchaseModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<RawMaterialPurchaseNestedModel> get_raw_material_purchasenested(int purchaseid)
        {
            DataTable dtData = null;
            List<RawMaterialPurchaseNestedModel> mItems = new List<RawMaterialPurchaseNestedModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_raw_material_purchasenested", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@purchaseid", purchaseid);                  
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<RawMaterialPurchaseNestedModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }


        [HttpPost]
        [ActionName("Insert_raw_material_purchase")]
        public ResponseModel Insert_raw_material_purchase(RawMaterialPurchaseModel newMat)
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
                        SqlCommand cmd = new SqlCommand("Update_raw_material_purchase", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                        cmd.Parameters.AddWithValue("@supplierid", newMat.supplierid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@supplier_bill_no", newMat.supplier_bill_no);
                        cmd.Parameters.AddWithValue("@bill_no", newMat.bill_no);
                        cmd.Parameters.AddWithValue("@c_balance", newMat.c_balance);
                        cmd.Parameters.AddWithValue("@credit_days", newMat.credit_days);
                        cmd.Parameters.AddWithValue("@total", newMat.total);
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
                            foreach (var assign in newMat.purchase_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    if (assign.purchase_n_id > 0)
                                    {
                                        SqlCommand cmd1 = new SqlCommand("Update_raw_material_purchase_nested", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);
                                        cmd1.Parameters.AddWithValue("@purchase_n_id", assign.purchase_n_id);
                                        cmd1.Parameters.AddWithValue("@brandid", assign.brandid);
                                        cmd1.Parameters.AddWithValue("@itemid", assign.itemid);
                                        cmd1.Parameters.AddWithValue("@hsn_number", assign.hsn_number);
                                        cmd1.Parameters.AddWithValue("@gst_percentage", assign.gst_percentage);
                                        cmd1.Parameters.AddWithValue("@price", assign.price);
                                        cmd1.Parameters.AddWithValue("@discount", assign.discount);
                                        cmd1.Parameters.AddWithValue("@qty", assign.qty);
                                        cmd1.Parameters.AddWithValue("@total", assign.total);
                                        cmd1.Parameters.AddWithValue("@cgst_amount", assign.cgst_amount);
                                        cmd1.Parameters.AddWithValue("@sgst_amount", assign.sgst_amount);
                                        cmd1.Parameters.AddWithValue("@igst_amount", assign.igst_amount);
                                        cmd1.Parameters.AddWithValue("@net_total", assign.net_total);                                       
                                        con11.Open();
                                        cmd1.ExecuteNonQuery();
                                    }
                                    else
                                    {
                                        SqlCommand cmd1 = new SqlCommand("Insert_raw_material_purchase_nested", con11);
                                        cmd1.CommandType = CommandType.StoredProcedure;
                                        cmd1.Parameters.AddWithValue("@purchaseid", newMat.purchaseid);                                       
                                        cmd1.Parameters.AddWithValue("@brandid", assign.brandid);
                                        cmd1.Parameters.AddWithValue("@itemid", assign.itemid);
                                        cmd1.Parameters.AddWithValue("@hsn_number", assign.hsn_number);
                                        cmd1.Parameters.AddWithValue("@gst_percentage", assign.gst_percentage);
                                        cmd1.Parameters.AddWithValue("@price", assign.price);
                                        cmd1.Parameters.AddWithValue("@discount", assign.discount);
                                        cmd1.Parameters.AddWithValue("@qty", assign.qty);
                                        cmd1.Parameters.AddWithValue("@total", assign.total);
                                        cmd1.Parameters.AddWithValue("@cgst_amount", assign.cgst_amount);
                                        cmd1.Parameters.AddWithValue("@sgst_amount", assign.sgst_amount);
                                        cmd1.Parameters.AddWithValue("@igst_amount", assign.igst_amount);
                                        cmd1.Parameters.AddWithValue("@net_total", assign.net_total);
                                        con11.Open();
                                        cmd1.ExecuteNonQuery();
                                    }
                                }
                            }
                        }                       
                    }
                    else
                    {                       
                        SqlCommand cmd = new SqlCommand("Insert_raw_material_purchase", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@supplierid", newMat.supplierid);
                        cmd.Parameters.AddWithValue("@date", newMat.date);
                        cmd.Parameters.AddWithValue("@supplier_bill_no", newMat.supplier_bill_no);
                        cmd.Parameters.AddWithValue("@bill_no", newMat.bill_no);
                        cmd.Parameters.AddWithValue("@c_balance", newMat.c_balance);
                        cmd.Parameters.AddWithValue("@credit_days", newMat.credit_days);
                        cmd.Parameters.AddWithValue("@total", newMat.total);
                        cmd.Parameters.AddWithValue("@cuid", newMat.cuid);
                        cmd.Parameters.AddWithValue("@companyid", newMat.companyid);
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
                            foreach (var assign in newMat.purchase_nested)
                            {
                                using (SqlConnection con11 = new SqlConnection(Conn))
                                {
                                    SqlCommand cmd1 = new SqlCommand("Insert_raw_material_purchase_nested", con11);
                                    cmd1.CommandType = CommandType.StoredProcedure;
                                    cmd1.Parameters.AddWithValue("@purchaseid", objmodel.recordid);
                                    cmd1.Parameters.AddWithValue("@brandid", assign.brandid);
                                    cmd1.Parameters.AddWithValue("@itemid", assign.itemid);
                                    cmd1.Parameters.AddWithValue("@hsn_number", assign.hsn_number);
                                    cmd1.Parameters.AddWithValue("@gst_percentage", assign.gst_percentage);
                                    cmd1.Parameters.AddWithValue("@price", assign.price);
                                    cmd1.Parameters.AddWithValue("@discount", assign.discount);
                                    cmd1.Parameters.AddWithValue("@qty", assign.qty);
                                    cmd1.Parameters.AddWithValue("@total", assign.total);
                                    cmd1.Parameters.AddWithValue("@cgst_amount", assign.cgst_amount);
                                    cmd1.Parameters.AddWithValue("@sgst_amount", assign.sgst_amount);
                                    cmd1.Parameters.AddWithValue("@igst_amount", assign.igst_amount);
                                    cmd1.Parameters.AddWithValue("@net_total", assign.net_total);
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
        [ActionName("Delete_raw_material_purchase")]
        public ResponseModel Delete_raw_material_purchase(int purchaseid)
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

                    SqlCommand cmd = new SqlCommand("Delete_raw_material_purchase", con);
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


        //[HttpGet]
        //public List<StockTableModel> get_rawMaterial_purchase_bill(int purchaseid)
        //{
        //    DataTable dtData = null;
        //    List<StockTableModel> mItems = new List<StockTableModel>();
        //    SqlDataAdapter adapter = null;
        //    string jsonData = string.Empty;
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(Conn))
        //        {
        //            SqlCommand cmd = new SqlCommand("get_rawMaterial_purchase_bill", con);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@purchaseid", purchaseid);
        //            con.Open();
        //            adapter = new SqlDataAdapter(cmd);
        //            dtData = new DataTable();
        //            adapter.Fill(dtData);
        //            if (dtData.Rows.Count > 0)
        //            {
        //                mItems = Helper.ConvertToList<StockTableModel>(dtData);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    return mItems;
        //}
    }
}

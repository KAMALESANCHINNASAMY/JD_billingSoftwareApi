
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System.Collections.Generic;
using System.Data;
using System;
using BillingSoftware.Model;
using BillingSoftware.Helpers;
using System.ComponentModel.Design;

namespace BillingSoftware.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class FinancialYearController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;

        public FinancialYearController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }


        [HttpGet]
        public List<FinancialYearModel> get(int companyid)
        {
            DataTable dtData = null;
            List<FinancialYearModel> mItems = new List<FinancialYearModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;

            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_financial_year", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<FinancialYearModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPost]
        [ActionName("Insert_financial_year")]
        public ResponseModel Insert_financial_year(FinancialYearModel newFinyear)
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
                    if (newFinyear.finyearid > 0)
                    {
                        SqlCommand cmd = new SqlCommand("Update_financial_year", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@finyearid", newFinyear.finyearid);
                        cmd.Parameters.AddWithValue("@companyid", newFinyear.companyid);
                        cmd.Parameters.AddWithValue("@finyear", newFinyear.finyear);
                        cmd.Parameters.AddWithValue("@fromdate", newFinyear.fromdate);
                        cmd.Parameters.AddWithValue("@todate", newFinyear.todate);
                        cmd.Parameters.AddWithValue("@cuid", newFinyear.cuid);
                        cmd.Parameters.Add(outErrorCode);
                        cmd.Parameters.Add(outErrorDesc);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        errorCode = outErrorCode.Value.ToString();
                        errorDesc = outErrorDesc.Value.ToString();                        
                        objmodel.status = errorDesc;
                        objmodel.recordid = Convert.ToInt32(newFinyear.finyearid);
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("Insert_financial_year", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@finyear", newFinyear.finyear);
                        cmd.Parameters.AddWithValue("@companyid", newFinyear.companyid);
                        cmd.Parameters.AddWithValue("@fromdate", newFinyear.fromdate);
                        cmd.Parameters.AddWithValue("@todate", newFinyear.todate);
                        cmd.Parameters.AddWithValue("@cuid", newFinyear.cuid);
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
              
            }
            return objmodel;
        }


        [HttpDelete]
        [ActionName("Delete_financial_year")]
        public ResponseModel Delete_financial_year(int finyearid)
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

                    SqlCommand cmd = new SqlCommand("Delete_financial_year", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@finyearid", finyearid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(finyearid);
                }
            }
            catch (Exception ex)
            {

            }
            return objmodel;
        }


        [HttpGet]
        public List<FinancialYearModel> getActiveFinyr(int companyid)
        {
            DataTable dtData = null;
            List<FinancialYearModel> mItems = new List<FinancialYearModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;

            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("GetActive_financial_year", con);
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<FinancialYearModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpPut]
        [ActionName("UpdateActiveStatus_financial_year")]
        public ResponseModel UpdateActiveStatus_financial_year(int finyearid,int companyid)
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

                    SqlCommand cmd = new SqlCommand("UpdateActiveStatus_financial_year", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@finyearid", finyearid);
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.Add(outErrorCode);
                    cmd.Parameters.Add(outErrorDesc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errorCode = outErrorCode.Value.ToString();
                    errorDesc = outErrorDesc.Value.ToString();
                    objmodel.status = errorDesc;
                    objmodel.recordid = Convert.ToInt32(finyearid);
                    objmodel.recordid = Convert.ToInt32(companyid);

                }


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            return objmodel;
        }


    }   
}

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
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using System.ComponentModel.Design;

namespace BillingSoftware.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class SalesReportsController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;

        public SalesReportsController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<SalesBillingModel> get_customer_payment_reminder(string date, int companyid)
        {
            DataTable dtData = null;
            List<SalesBillingModel> mItems = new List<SalesBillingModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_customer_payment_reminder", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@date", date);
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SalesBillingModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<SalesBillingModel> get_customer_payment_nongst_reminder(string date, int companyid)
        {
            DataTable dtData = null;
            List<SalesBillingModel> mItems = new List<SalesBillingModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_customer_payment_nongst_reminder", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@date", date);
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SalesBillingModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<StockTableModel> get_sales_billing_from_to_date(string fromdate, string todate, int customerid, int companyid)
        {
            DataTable dtData = null;
            List<StockTableModel> mItems = new List<StockTableModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_sales_billing_from_to_date", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@customerid", customerid);
                    cmd.Parameters.AddWithValue("@fromdate", fromdate);
                    cmd.Parameters.AddWithValue("@todate", todate);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<StockTableModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<StockTableModel> get_sales_billingNongst_from_to_date(string fromdate, string todate, int customerid, int companyid)
        {
            DataTable dtData = null;
            List<StockTableModel> mItems = new List<StockTableModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_sales_billingNongst_from_to_date", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@customerid", customerid);
                    cmd.Parameters.AddWithValue("@fromdate", fromdate);
                    cmd.Parameters.AddWithValue("@todate", todate);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<StockTableModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<StockTableModel> get_gstsales_report_bycustomerid(int customerid, int companyid)
        {
            DataTable dtData = null;
            List<StockTableModel> mItems = new List<StockTableModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_gstsales_report_bycustomerid", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@customerid", customerid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<StockTableModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<StockTableModel> get_Nongstsales_report_bycustomerid(int customerid, int companyid)
        {
            DataTable dtData = null;
            List<StockTableModel> mItems = new List<StockTableModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_Nongstsales_report_bycustomerid", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@customerid", customerid);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<StockTableModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<sales_billReturn_Debitnested_Model> get_sales_billing_return_from_to_date(string fromdate, string todate, int customerid, int companyid)
        {
            DataTable dtData = null;
            List<sales_billReturn_Debitnested_Model> mItems = new List<sales_billReturn_Debitnested_Model>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_sales_billing_return_from_to_date", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@customerid", customerid);
                    cmd.Parameters.AddWithValue("@fromdate", fromdate);
                    cmd.Parameters.AddWithValue("@todate", todate);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<sales_billReturn_Debitnested_Model>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<sales_billReturn_Debitnested_Model> get_sales_billingNongst_return_from_to_date(string fromdate, string todate, int customerid, int companyid)
        {
            DataTable dtData = null;
            List<sales_billReturn_Debitnested_Model> mItems = new List<sales_billReturn_Debitnested_Model>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_sales_billingNongst_return_from_to_date", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@customerid", customerid);
                    cmd.Parameters.AddWithValue("@fromdate", fromdate);
                    cmd.Parameters.AddWithValue("@todate", todate);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<sales_billReturn_Debitnested_Model>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<CustomerPaymentModel> get_sales_billing_payment_from_to_date(string fromdate, string todate, int customerid, int companyid)
        {
            DataTable dtData = null;
            List<CustomerPaymentModel> mItems = new List<CustomerPaymentModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_sales_billing_payment_from_to_date", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@customerid", customerid);
                    cmd.Parameters.AddWithValue("@fromdate", fromdate);
                    cmd.Parameters.AddWithValue("@todate", todate);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<CustomerPaymentModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<CustomerPaymentModel> get_sales_billing_NONgstpayment_from_to_date(string fromdate, string todate, int customerid, int companyid)
        {
            DataTable dtData = null;
            List<CustomerPaymentModel> mItems = new List<CustomerPaymentModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_sales_billing_NONgstpayment_from_to_date", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@customerid", customerid);
                    cmd.Parameters.AddWithValue("@fromdate", fromdate);
                    cmd.Parameters.AddWithValue("@todate", todate);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<CustomerPaymentModel>(dtData);
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

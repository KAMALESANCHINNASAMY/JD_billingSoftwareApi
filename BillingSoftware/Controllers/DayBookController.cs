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
    public class DayBookController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        private string errorCode;
        private object errorDesc;
        public DayBookController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            appSettings = appSettings;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<DayBookModel> get_daybook_bydate(int companyid, string fromdate, string todate, int bankid)
        {
            DataTable dtData = null;
            List<DayBookModel> mItems = new List<DayBookModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    if (bankid == 0)
                    {
                        SqlCommand cmd = new SqlCommand("get_daybook_bydate", con);
                        cmd.Parameters.AddWithValue("@companyid", companyid);
                        cmd.Parameters.AddWithValue("@fromdate", fromdate);
                        cmd.Parameters.AddWithValue("@todate", todate);
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        adapter = new SqlDataAdapter(cmd);
                        dtData = new DataTable();
                        adapter.Fill(dtData);
                        if (dtData.Rows.Count > 0)
                        {
                            mItems = Helper.ConvertToList<DayBookModel>(dtData);
                        }
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("get_daybook_bybankid", con);
                        cmd.Parameters.AddWithValue("@companyid", companyid);
                        cmd.Parameters.AddWithValue("@fromdate", fromdate);
                        cmd.Parameters.AddWithValue("@todate", todate);
                        cmd.Parameters.AddWithValue("@bankid", bankid);
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        adapter = new SqlDataAdapter(cmd);
                        dtData = new DataTable();
                        adapter.Fill(dtData);
                        if (dtData.Rows.Count > 0)
                        {
                            mItems = Helper.ConvertToList<DayBookModel>(dtData);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }


        [HttpGet]
        public Dictionary<string, List<DayBookModel>> get_profit_loss(int companyid, string fromdate, string todate)
        {
            Dictionary<string, List<DayBookModel>> allTables = new Dictionary<string, List<DayBookModel>>();

            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_profit_loss", con);
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@fromdate", fromdate);
                    cmd.Parameters.AddWithValue("@todate", todate);
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    adapter.Fill(ds);  // Capture multiple result sets

                    Console.WriteLine("Total Tables Returned: " + ds.Tables.Count);

                    // Loop through each table in the DataSet
                    for (int i = 0; i < ds.Tables.Count; i++)
                    {
                        List<DayBookModel> mItems = new List<DayBookModel>();

                        foreach (DataRow row in ds.Tables[i].Rows)
                        {
                            DayBookModel model = new DayBookModel();

                            // Dynamically map fields
                            if (row.Table.Columns.Contains("date"))
                                model.date = row["date"] != DBNull.Value ? row["date"].ToString() : null;

                            if (row.Table.Columns.Contains("fromdate"))
                                model.fromdate = row["fromdate"] != DBNull.Value ? row["fromdate"].ToString() : null;

                            if (row.Table.Columns.Contains("todate"))
                                model.todate = row["todate"] != DBNull.Value ? row["todate"].ToString() : null;

                            if (row.Table.Columns.Contains("description"))
                                model.description = row["description"].ToString();

                            if (row.Table.Columns.Contains("payment_type"))
                                model.payment_type = row["payment_type"] != DBNull.Value ? row["payment_type"].ToString() : null;

                            if (row.Table.Columns.Contains("bank_name"))
                                model.bank_name = row["bank_name"] != DBNull.Value ? row["bank_name"].ToString() : null;

                            if (row.Table.Columns.Contains("income"))
                                model.income = row["income"] != DBNull.Value ? Convert.ToDecimal(row["income"]) : 0;

                            if (row.Table.Columns.Contains("expense"))
                                model.expense = row["expense"] != DBNull.Value ? Convert.ToDecimal(row["expense"]) : 0;

                            if (row.Table.Columns.Contains("net_amount"))
                                model.net_amount = row["net_amount"] != DBNull.Value ? Convert.ToDecimal(row["net_amount"]) : 0;

                            if (row.Table.Columns.Contains("return_net_amount"))
                                model.return_net_amount = row["return_net_amount"] != DBNull.Value ? Convert.ToDecimal(row["return_net_amount"]) : 0;

                            if (row.Table.Columns.Contains("reference"))
                                model.reference = row["reference"] != DBNull.Value ? row["reference"].ToString() : null;

                            if (row.Table.Columns.Contains("old_amount"))
                                model.old_amount = row["old_amount"] != DBNull.Value ? Convert.ToDecimal(row["old_amount"]) : 0;

                            mItems.Add(model);
                        }

                        // Assign table name dynamically
                        string tableName = $"Table_{i + 1}";
                        allTables.Add(tableName, mItems);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                // Handle the error (log it)
            }

            return allTables;
        }

    }
}

public class DayBookModel
{
    public string date { get; set; }
    public string description { get; set; }
    public string payment_type { get; set; }
    public string bank_name { get; set; }
    public decimal income { get; set; }
    public decimal expense { get; set; }
    public decimal net_amount { get; set; }
    public decimal return_net_amount { get; set; }
    public string reference { get; set; }
    public decimal old_amount { get; set; }
    public string fromdate { get; set; }
    public string todate { get; set; }
}

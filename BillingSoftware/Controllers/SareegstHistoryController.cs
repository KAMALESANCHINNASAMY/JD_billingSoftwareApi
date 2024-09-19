using BillingSoftware.Helpers;
using BillingSoftware.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using System.Data;
using System;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;

namespace BillingSoftware.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class SareegstHistoryController : ControllerBase
    {

        private readonly IOptions<DBModel> appSettings;

        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        private string errorCode;
        private object errorDesc;

        public SareegstHistoryController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            appSettings = appSettings;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<SareegstHistoryModel> get_gst_purchase_historyof_sareeby_ref_code(int companyid, string ref_code)
        {
            DataTable dtData = null;
            List<SareegstHistoryModel> mItems = new List<SareegstHistoryModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_gst_purchase_historyof_sareeby_ref_code", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@ref_code", ref_code);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SareegstHistoryModel>(dtData);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return mItems;
        }

        [HttpGet]
        public List<SareegstHistoryModel> get_gst_purchase_historyof_sareeby_si_code(int companyid, string si_code)
        {
            DataTable dtData = null;
            List<SareegstHistoryModel> mItems = new List<SareegstHistoryModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_gst_purchase_historyof_sareeby_si_code", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@companyid", companyid);
                    cmd.Parameters.AddWithValue("@si_code", si_code);
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<SareegstHistoryModel>(dtData);
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

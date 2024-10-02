﻿using BillingSoftware.Helpers;
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
    public class RawProductReportController : ControllerBase
    {
        private readonly IOptions<DBModel> appSettings;
        public IConfiguration Configuration { get; }
        string Conn = string.Empty;
        private string errorCode;
        private object errorDesc;
        public RawProductReportController(IConfiguration configuration, IOptions<DBModel> appSettings)
        {
            Configuration = configuration;
            appSettings = appSettings;
            Conn = new Database().GetConnectionString();
        }

        [HttpGet]
        public List<NestedProductModel> get_stock_by_raw_product(int companyid)
        {
            DataTable dtData = null;
            List<NestedProductModel> mItems = new List<NestedProductModel>();
            SqlDataAdapter adapter = null;
            string jsonData = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(Conn))
                {
                    SqlCommand cmd = new SqlCommand("get_stock_by_raw_product", con);
                    cmd.Parameters.AddWithValue("companyid", companyid);
                    cmd.CommandType = CommandType.StoredProcedure;                    
                    con.Open();
                    adapter = new SqlDataAdapter(cmd);
                    dtData = new DataTable();
                    adapter.Fill(dtData);
                    if (dtData.Rows.Count > 0)
                    {
                        mItems = Helper.ConvertToList<NestedProductModel>(dtData);
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

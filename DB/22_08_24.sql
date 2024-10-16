USE [BillingSoftware]
GO
/****** Object:  Table [dbo].[brand_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand_master](
	[brandid] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](255) NULL,
	[companyid] [int] NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[brandid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_master](
	[companyid] [int] IDENTITY(1,1) NOT NULL,
	[company_sdate] [nvarchar](255) NULL,
	[company_name] [nvarchar](255) NULL,
	[display_name] [nvarchar](255) NULL,
	[door_no] [nvarchar](255) NULL,
	[building_name] [nvarchar](255) NULL,
	[street_name] [nvarchar](255) NULL,
	[streent_name1] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[c_location] [nvarchar](255) NULL,
	[pincode] [nvarchar](255) NULL,
	[post] [nvarchar](255) NULL,
	[taluk] [nvarchar](255) NULL,
	[district] [nvarchar](255) NULL,
	[website] [nvarchar](255) NULL,
	[owner_name] [nvarchar](255) NULL,
	[mobile] [nvarchar](255) NULL,
	[office_phno] [nvarchar](255) NULL,
	[logo] [nvarchar](max) NULL,
	[bank_name] [nvarchar](255) NULL,
	[ac_holder_name] [nvarchar](255) NULL,
	[ac_no] [nvarchar](255) NULL,
	[ifsc_code] [nvarchar](255) NULL,
	[gst_in] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[activestatus] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__company___AD5755B8FDD9768B] PRIMARY KEY CLUSTERED 
(
	[companyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_advance]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_advance](
	[advanceid] [int] IDENTITY(1,1) NOT NULL,
	[customerid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[advance_amount] [nvarchar](255) NULL,
	[description] [nvarchar](1255) NULL,
PRIMARY KEY CLUSTERED 
(
	[advanceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_master](
	[customerid] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](255) NULL,
	[mobile_no] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[state_code] [nvarchar](255) NULL,
	[gst_in] [nvarchar](255) NULL,
	[balance] [nvarchar](255) NULL,
	[address] [nvarchar](max) NULL,
	[shipping_address] [nvarchar](max) NULL,
	[companyid] [int] NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__customer__B61ED7F56B139AE4] PRIMARY KEY CLUSTERED 
(
	[customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_payment]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_payment](
	[paymentid] [int] IDENTITY(1,1) NOT NULL,
	[customerid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[balance] [nvarchar](255) NULL,
	[advanceid] [int] NULL,
	[amount_mode] [nvarchar](255) NULL,
	[payment_type] [nvarchar](255) NULL,
	[cheque_no] [nvarchar](255) NULL,
	[c_date] [nvarchar](255) NULL,
	[c_amount] [nvarchar](255) NULL,
	[adnp_amount] [nvarchar](255) NULL,
	[companyid] [int] NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__customer__AF26EBEE3B4A8306] PRIMARY KEY CLUSTERED 
(
	[paymentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_payment_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_payment_nested](
	[payment_n_id] [int] IDENTITY(1,1) NOT NULL,
	[paymentid] [int] NULL,
	[entryid] [int] NULL,
	[customerid] [int] NULL,
	[total_amount] [nvarchar](255) NULL,
	[deduction_amount] [nvarchar](255) NULL,
	[gst] [bit] NULL,
	[non_gst] [bit] NULL,
	[isbal] [bit] NULL,
 CONSTRAINT [PK__customer__2242E74732EB138F] PRIMARY KEY CLUSTERED 
(
	[payment_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[financial_year]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[financial_year](
	[finyearid] [int] IDENTITY(1,1) NOT NULL,
	[companyid] [int] NULL,
	[finyear] [nvarchar](255) NULL,
	[fromdate] [nvarchar](255) NULL,
	[todate] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[status] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[finyearid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[given_to_weavers]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[given_to_weavers](
	[purchaseid] [int] IDENTITY(1,1) NOT NULL,
	[weaverid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[mode] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[companyid] [int] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[purchaseid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giventoweavers]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giventoweavers](
	[givenid] [int] IDENTITY(1,1) NOT NULL,
	[purchaseid] [int] NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[description] [nvarchar](1255) NULL,
	[g_gram] [nvarchar](255) NULL,
	[g_rate] [nvarchar](255) NULL,
	[g_total] [nvarchar](255) NULL,
	[g_advance] [nvarchar](255) NULL,
 CONSTRAINT [PK__giventow__25CC1B181B2F51B7] PRIMARY KEY CLUSTERED 
(
	[givenid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gst_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gst_master](
	[gstid] [int] IDENTITY(1,1) NOT NULL,
	[companyid] [int] NULL,
	[gst_ID] [nvarchar](255) NULL,
	[gst_percentage] [nvarchar](255) NULL,
	[igst_percentage] [nvarchar](255) NULL,
	[c_gst] [nvarchar](255) NULL,
	[s_gst] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__gst_mast__4DE289D2ABF30A36] PRIMARY KEY CLUSTERED 
(
	[gstid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hsn_group]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hsn_group](
	[hsnid] [int] IDENTITY(1,1) NOT NULL,
	[companyid] [int] NULL,
	[gstid] [int] NULL,
	[hsn_number] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[hsnid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item_group]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_group](
	[item_groupid] [int] IDENTITY(1,1) NOT NULL,
	[companyid] [int] NULL,
	[item_group_name] [nvarchar](255) NULL,
	[hsnid] [int] NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[item_groupid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_master](
	[itemid] [int] IDENTITY(1,1) NOT NULL,
	[companyid] [int] NULL,
	[unitid] [int] NULL,
	[brandid] [int] NULL,
	[item_groupid] [int] NULL,
	[item_code] [nvarchar](255) NULL,
	[item_name] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [date] NULL,
	[muid] [int] NULL,
	[mdate] [date] NULL,
 CONSTRAINT [PK__item_mas__56A22C92F18363C5] PRIMARY KEY CLUSTERED 
(
	[itemid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[raw_material_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[raw_material_purchase](
	[purchaseid] [int] IDENTITY(1,1) NOT NULL,
	[supplierid] [int] NULL,
	[date] [nvarchar](250) NULL,
	[supplier_bill_no] [nvarchar](255) NULL,
	[bill_no] [nvarchar](255) NULL,
	[c_balance] [nvarchar](255) NULL,
	[credit_days] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[companyid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__raw_mate__02662E44D9983D60] PRIMARY KEY CLUSTERED 
(
	[purchaseid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[raw_material_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[raw_material_purchase_nested](
	[purchase_n_id] [int] IDENTITY(1,1) NOT NULL,
	[purchaseid] [int] NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[hsn_number] [nvarchar](255) NULL,
	[gst_percentage] [nvarchar](255) NULL,
	[price] [nvarchar](255) NULL,
	[discount] [nvarchar](255) NULL,
	[qty] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[cgst_amount] [nvarchar](255) NULL,
	[sgst_amount] [nvarchar](255) NULL,
	[igst_amount] [nvarchar](255) NULL,
	[net_total] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[purchase_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_billing]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_billing](
	[entryid] [int] IDENTITY(1,1) NOT NULL,
	[customerid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[bill_no] [nvarchar](255) NULL,
	[credit_days] [nvarchar](255) NULL,
	[balance] [nvarchar](255) NULL,
	[billing_address] [nvarchar](max) NULL,
	[shipping_address] [nvarchar](max) NULL,
	[total] [nvarchar](255) NULL,
	[companyid] [int] NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__sales_bi__D13F33FDA44F89F0] PRIMARY KEY CLUSTERED 
(
	[entryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_billing_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_billing_nested](
	[entry_n_id] [int] IDENTITY(1,1) NOT NULL,
	[entryid] [int] NULL,
	[stockid] [int] NULL,
	[ref_code] [nvarchar](255) NULL,
	[si_code] [nvarchar](255) NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[hsn_number] [nvarchar](255) NULL,
	[gst_percentage] [nvarchar](255) NULL,
	[price] [nvarchar](255) NULL,
	[discount] [nvarchar](255) NULL,
	[qty] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[cgst_amount] [nvarchar](255) NULL,
	[sgst_amount] [nvarchar](255) NULL,
	[igst_amount] [nvarchar](255) NULL,
	[net_total] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[entry_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_billing_nested_nongst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_billing_nested_nongst](
	[entry_n_id] [int] IDENTITY(1,1) NOT NULL,
	[entryid] [int] NULL,
	[stockid] [int] NULL,
	[ref_code] [nvarchar](255) NULL,
	[si_code] [nvarchar](255) NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[hsn_number] [nvarchar](255) NULL,
	[price] [nvarchar](255) NULL,
	[discount] [nvarchar](255) NULL,
	[qty] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[entry_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_billing_nongst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_billing_nongst](
	[entryid] [int] IDENTITY(1,1) NOT NULL,
	[customerid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[bill_no] [nvarchar](255) NULL,
	[balance] [nvarchar](255) NULL,
	[credit_days] [nvarchar](255) NULL,
	[billing_address] [nvarchar](max) NULL,
	[shipping_address] [nvarchar](max) NULL,
	[total] [nvarchar](255) NULL,
	[companyid] [int] NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[entryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_billing_returnDebit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_billing_returnDebit](
	[returndebit_id] [int] IDENTITY(1,1) NOT NULL,
	[entryid] [int] NULL,
	[customerid] [int] NULL,
	[bill_date] [nvarchar](255) NULL,
	[invoice_no] [nvarchar](255) NULL,
	[invoice_date] [nvarchar](255) NULL,
	[return_no] [nvarchar](255) NULL,
	[return_date] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[return_total] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[companyid] [int] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__sales_bi__B26FA53F57B40F2E] PRIMARY KEY CLUSTERED 
(
	[returndebit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_billing_returnDebit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_billing_returnDebit_nested](
	[returndebit_n_id] [int] IDENTITY(1,1) NOT NULL,
	[returndebit_id] [int] NULL,
	[entryid] [int] NULL,
	[entry_n_id] [int] NULL,
	[purchaseid] [int] NULL,
	[purchase_n_id] [int] NULL,
	[ref_code] [nvarchar](255) NULL,
	[si_code] [nvarchar](255) NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[hsn_number] [nvarchar](255) NULL,
	[gst_percentage] [nvarchar](255) NULL,
	[price] [nvarchar](255) NULL,
	[discount] [nvarchar](255) NULL,
	[qty] [nvarchar](255) NULL,
	[return_qty] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[return_total] [nvarchar](255) NULL,
	[cgst_amount] [nvarchar](255) NULL,
	[return_cgst_amount] [nvarchar](255) NULL,
	[sgst_amount] [nvarchar](255) NULL,
	[return_sgst_amount] [nvarchar](255) NULL,
	[igst_amount] [nvarchar](255) NULL,
	[return_igst_amount] [nvarchar](255) NULL,
	[net_total] [nvarchar](255) NULL,
	[return_net_total] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[returndebit_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_billingNongst_returnDebit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_billingNongst_returnDebit](
	[returndebit_id] [int] IDENTITY(1,1) NOT NULL,
	[entryid] [int] NULL,
	[customerid] [int] NULL,
	[bill_date] [nvarchar](255) NULL,
	[invoice_no] [nvarchar](255) NULL,
	[invoice_date] [nvarchar](255) NULL,
	[return_no] [nvarchar](255) NULL,
	[return_date] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[return_total] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[companyid] [int] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__sales_bi__B26FA53F0DC2C584] PRIMARY KEY CLUSTERED 
(
	[returndebit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_billingNongst_returnDebit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_billingNongst_returnDebit_nested](
	[returndebit_n_id] [int] IDENTITY(1,1) NOT NULL,
	[returndebit_id] [int] NULL,
	[entryid] [int] NULL,
	[entry_n_id] [int] NULL,
	[purchaseid] [int] NULL,
	[purchase_n_id] [int] NULL,
	[ref_code] [nvarchar](255) NULL,
	[si_code] [nvarchar](255) NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[hsn_number] [nvarchar](255) NULL,
	[price] [nvarchar](255) NULL,
	[discount] [nvarchar](255) NULL,
	[qty] [nvarchar](255) NULL,
	[return_qty] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[return_total] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[returndebit_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock_table]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_table](
	[stockid] [int] IDENTITY(1,1) NOT NULL,
	[purchaseid] [int] NULL,
	[purchase_n_id] [int] NULL,
	[si_code] [nvarchar](255) NULL,
	[ref_code] [nvarchar](255) NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[gst_percentage] [nvarchar](255) NULL,
	[hsn_number] [nvarchar](255) NULL,
	[price] [nvarchar](255) NULL,
	[discount] [nvarchar](255) NULL,
	[qty] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[cgst_amount] [nvarchar](255) NULL,
	[sgst_amount] [nvarchar](255) NULL,
	[igst_amount] [nvarchar](255) NULL,
	[net_total] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[activestatus] [bit] NULL,
	[purchasein] [bit] NULL,
	[purchasereturn] [bit] NULL,
	[salesin] [bit] NULL,
	[salesreturn] [bit] NULL,
	[third_party_gst] [bit] NULL,
	[third_party_nongst] [bit] NULL,
	[weavers] [bit] NULL,
	[companyid] [int] NULL,
 CONSTRAINT [PK__stock_ta__CBA093EB22E441FB] PRIMARY KEY CLUSTERED 
(
	[stockid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier_advance]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier_advance](
	[advanceid] [int] IDENTITY(1,1) NOT NULL,
	[supplierid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[advance_amount] [nvarchar](255) NULL,
	[description] [nvarchar](1255) NULL,
 CONSTRAINT [PK__supplier__5A88D68EDB351DFF] PRIMARY KEY CLUSTERED 
(
	[advanceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier_debit_note]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier_debit_note](
	[s_debitid] [int] IDENTITY(1,1) NOT NULL,
	[purchaseid] [int] NULL,
	[supplierid] [int] NULL,
	[supplier_bill_no] [nvarchar](255) NULL,
	[date] [nvarchar](255) NULL,
	[return_no] [nvarchar](255) NULL,
	[return_date] [nvarchar](255) NULL,
	[gst_in] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[return_total] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[companyid] [int] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__supplier__7AA45E3FCC423650] PRIMARY KEY CLUSTERED 
(
	[s_debitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier_debit_note_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier_debit_note_nested](
	[s_debitid_n_id] [int] IDENTITY(1,1) NOT NULL,
	[purchase_n_id] [int] NULL,
	[s_debitid] [int] NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[hsn_number] [nvarchar](255) NULL,
	[gst_percentage] [nvarchar](255) NULL,
	[price] [nvarchar](255) NULL,
	[discount] [nvarchar](255) NULL,
	[qty] [nvarchar](255) NULL,
	[return_qty] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[return_total] [nvarchar](255) NULL,
	[cgst_amount] [nvarchar](255) NULL,
	[return_cgst_amount] [nvarchar](255) NULL,
	[sgst_amount] [nvarchar](255) NULL,
	[return_sgst_amount] [nvarchar](255) NULL,
	[igst_amount] [nvarchar](255) NULL,
	[return_igst_amount] [nvarchar](255) NULL,
	[net_total] [nvarchar](255) NULL,
	[return_net_total] [nvarchar](255) NULL,
 CONSTRAINT [PK__supplier__CB02F8DA13D8E99F] PRIMARY KEY CLUSTERED 
(
	[s_debitid_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier_master](
	[supplierid] [int] IDENTITY(1,1) NOT NULL,
	[supplier_name] [nvarchar](255) NULL,
	[mobile_no] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[state_code] [nvarchar](255) NULL,
	[gst_in] [nvarchar](255) NULL,
	[balance] [nvarchar](255) NULL,
	[address] [nvarchar](max) NULL,
	[shipping_address] [nvarchar](max) NULL,
	[companyid] [int] NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__supplier__DBF034E5069E7B97] PRIMARY KEY CLUSTERED 
(
	[supplierid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier_payment]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier_payment](
	[paymentid] [int] IDENTITY(1,1) NOT NULL,
	[supplierid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[balance] [nvarchar](255) NULL,
	[advanceid] [int] NULL,
	[amount_mode] [nvarchar](255) NULL,
	[payment_type] [nvarchar](255) NULL,
	[cheque_no] [nvarchar](255) NULL,
	[c_date] [nvarchar](255) NULL,
	[c_amount] [nvarchar](255) NULL,
	[adnp_amount] [nvarchar](255) NULL,
	[companyid] [int] NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__supplier__AF26EBEE05A82811] PRIMARY KEY CLUSTERED 
(
	[paymentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier_payment_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier_payment_nested](
	[payment_n_id] [int] IDENTITY(1,1) NOT NULL,
	[paymentid] [int] NULL,
	[purchaseid] [int] NULL,
	[supplierid] [int] NULL,
	[total_amount] [nvarchar](255) NULL,
	[deduction_amount] [nvarchar](255) NULL,
	[isbill] [bit] NULL,
	[isbal] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[third_party_gst_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[third_party_gst_purchase](
	[purchaseid] [int] IDENTITY(1,1) NOT NULL,
	[third_partyid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[invoice_no] [nvarchar](255) NULL,
	[bill_no] [nvarchar](255) NULL,
	[c_balance] [nvarchar](255) NULL,
	[credit_days] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[companyid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[purchaseid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[third_party_gst_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[third_party_gst_purchase_nested](
	[purchase_n_id] [int] IDENTITY(1,1) NOT NULL,
	[purchaseid] [int] NULL,
	[si_code] [nvarchar](255) NULL,
	[ref_code] [nvarchar](255) NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[hsn_number] [nvarchar](255) NULL,
	[gst_percentage] [nvarchar](255) NULL,
	[price] [nvarchar](255) NULL,
	[discount] [nvarchar](255) NULL,
	[qty] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[cgst_amount] [nvarchar](255) NULL,
	[sgst_amount] [nvarchar](255) NULL,
	[igst_amount] [nvarchar](255) NULL,
	[net_total] [nvarchar](255) NULL,
 CONSTRAINT [PK__third_pa__5E1BC3CC2040273D] PRIMARY KEY CLUSTERED 
(
	[purchase_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[third_party_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[third_party_master](
	[third_partyid] [int] IDENTITY(1,1) NOT NULL,
	[party_name] [nvarchar](255) NULL,
	[short_code] [nvarchar](255) NULL,
	[mobile] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[state_code] [nvarchar](255) NULL,
	[address] [nvarchar](max) NULL,
	[balance] [nvarchar](255) NULL,
	[gst_in] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[companyid] [int] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__third_pa__05BE7C10C6170B35] PRIMARY KEY CLUSTERED 
(
	[third_partyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[third_party_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[third_party_purchase](
	[purchaseid] [int] IDENTITY(1,1) NOT NULL,
	[third_partyid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[invoice_no] [nvarchar](255) NULL,
	[bill_no] [nvarchar](255) NULL,
	[c_balance] [nvarchar](255) NULL,
	[credit_days] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[companyid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[purchaseid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[third_party_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[third_party_purchase_nested](
	[purchase_n_id] [int] IDENTITY(1,1) NOT NULL,
	[purchaseid] [int] NULL,
	[si_code] [nvarchar](255) NULL,
	[ref_code] [nvarchar](255) NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[hsn_number] [nvarchar](255) NULL,
	[price] [nvarchar](255) NULL,
	[discount] [nvarchar](255) NULL,
	[qty] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[purchase_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[third_partyPurchasegst_debit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[third_partyPurchasegst_debit](
	[thirdPartyDebitid] [int] IDENTITY(1,1) NOT NULL,
	[purchaseid] [int] NULL,
	[third_partyid] [int] NULL,
	[purchase_date] [nvarchar](255) NULL,
	[invoice_no] [nvarchar](255) NULL,
	[invoice_date] [nvarchar](255) NULL,
	[return_no] [nvarchar](255) NULL,
	[return_date] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[return_total] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[companyid] [int] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__third_pa__E1565B97E3D4F0BD] PRIMARY KEY CLUSTERED 
(
	[thirdPartyDebitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[third_partyPurchasegst_debit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[third_partyPurchasegst_debit_nested](
	[thirdPartyDebit_n_id] [int] IDENTITY(1,1) NOT NULL,
	[thirdPartyDebitid] [int] NULL,
	[purchaseid] [int] NULL,
	[purchase_n_id] [int] NULL,
	[ref_code] [nvarchar](255) NULL,
	[si_code] [nvarchar](255) NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[hsn_number] [nvarchar](255) NULL,
	[gst_percentage] [nvarchar](255) NULL,
	[price] [nvarchar](255) NULL,
	[discount] [nvarchar](255) NULL,
	[qty] [nvarchar](255) NULL,
	[return_qty] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[return_total] [nvarchar](255) NULL,
	[cgst_amount] [nvarchar](255) NULL,
	[return_cgst_amount] [nvarchar](255) NULL,
	[sgst_amount] [nvarchar](255) NULL,
	[return_sgst_amount] [nvarchar](255) NULL,
	[igst_amount] [nvarchar](255) NULL,
	[return_igst_amount] [nvarchar](255) NULL,
	[net_total] [nvarchar](255) NULL,
	[return_net_total] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[thirdPartyDebit_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[third_partyPurchaseNongst_debit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[third_partyPurchaseNongst_debit](
	[thirdPartyDebitid] [int] IDENTITY(1,1) NOT NULL,
	[purchaseid] [int] NULL,
	[third_partyid] [int] NULL,
	[purchase_date] [nvarchar](255) NULL,
	[invoice_no] [nvarchar](255) NULL,
	[invoice_date] [nvarchar](255) NULL,
	[return_no] [nvarchar](255) NULL,
	[return_date] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[return_total] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[companyid] [int] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__third_pa__E1565B97348C39A6] PRIMARY KEY CLUSTERED 
(
	[thirdPartyDebitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[third_partyPurchaseNongst_debit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[third_partyPurchaseNongst_debit_nested](
	[thirdPartyDebit_n_id] [int] IDENTITY(1,1) NOT NULL,
	[thirdPartyDebitid] [int] NULL,
	[purchase_n_id] [int] NULL,
	[purchaseid] [int] NULL,
	[ref_code] [nvarchar](255) NULL,
	[si_code] [nvarchar](255) NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[hsn_number] [nvarchar](255) NULL,
	[price] [nvarchar](255) NULL,
	[discount] [nvarchar](255) NULL,
	[qty] [nvarchar](255) NULL,
	[return_qty] [nvarchar](255) NULL,
	[total] [nvarchar](255) NULL,
	[return_total] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[thirdPartyDebit_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thirdparty_advance]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thirdparty_advance](
	[advanceid] [int] IDENTITY(1,1) NOT NULL,
	[third_partyid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[advance_amount] [nvarchar](255) NULL,
	[description] [nvarchar](1255) NULL,
PRIMARY KEY CLUSTERED 
(
	[advanceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thirdparty_payment]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thirdparty_payment](
	[paymentid] [int] IDENTITY(1,1) NOT NULL,
	[third_partyid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[balance] [nvarchar](255) NULL,
	[advanceid] [int] NULL,
	[amount_mode] [nvarchar](255) NULL,
	[payment_type] [nvarchar](255) NULL,
	[cheque_no] [nvarchar](255) NULL,
	[c_date] [nvarchar](255) NULL,
	[c_amount] [nvarchar](255) NULL,
	[adnp_amount] [nvarchar](255) NULL,
	[companyid] [int] NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__thirdpar__AF26EBEEAE4242A9] PRIMARY KEY CLUSTERED 
(
	[paymentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thirdparty_payment_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thirdparty_payment_nested](
	[payment_n_id] [int] IDENTITY(1,1) NOT NULL,
	[paymentid] [int] NULL,
	[purchaseid] [int] NULL,
	[third_partyid] [int] NULL,
	[total_amount] [nvarchar](255) NULL,
	[deduction_amount] [nvarchar](255) NULL,
	[gst] [bit] NULL,
	[non_gst] [bit] NULL,
	[isbal] [bit] NULL,
 CONSTRAINT [PK__thirdpar__2242E74707FAC4AF] PRIMARY KEY CLUSTERED 
(
	[payment_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unit_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unit_master](
	[unitid] [int] IDENTITY(1,1) NOT NULL,
	[companyid] [int] NULL,
	[unit_name] [nvarchar](255) NULL,
	[unit_code] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[unitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_profile]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_profile](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[companyid] [int] NULL,
	[user_name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[m_companyid] [int] NULL,
	[s_companyid] [nvarchar](255) NULL,
	[main_menus] [nvarchar](max) NULL,
	[sub_menus] [nvarchar](max) NULL,
	[img] [nvarchar](max) NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [date] NULL,
	[muid] [int] NULL,
	[mdate] [date] NULL,
 CONSTRAINT [PK__user_pro__CBA1B2570CCC1122] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[weaver_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weaver_master](
	[weaverid] [int] IDENTITY(1,1) NOT NULL,
	[weaver_name] [nvarchar](255) NULL,
	[short_code] [nvarchar](255) NULL,
	[mobile] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[state_code] [nvarchar](255) NULL,
	[balance] [nvarchar](255) NULL,
	[companyid] [int] NULL,
	[isactive] [bit] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__weaver_m__A9FD489C7C1233BE] PRIMARY KEY CLUSTERED 
(
	[weaverid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[weavers_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weavers_purchase](
	[purchaseid] [int] IDENTITY(1,1) NOT NULL,
	[weaverid] [int] NULL,
	[date] [nvarchar](255) NULL,
	[mode] [nvarchar](255) NULL,
	[isactive] [bit] NULL,
	[companyid] [int] NULL,
	[cuid] [int] NULL,
	[cdate] [datetime] NULL,
	[muid] [int] NULL,
	[mdate] [datetime] NULL,
 CONSTRAINT [PK__weavers___02662E444D6BD448] PRIMARY KEY CLUSTERED 
(
	[purchaseid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[weavers_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weavers_purchase_nested](
	[purchase_n_id] [int] IDENTITY(1,1) NOT NULL,
	[purchaseid] [int] NULL,
	[si_code] [nvarchar](255) NULL,
	[ref_code] [nvarchar](255) NULL,
	[brandid] [int] NULL,
	[itemid] [int] NULL,
	[description] [nvarchar](1255) NULL,
	[qty] [nvarchar](255) NULL,
	[r_gram] [nvarchar](255) NULL,
	[r_advance] [nvarchar](255) NULL,
 CONSTRAINT [PK__weavers___5E1BC3CCBE06BD5C] PRIMARY KEY CLUSTERED 
(
	[purchase_n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customer_payment] ADD  CONSTRAINT [DF_customer_payment_advanceid]  DEFAULT ((0)) FOR [advanceid]
GO
ALTER TABLE [dbo].[supplier_payment] ADD  CONSTRAINT [DF_supplier_payment_advanceid]  DEFAULT ((0)) FOR [advanceid]
GO
ALTER TABLE [dbo].[thirdparty_payment] ADD  CONSTRAINT [DF_thirdparty_payment_advanceid]  DEFAULT ((0)) FOR [advanceid]
GO
/****** Object:  StoredProcedure [dbo].[backUpDataBase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[backUpDataBase]
 @name VARCHAR(MAX) = 'BillingSoftware',-- DB NAME TO CREATE BACKUP
 @o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
AS
BEGIN
    DECLARE @path VARCHAR(256) -- path of backup files
    DECLARE @fileName VARCHAR(256) -- filename for backup
    DECLARE @fileDate VARCHAR(20) -- used for file name
    SET @path = 'D:\BACKUPDATABASE\'
    -- specify filename format
    SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112)
    BEGIN TRY
        BEGIN
            SET @fileName = @path + @name + '_' + @fileDate + '.BAK'
            BACKUP DATABASE @name TO DISK = @fileName
			set @o_ErrorCode=1;
			set @o_ErrorDescription='BackUp Success'
        END
    END TRY
    BEGIN CATCH
	set @o_ErrorCode=-1;
	set @o_ErrorDescription=ERROR_MESSAGE()
    END CATCH
END






GO
/****** Object:  StoredProcedure [dbo].[Delete_brand_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_brand_master]
@brandid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
update brand_master set isactive=0
where brandid=@brandid
set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Delete Success'
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Success'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_company_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Delete_company_master]
@companyid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
AS
begin
begin try
update company_master set isactive=0,activestatus=0
where companyid=@companyid;

set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Delete Success'

end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Success'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[delete_customer_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_customer_master]
@customerid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
		update customer_master set
			isactive=0 where customerid=@customerid
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[delete_customer_payment]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[delete_customer_payment]
@paymentid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
	declare @customerid nvarchar(255);
			set @customerid=(select customerid from customer_payment where paymentid=@paymentid);
			--------------------------------------------------------------			
			declare @getbal decimal(10,2);
			set @getbal=(select ISNULL(sum(CAST(deduction_amount as decimal(10,2))),0.00) from customer_payment_nested 
			where paymentid=@paymentid and isbal=1)
			----------------------------------------------------------------
			update customer_master set			
			balance= cast(cast(balance as decimal(10,2))+cast(@getbal as decimal(10,2)) as nvarchar(255))
			where customerid=@customerid
			-------------------------------------------------------------		
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch
			set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch

			IF(@o_ErrorDescription='Deleted successfully')
				BEGIN
						delete customer_payment where paymentid=@paymentid
						delete customer_payment_nested where paymentid=@paymentid
				END
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_financial_year]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Delete_financial_year]
@finyearid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
update financial_year set isactive=0,status=0
where finyearid=@finyearid
set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Delete Success'

end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Success'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[delete_given_to_weavers]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_given_to_weavers]
@purchaseid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin 
begin try
		delete given_to_weavers where purchaseid=@purchaseid
		delete giventoweavers where purchaseid=@purchaseid

			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch 
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_gst_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_gst_master]
@gstid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
as 
begin
begin try
update gst_master set isactive=0 where gstid=@gstid
set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Delete Success'
end try
begin catch
		set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Delete Success'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_hsn_group]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_hsn_group]
@hsnid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
as
begin
begin try
update hsn_group set isactive=0 where hsnid=@hsnid
set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Delete Success'


end try
begin catch
	set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Delete Success'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_item_group]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_item_group]
@item_groupid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
AS
begin
begin try
update item_group set isactive=0 where item_groupid=@item_groupid
set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Delete Success'
end try
begin catch
set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Delete Success'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_item_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_item_master]
@itemid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
update item_master set isactive=0
where itemid=@itemid;
set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Delete Success'

end try
begin catch

set @o_ErrorCode=-1;
			set @o_ErrorDescription='Success'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_raw_material_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_raw_material_purchase]
@purchaseid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
as
begin
begin try
	delete raw_material_purchase where purchaseid=@purchaseid
	delete raw_material_purchase_nested where purchaseid=@purchaseid

	set @o_ErrorCode=@@IDENTITY;
	set @o_ErrorDescription='Delete Success'
end try
begin catch
		set @o_ErrorCode=-1;
		set @o_ErrorDescription='Error'
end catch

end
GO
/****** Object:  StoredProcedure [dbo].[delete_sales_billing]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_sales_billing]
@entryid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin 
begin try
		delete sales_billing where entryid=@entryid
		delete sales_billing_nested where entryid=@entryid
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch 
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[delete_sales_billing_nongst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_sales_billing_nongst]
@entryid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin 
begin try
		delete sales_billing_nongst where entryid=@entryid
		delete sales_billing_nested_nongst where entryid=@entryid
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch 
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[delete_supplier_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[delete_supplier_master]
@supplierid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin 
begin try
		update supplier_master set
			isactive=0 where supplierid=@supplierid
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch 
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[delete_supplier_payment]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[delete_supplier_payment]
@paymentid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
			declare @suplierid nvarchar(255);
			set @suplierid=(select supplierid from supplier_payment where paymentid=@paymentid);
			--------------------------------------------------------------			
			declare @getbal decimal(10,2);
			set @getbal=(select ISNULL(sum(CAST(deduction_amount as decimal(10,2))),0.00) from supplier_payment_nested 
			where paymentid=@paymentid and isbal=1)
			----------------------------------------------------------------
			update supplier_master set			
			balance= cast(cast(balance as decimal(10,2))+cast(@getbal as decimal(10,2)) as nvarchar(255))
			where supplierid=@suplierid
			-------------------------------------------------------------		
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch
			set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch

			IF(@o_ErrorDescription='Deleted successfully')
				BEGIN
						delete supplier_payment where paymentid=@paymentid
						delete supplier_payment_nested where paymentid=@paymentid
				END
end
GO
/****** Object:  StoredProcedure [dbo].[delete_third_party_gst_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_third_party_gst_purchase]
@purchaseid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin 
begin try
		delete third_party_gst_purchase where purchaseid=@purchaseid
		delete third_party_gst_purchase_nested where purchaseid=@purchaseid
		delete stock_table where purchaseid=@purchaseid and third_party_gst=1

			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch 
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[delete_third_party_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_third_party_master]
@third_partyid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
		update third_party_master set
			isactive=0 where third_partyid=@third_partyid
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[delete_third_party_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_third_party_purchase]
@purchaseid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin 
begin try
		delete third_party_purchase where purchaseid=@purchaseid
		delete third_party_purchase_nested where purchaseid=@purchaseid
		delete stock_table where purchaseid=@purchaseid and third_party_nongst=1

			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch 
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[delete_thirdparty_payment]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_thirdparty_payment]
@paymentid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
	declare @third_partyid nvarchar(255);
			set @third_partyid=(select third_partyid from thirdparty_payment where paymentid=@paymentid);
			--------------------------------------------------------------			
			declare @getbal decimal(10,2);
			set @getbal=(select ISNULL(sum(CAST(deduction_amount as decimal(10,2))),0.00) from thirdparty_payment_nested 
			where paymentid=@paymentid and isbal=1)
			----------------------------------------------------------------
			update third_party_master set			
			balance= cast(cast(balance as decimal(10,2))+cast(@getbal as decimal(10,2)) as nvarchar(255))
			where third_partyid=@third_partyid
			-------------------------------------------------------------		
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch
			set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch

			IF(@o_ErrorDescription='Deleted successfully')
				BEGIN
						delete thirdparty_payment where paymentid=@paymentid
						delete thirdparty_payment_nested where paymentid=@paymentid
				END
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_unit_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_unit_master]
@unitid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
as
begin
begin try
update unit_master set isactive=0
where unitid=@unitid;
set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Delete Success'


end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Success'
end catch

end

GO
/****** Object:  StoredProcedure [dbo].[Delete_user_profile]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_user_profile]
@userid int,

@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
AS
BEGIN
BEGIN TRY
update  user_profile set isactive=0 where userid=@userid


			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Delete Success'
END TRY
BEGIN CATCH
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Success'
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[delete_weaver_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_weaver_master]
@weaverid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
		update weaver_master set
			isactive=0 where weaverid=@weaverid
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[delete_weavers_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[delete_weavers_purchase]
@purchaseid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin 
begin try
		delete weavers_purchase where purchaseid=@purchaseid
		delete weavers_purchase_nested where purchaseid=@purchaseid
		delete stock_table where purchaseid=@purchaseid and weavers=1

			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Deleted successfully'
end try
begin catch 
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[get_all_stock_table]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_all_stock_table] 3,'2785'
CREATE procedure [dbo].[get_all_stock_table]
@companyid int,
@si_code nvarchar(255)
AS
BEGIN
--declare @fromdate nvarchar(255);
--declare @todate nvarchar(255);
--set @fromdate = (select fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
--set @todate = (select todate from financial_year where isactive=1 and status=1 and companyid=@companyid);
--------
WITH GETSALESBILLGST as(
select ISNULL(sum(CAST(ISNULL(qty,0) as float)),0) as sales_gst_qty,stockid from sales_billing_nested
where si_code=@si_code
group by stockid
),
GETSALESBILLNONGST as(
select ISNULL(sum(CAST(ISNULL(qty,0) as float)),0) as sales_gst_qty,stockid from sales_billing_nested_nongst
where si_code=@si_code
group by stockid
),
GETSALESBILLGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billing_returnDebit_nested sbnr
inner join sales_billing_nested sbn on sbn.entry_n_id=sbnr.entry_n_id
where sbnr.si_code=@si_code
group by stockid
),
GETSALESBILLNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billingNongst_returnDebit_nested sbnr
inner join sales_billing_nested_nongst sbn on sbn.entry_n_id=sbnr.entry_n_id
where sbnr.si_code=@si_code
group by stockid
),
GETTHIRDPARTYGSTReturn as(
select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id from third_partyPurchasegst_debit_nested
where si_code=@si_code
group by purchase_n_id
),
GETTHIRDPARTYNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id from third_partyPurchaseNongst_debit_nested
where si_code=@si_code
group by purchase_n_id
)
------------
select 0 as entry_n_id,0 as selected,stk.stockid,stk.purchaseid,stk.purchase_n_id,stk.si_code,stk.ref_code,stk.brandid,stk.itemid,stk.date,
gstm.gst_percentage,hsng.hsn_number,stk.price,stk.discount,stk.total,stk.cgst_amount,stk.sgst_amount,
stk.igst_amount,stk.net_total,stk.isactive,stk.activestatus,stk.purchasein,stk.purchasereturn,stk.salesin,
stk.salesreturn,stk.third_party_gst,stk.third_party_nongst,stk.weavers,stk.companyid,
--stk.qty as qt,
--sbn.sales_gst_qty as sb,sbnn.sales_gst_qty as sbnn,
CAST((CAST(stk.qty as float)+ISNULL(sbnr.return_qty,0)+ISNULL(sbnnr.return_qty,0)) -(ISNULL(sbn.sales_gst_qty,0)+ISNULL(sbnn.sales_gst_qty,0)+ISNULL(tpdr.return_qty,0)+ISNULL(tpdnr.return_qty,0))as nvarchar(255)) as qty
from stock_table stk
left join item_master itmm on  itmm.itemid=stk.itemid
left join item_group itmg on itmg.item_groupid=itmm.item_groupid
left join hsn_group hsng on hsng.hsnid=itmg.hsnid
left join gst_master gstm on gstm.gstid=hsng.gstid
left join GETSALESBILLGST sbn on sbn.stockid=stk.stockid
left join GETSALESBILLNONGST sbnn on sbnn.stockid=stk.stockid
left join GETSALESBILLGSTReturn sbnr on sbnr.stockid=stk.stockid
left join GETSALESBILLNONGSTReturn sbnnr on sbnnr.stockid=stk.stockid
left join GETTHIRDPARTYGSTReturn tpdr on tpdr.purchase_n_id=stk.purchase_n_id
left join GETTHIRDPARTYNONGSTReturn tpdnr on tpdnr.purchase_n_id=stk.purchase_n_id

where stk.activestatus=1 and stk.isactive=1 and stk.companyid=@companyid
and stk.si_code=@si_code
END
GO
/****** Object:  StoredProcedure [dbo].[get_brand_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_brand_master]
@companyid int
as
BEGIN
	select * from brand_master where isactive=1 and companyid=@companyid
END
GO
/****** Object:  StoredProcedure [dbo].[Get_company_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_company_master]
as
begin
select * from company_master where isactive=1 ;
end
GO
/****** Object:  StoredProcedure [dbo].[get_customer_advance]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[get_customer_advance]
@customerid int
AS
BEGIN
WITH get_AdvancePayment as (
select sp.advanceid,ISNULL(sum(CAST(ISNULL(spn.deduction_amount,0.00) as decimal(10,2))),0.00) as payment from customer_payment sp
inner join customer_payment_nested spn on spn.paymentid=sp.paymentid
where sp.advanceid>0 and sp.amount_mode='Deduct from Advance'
group by sp.advanceid
)
	select sd.*,
	cast(CAST(advance_amount as decimal(10,2))-ISNULL(getd.payment,0.00) as nvarchar(255)) as aval_addvance 
	from customer_advance sd
	left join get_AdvancePayment getd on getd.advanceid=sd.advanceid
	where sd.customerid=@customerid and CAST(sd.advance_amount as decimal(10,2)) >ISNULL(getd.payment,0.00)
END
GO
/****** Object:  StoredProcedure [dbo].[get_customer_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [get_customer_master] 3
CREATE procedure [dbo].[get_customer_master]
@companyid int
AS
BEGIN
	WITH GET_CUSTOMER_PURCHASE_NONGST as (
		select sb.customerid,sum(CAST(ISNULL(sbn.total,0)as decimal(10,2))) as total from sales_billing_nongst sb
		inner join sales_billing_nested_nongst sbn on sbn.entryid=sb.entryid
		where sb.companyid=@companyid
		group by sb.customerid
		),
		GET_CUSTOMER_PURCHASE_GST as (
		select sb.customerid,sum(CAST(ISNULL(sbn.net_total,0)as decimal(10,2))) as net_total from sales_billing sb
		inner join sales_billing_nested sbn on sbn.entryid=sb.entryid
		where sb.companyid=@companyid
		group by sb.customerid
		),
		GET_CUSTOMER_PAYMET as (
		SELECT cp.customerid,
       SUM(CAST(ISNULL(NULLIF(TRY_CAST(cpn.deduction_amount AS decimal(10,2)), 0), 0) AS decimal(10,2))) AS deduction_amount
		FROM customer_payment cp
		INNER JOIN customer_payment_nested cpn ON cpn.paymentid = cp.paymentid
		where cp.advanceid<1 and cp.amount_mode!='Deduct from Advance' and cpn.isbal=0
		GROUP BY cp.customerid
		),
		GET_ADBALCUSTOMER_PAYMET as (
		SELECT cp.customerid,
       SUM(CAST(ISNULL(NULLIF(TRY_CAST(cpn.deduction_amount AS decimal(10,2)), 0), 0) AS decimal(10,2))) AS deduction_amount
		FROM customer_payment cp
		INNER JOIN customer_payment_nested cpn ON cpn.paymentid = cp.paymentid
		where cp.advanceid>0 and cp.amount_mode='Deduct from Advance' and cpn.isbal=1
		GROUP BY cp.customerid
		),
		----------Return------------------------------
SalesBillingReturnTotals AS (
    SELECT sb.customerid,
     SUM(CAST(ISNULL(sbn.return_net_total,0) as decimal(10,2))) as retTot
    FROM sales_billing_returnDebit sb
    left JOIN sales_billing_returnDebit_nested sbn ON sbn.entryid = sb.entryid
    WHERE sb.companyid = @companyid
    GROUP BY sb.customerid
),
SalesBillingNonGstReturnTotals AS (
    SELECT sb.customerid,
           SUM(CAST(sbn.return_total as decimal(10,2))) as retTot
    FROM sales_billingNongst_returnDebit sb
    INNER JOIN sales_billingNongst_returnDebit_nested sbn ON sbn.entryid = sb.entryid
    WHERE sb.companyid = @companyid
    GROUP BY sb.customerid
),
getAdvance as (
		select customerid, ISNULL(sum(cast(ISNULL(advance_amount,0.00) as decimal(10,2))),0.00) as advance from customer_advance
		group by customerid
		)
		---------
		select cm.*,
		CAST((
               (ISNULL(TRY_CAST(balance AS DECIMAL(10,2)), 0) 
			   + (ISNULL(getbalad.deduction_amount,0.00))
                + ISNULL(CNGST.total, 0) 
                + ISNULL(CGST.net_total, 0))
               - (ISNULL(CPAY.deduction_amount, 0)
				+ (ISNULL(ad.advance,0.00))
                + ISNULL(RCNGST.retTot, 0) 
                + ISNULL(RCGST.retTot, 0))) AS NVARCHAR(255)) AS c_balance
		--cm.balance,
		--CNGST.total,
		--CGST.net_total,		
		--CPAY.deduction_amount,
		--ad.advance,
		--RCNGST.retTot,
		--RCGST.retTot
		from customer_master cm
		left join GET_CUSTOMER_PURCHASE_NONGST CNGST on CNGST.customerid=cm.customerid
		left join GET_CUSTOMER_PURCHASE_GST CGST on CGST.customerid=cm.customerid
		left join SalesBillingNonGstReturnTotals RCNGST on RCNGST.customerid=cm.customerid
		left join SalesBillingReturnTotals RCGST on RCGST.customerid=cm.customerid
		LEFT join GET_CUSTOMER_PAYMET CPAY on CPAY.customerid=cm.customerid
		left join getAdvance ad on ad.customerid=cm.customerid
		left join GET_ADBALCUSTOMER_PAYMET getbalad on getbalad.customerid=cm.customerid
		WHERE cm.isactive = 1 AND cm.companyid = @companyid
END
GO
/****** Object:  StoredProcedure [dbo].[get_customer_payment]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_customer_payment]
@companyid int,
@customerid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN
	IF(@customerid>0)
		BEGIN
				select cp.*,
				cm.customer_name,
				CAST(sum(CAst(cpn.deduction_amount as decimal(10,2))) as nvarchar(255)) as deduction_amount
				from customer_payment cp
				inner join customer_payment_nested cpn on cpn.paymentid=cp.paymentid
				inner join customer_master cm on cm.customerid=cp.customerid
				 where cp.companyid=@companyid and cp.date between @fromdate And @todate and cp.customerid=@customerid 
				group by cp.paymentid,cp.customerid,cp.date,cp.balance,cp.amount_mode,cp.payment_type,cp.cheque_no,cp.c_date,cp.c_amount,
				cp.companyid,cp.isactive,cp.cuid,cp.cdate,cp.muid,cp.mdate,cm.customer_name,cp.advanceid,cp.adnp_amount
		END
	ELSE
		BEGIN			
			select cp.*,
			cm.customer_name,
			CAST(sum(CAst(cpn.deduction_amount as decimal(10,2))) as nvarchar(255)) as deduction_amount
			from customer_payment cp
			inner join customer_payment_nested cpn on cpn.paymentid=cp.paymentid
			inner join customer_master cm on cm.customerid=cp.customerid
			where cp.companyid=@companyid and cp.date between @fromdate And @todate
			group by cp.paymentid,cp.customerid,cp.date,cp.balance,cp.amount_mode,cp.payment_type,cp.cheque_no,cp.c_date,cp.c_amount,
			cp.companyid,cp.isactive,cp.cuid,cp.cdate,cp.muid,cp.mdate,cm.customer_name,cp.adnp_amount,cp.advanceid
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_customer_Payment_details]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_customer_Payment_details] 6
CREATE procedure [dbo].[get_customer_Payment_details]
@customerid int
AS
BEGIN
-- Calculate sums separately for sales_billing
WITH SalesBillingTotals AS (
	select entryid,SUM(CAST(ISNULL(net_total,0) as decimal(10,2))) as tot from sales_billing_nested
	group by entryid
),
-- Calculate sums separately for sales_billing_nongst
SalesBillingNonGstTotals AS (
	select entryid,SUM(CAST(ISNULL(total,0) as decimal(10,2))) as tot from sales_billing_nested_nongst
	group by entryid
),
-- Calculate sums separately for sales_billing_returnDebit
SalesBillingReturnTotals AS (
    select entryid,SUM(CAST(ISNULL(return_net_total,0) as decimal(10,2))) as retTot from sales_billing_returnDebit_nested
	group by entryid
),
-- Calculate sums separately for sales_billingNongst_returnDebit
SalesBillingNonGstReturnTotals AS (
    select entryid,SUM(TRY_CAST(ISNULL(return_total,0) as decimal(10,2))) as retTot from sales_billingNongst_returnDebit_nested
	group by entryid
),
CUSTOMERPAYMENTGST as(
select entryid,customerid,SUM(CAST(ISNULL(deduction_amount,0) as decimal(10,2))) as de from customer_payment_nested
where gst=1 and non_gst=0
group by entryid,customerid
),
CUSTOMERPAYMENTNONGST as(
select entryid,customerid,SUM(CAST(ISNULL(deduction_amount,0) as decimal(10,2))) as de from customer_payment_nested
where gst=0 and non_gst=1
group by entryid,customerid
)
----------------------------------------------------------------------------------
select 0 as entryid,customerid,'' as date,'Opening Balance' as bill_no,cast(0 as bit) as gst,cast(0 as bit) as non_gst,cast(1 as bit) as isbal,
ISNULL(TRY_CAST(ISNULL(balance,0) as decimal(10,2)),0.00) as tot,'0.00' as retTot,
 CAST(0.00 as decimal(10,2)) as de,
ISNULL(TRY_CAST(ISNULL(balance,0) as decimal(10,2)),0.00) as totalcal
from customer_master
where ISNULL(TRY_CAST(ISNULL(balance,0) as decimal(10,2)),0.00)>0 and customerid=@customerid
---------------------------------------------------------------------------------------------------------------------------------
UNION all
SELECT sb.entryid, sb.customerid, sb.date, sb.bill_no,    
   cast(1 as bit) as gst,cast(0 as bit) as non_gst,cast(0 as bit) as isbal,
	SUM(CAST(ISNULL(sbt.tot, 0) as decimal(10,2))) as tot,
    CAST(SUM(CAST(ISNULL(rsbt.retTot, 0) as decimal(10,2)))as nvarchar(245)) as retTot,
    CAST(SUM(CAST(ISNULL(cpn.de, 0) as decimal(10,2)))as decimal(10,2)) as de,
    ISNULL(sbt.tot, 0) - (SUM(CAST(ISNULL(rsbt.retTot, 0) as decimal(10,2))) + SUM(CAST(ISNULL(cpn.de, 0) as decimal(10,2)))) as totalcal
FROM sales_billing sb
LEFT JOIN SalesBillingTotals sbt ON sbt.entryid = sb.entryid
LEFT JOIN SalesBillingReturnTotals rsbt ON rsbt.entryid = sb.entryid
LEFT JOIN CUSTOMERPAYMENTGST cpn ON cpn.entryid = sb.entryid AND cpn.customerid = sb.customerid
WHERE sb.customerid = @customerid
GROUP BY sb.entryid, sb.customerid, sb.date, sb.bill_no,sbt.tot

UNION all

SELECT sb.entryid, sb.customerid, sb.date, sb.bill_no,   
   cast(0 as bit) as gst,cast(1 as bit) as non_gst,cast(0 as bit) as isbal,
    SUM(CAST(ISNULL(sbngt.tot, 0) as decimal(10,2))) as tot,
    CAST(SUM(CAST(ISNULL(rsbngt.retTot, 0) as decimal(10,2)))as nvarchar(245)) as retTot,    
    CAST(SUM(CAST(ISNULL(cpn.de, 0) as decimal(10,2)))as decimal(10,2)) as de,
   ISNULL(sbngt.tot, 0) - (SUM(CAST(ISNULL(rsbngt.retTot, 0) as decimal(10,2))) + SUM(CAST(ISNULL(cpn.de, 0) as decimal(10,2)))) as totalcal
FROM sales_billing_nongst sb
LEFT JOIN SalesBillingNonGstTotals sbngt ON sbngt.entryid = sb.entryid
LEFT JOIN SalesBillingNonGstReturnTotals rsbngt ON rsbngt.entryid = sb.entryid
LEFT JOIN CUSTOMERPAYMENTNONGST cpn ON cpn.entryid = sb.entryid AND cpn.customerid = sb.customerid
WHERE sb.customerid = @customerid
GROUP BY sb.entryid, sb.customerid, sb.date, sb.bill_no,sbngt.tot

order by date
END
GO
/****** Object:  StoredProcedure [dbo].[get_customer_payment_nongst_reminder]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_customer_payment_nongst_reminder]
@date nvarchar(255),
@companyid int
AS
BEGIN
WITH salesGSTtot AS (
    SELECT entryid, SUM(CAST(ISNULL(total, 0) AS DECIMAL(10,2))) AS tot
    FROM sales_billing_nested_nongst
    GROUP BY entryid
),
salesReturnGST AS (
    SELECT entryid, SUM(CAST(ISNULL(return_total, 0) AS DECIMAL(10,2))) AS retTot
    FROM sales_billingNongst_returnDebit_nested	
    GROUP BY entryid
),
salesGSTPayment AS (
    SELECT entryid, SUM(CAST(ISNULL(deduction_amount, 0) AS float)) AS de
    FROM customer_payment_nested
	where non_gst=1
    GROUP BY entryid
)

SELECT sb.entryid, sb.customerid, sb.date, sb.bill_no, cm.customer_name,
       CAST(ISNULL(sn.tot, 0) - (SUM(CAST(ISNULL(SR.retTot, 0) AS DECIMAL(10,2))) + SUM(CAST(ISNULL(sp.de, 0) AS DECIMAL(10,2)))) as nvarchar(255)) AS total,
       DATEDIFF(day, sb.date, @date) AS days_count
FROM sales_billing_nongst sb
LEFT JOIN salesGSTtot sn ON sn.entryid = sb.entryid
LEFT JOIN salesGSTPayment sp ON sp.entryid = sb.entryid
LEFT JOIN salesReturnGST SR ON SR.entryid = sb.entryid
INNER JOIN customer_master cm ON cm.customerid = sb.customerid
where sb.companyid=@companyid
GROUP BY sb.entryid, sb.customerid, sb.date, sb.bill_no, cm.customer_name, sn.tot,sb.credit_days
HAVING DATEDIFF(day, sb.date, @date) >= sb.credit_days AND
       ISNULL(sn.tot, 0) - (SUM(CAST(ISNULL(SR.retTot, 0) AS DECIMAL(10,2))) + SUM(CAST(ISNULL(sp.de, 0) AS DECIMAL(10,2)))) > 0
END
GO
/****** Object:  StoredProcedure [dbo].[get_customer_payment_reminder]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- get_customer_payment_reminder '2024-07-03'
CREATE PROCEDURE [dbo].[get_customer_payment_reminder]
@date nvarchar(255),
@companyid int
AS
BEGIN
WITH salesGSTtot AS (
    SELECT entryid, SUM(CAST(ISNULL(net_total, 0) AS DECIMAL(10,2))) AS tot
    FROM sales_billing_nested
    GROUP BY entryid
),
salesReturnGST AS (
    SELECT entryid, SUM(CAST(ISNULL(return_net_total, 0) AS DECIMAL(10,2))) AS retTot
    FROM sales_billing_returnDebit_nested
    GROUP BY entryid
),
salesGSTPayment AS (
    SELECT entryid, SUM(CAST(ISNULL(deduction_amount, 0) AS float)) AS de
    FROM customer_payment_nested
	where gst=1
    GROUP BY entryid	
)

SELECT sb.entryid, sb.customerid, sb.date, sb.bill_no, cm.customer_name,
       CAST(ISNULL(sn.tot, 0) - (SUM(CAST(ISNULL(SR.retTot, 0) AS DECIMAL(10,2))) + SUM(CAST(ISNULL(sp.de, 0) AS DECIMAL(10,2)))) as nvarchar(255)) AS total,
       DATEDIFF(day, sb.date, @date) AS days_count
FROM sales_billing sb
LEFT JOIN salesGSTtot sn ON sn.entryid = sb.entryid
LEFT JOIN salesGSTPayment sp ON sp.entryid = sb.entryid
LEFT JOIN salesReturnGST SR ON SR.entryid = sb.entryid
INNER JOIN customer_master cm ON cm.customerid = sb.customerid
where sb.companyid=@companyid
GROUP BY sb.entryid, sb.customerid, sb.date, sb.bill_no, cm.customer_name, sn.tot,sb.credit_days
HAVING DATEDIFF(day, sb.date, @date) >= sb.credit_days AND
       ISNULL(sn.tot, 0) - (SUM(CAST(ISNULL(SR.retTot, 0) AS DECIMAL(10,2))) + SUM(CAST(ISNULL(sp.de, 0) AS DECIMAL(10,2)))) > 0
END
GO
/****** Object:  StoredProcedure [dbo].[get_customerInvoiceno_by_custId]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_customerInvoiceno_by_custId]
@customerid int,
@companyid int
AS
BEgin
select bill_no as invoice_no,date from sales_billing
where  customerid=@customerid and companyid=@companyid 
end
GO
/****** Object:  StoredProcedure [dbo].[get_financial_year]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_financial_year]
@companyid int
as
BEGIN
	select fy.*,cm.company_name from financial_year fy
	inner join company_master cm on cm.companyid=fy.companyid
	where fy.isactive=1 and fy.companyid=@companyid

	order by finyearid desc
END
GO
/****** Object:  StoredProcedure [dbo].[get_giventoweavers]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_giventoweavers]
@purchaseid int
AS
BEGIN
select *,0 as purchase_n_id,0 as qty from giventoweavers where purchaseid=@purchaseid
END
GO
/****** Object:  StoredProcedure [dbo].[Get_gst_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_gst_master]
@companyid int
as
begin
select * from  gst_master 
where companyid=@companyid and isactive=1;
end
GO
/****** Object:  StoredProcedure [dbo].[get_gst_purchase_historyof_sareeby_ref_code]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_gst_purchase_historyof_sareeby_ref_code]
@ref_code NVARCHAR(255),
@companyid INT
AS
BEGIN
    -- First, check if the ref_code exists in third_party_gst_purchase_nested
    IF EXISTS (SELECT 1 FROM third_party_gst_purchase_nested WHERE ref_code = @ref_code)
    BEGIN
        -- Original query
        SELECT 
            tpgp.*, 
            tpgpn.si_code,
            tpgpn.ref_code,
            tpgpn.qty AS purchase_qty,
            tpgpn.net_total AS purchase_net_total,
            tpgdnn.return_qty AS purchase_return_qty,
            tpgdnn.return_net_total AS purchase_return_nettotal,
            tpm.party_name,
            sbn.qty AS sold_qty,
            sbn.net_total AS sold_net_total,
            sbrdn.return_qty AS sales_return_qty,
            sb.date AS sold_date,
            cm.customer_name,
            sbrd.return_date AS sales_return_date,
            sbrdn.return_net_total AS sales_return_net_total,
            tpgdn.return_date AS purchase_return_date
        FROM 
            third_party_gst_purchase tpgp
        INNER JOIN 
            third_party_gst_purchase_nested tpgpn ON tpgpn.purchaseid = tpgp.purchaseid
        INNER JOIN 
            third_party_master tpm ON tpm.third_partyid = tpgp.third_partyid
         LEFT JOIN  
            third_partyPurchasegst_debit tpgdn ON tpgdn.purchaseid = tpgp.purchaseid
     LEFT JOIN 
            third_partyPurchasegst_debit_nested tpgdnn ON tpgdnn.thirdPartyDebitid = tpgdn.thirdPartyDebitid
        LEFT JOIN  
            sales_billing_nested sbn ON sbn.ref_code = tpgpn.ref_code
       LEFT JOIN  
            sales_billing sb ON sb.entryid = sbn.entryid
        LEFT JOIN 
            customer_master cm ON sb.customerid = cm.customerid
         LEFT JOIN  
            sales_billing_returnDebit_nested sbrdn ON sbrdn.ref_code = tpgpn.ref_code
        LEFT JOIN 
            sales_billing_returnDebit sbrd ON sbrd.returndebit_id = sbrdn.returndebit_id
        WHERE 
            tpgpn.ref_code = @ref_code AND tpgp.companyid = @companyid AND tpgp.isactive = 1
    END
    ELSE
    BEGIN
        -- Query from weavers_purchase_nested if not found in third_party_gst_purchase_nested
       SELECT 
  wp.*,
  wm.weaver_name,
  wpn.si_code,
  wpn.ref_code,
  wpn.qty as purchase_qty,
 sbn.qty AS sold_qty,
 sbn.net_total AS sold_net_total,
 sbrdn.return_qty AS sales_return_qty,
sb.date AS sold_date,
cm.customer_name,
sbrd.return_date AS sales_return_date,
sbrdn.return_net_total AS sales_return_net_total
FROM 
  weavers_purchase wp 
  INNER JOIN weavers_purchase_nested wpn ON wpn.purchaseid = wp.purchaseid
  INNER JOIN weaver_master wm ON wm.weaverid = wp.weaverid
   LEFT JOIN  sales_billing_nested sbn ON sbn.ref_code = wpn.ref_code
  LEFT JOIN  sales_billing sb ON sb.entryid = sbn.entryid
 LEFT JOIN  customer_master cm ON cm.customerid = sb.customerid
 LEFT JOIN  sales_billing_returnDebit_nested sbrdn ON sbrdn.ref_code = wpn.ref_code
 LEFT JOIN  sales_billing_returnDebit sbrd ON sbrd.returndebit_id = sbrdn.returndebit_id
WHERE 
  wpn.ref_code = @ref_code  AND wp.companyid = 1 AND wp.isactive = 1;

    END
END
GO
/****** Object:  StoredProcedure [dbo].[get_gst_purchase_historyof_sareeby_si_code]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[get_gst_purchase_historyof_sareeby_si_code]
@si_code NVARCHAR(255),
@companyid INT
AS
BEGIN
    -- First, check if the ref_code exists in third_party_gst_purchase_nested
    IF EXISTS (SELECT 1 FROM third_party_gst_purchase_nested WHERE si_code = @si_code)
    BEGIN
        -- Original query
        SELECT 
            tpgp.*, 
            tpgpn.si_code,
            tpgpn.ref_code,
            tpgpn.qty AS purchase_qty,
            tpgpn.net_total AS purchase_net_total,
            tpgdnn.return_qty AS purchase_return_qty,
            tpgdnn.return_net_total AS purchase_return_nettotal,
            tpm.party_name,
            sbn.qty AS sold_qty,
            sbn.net_total AS sold_net_total,
            sbrdn.return_qty AS sales_return_qty,
            sb.date AS sold_date,
            cm.customer_name,
            sbrd.return_date AS sales_return_date,
            sbrdn.return_net_total AS sales_return_net_total,
            tpgdn.return_date AS purchase_return_date
        FROM 
            third_party_gst_purchase tpgp
        INNER JOIN 
            third_party_gst_purchase_nested tpgpn ON tpgpn.purchaseid = tpgp.purchaseid
        INNER JOIN 
            third_party_master tpm ON tpm.third_partyid = tpgp.third_partyid
         LEFT JOIN  
            third_partyPurchasegst_debit tpgdn ON tpgdn.purchaseid = tpgp.purchaseid
     LEFT JOIN 
            third_partyPurchasegst_debit_nested tpgdnn ON tpgdnn.thirdPartyDebitid = tpgdn.thirdPartyDebitid
        LEFT JOIN  
            sales_billing_nested sbn ON sbn.ref_code = tpgpn.ref_code
       LEFT JOIN  
            sales_billing sb ON sb.entryid = sbn.entryid
        LEFT JOIN 
            customer_master cm ON sb.customerid = cm.customerid
         LEFT JOIN  
            sales_billing_returnDebit_nested sbrdn ON sbrdn.ref_code = tpgpn.ref_code
        LEFT JOIN 
            sales_billing_returnDebit sbrd ON sbrd.returndebit_id = sbrdn.returndebit_id
        WHERE 
            tpgpn.si_code = @si_code AND tpgp.companyid = @companyid AND tpgp.isactive = 1
    END
    ELSE
    BEGIN
        -- Query from weavers_purchase_nested if not found in third_party_gst_purchase_nested
       SELECT 
  wp.*,
  wm.weaver_name,
  wpn.si_code,
  wpn.ref_code,
  wpn.qty as purchase_qty,
 sbn.qty AS sold_qty,
 sbn.net_total AS sold_net_total,
 sbrdn.return_qty AS sales_return_qty,
sb.date AS sold_date,
cm.customer_name,
sbrd.return_date AS sales_return_date,
sbrdn.return_net_total AS sales_return_net_total
FROM 
  weavers_purchase wp 
  INNER JOIN weavers_purchase_nested wpn ON wpn.purchaseid = wp.purchaseid
  INNER JOIN weaver_master wm ON wm.weaverid = wp.weaverid
   LEFT JOIN  sales_billing_nested sbn ON sbn.ref_code = wpn.ref_code
  LEFT JOIN  sales_billing sb ON sb.entryid = sbn.entryid
 LEFT JOIN  customer_master cm ON cm.customerid = sb.customerid
 LEFT JOIN  sales_billing_returnDebit_nested sbrdn ON sbrdn.ref_code = wpn.ref_code
 LEFT JOIN  sales_billing_returnDebit sbrd ON sbrd.returndebit_id = sbrdn.returndebit_id
WHERE 
  wpn.si_code = @si_code  AND wp.companyid = 1 AND wp.isactive = 1;

    END
END
GO
/****** Object:  StoredProcedure [dbo].[get_gstPurchase_report_bythird_partyid]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_gstPurchase_report_bythird_partyid]
@companyid int,
@third_partyid int
AS
BEGIN
		IF(@third_partyid>0)
			BEGIN
				select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,
				  tpm.party_name,
				  STRING_AGG(ISNULL(tpn.si_code,''),',') as si_code,
				  STRING_AGG(ISNULL(tpn.ref_code,''),',') as ref_code,
				  cast(sum(cast(ISNULL(tpn.qty,0)as float))as nvarchar(255)) as qty,
				  cast(CAST(sum(cast(ISNULL(tpn.net_total,0)as float))as int)as nvarchar(255)) as total
				  from third_party_gst_purchase tp
				  inner join third_party_gst_purchase_nested tpn on tp.purchaseid=tpn.purchaseid
				  left join third_party_master tpm on tpm.third_partyid=tp.third_partyid
				   WHERE tp.third_partyid=@third_partyid AND tp.companyid=@companyid AND tp.isactive=1
				  group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,tpm.party_name
			END
		ELSE
			BEGIN
				select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,
				  tpm.party_name,
				  STRING_AGG(ISNULL(tpn.si_code,''),',') as si_code,
				  STRING_AGG(ISNULL(tpn.ref_code,''),',') as ref_code,
				  cast(sum(cast(ISNULL(tpn.qty,0)as float))as nvarchar(255)) as qty,
				  cast(CAST(sum(cast(ISNULL(tpn.net_total,0)as float))as int)as nvarchar(255)) as total
				  from third_party_gst_purchase tp
				  inner join third_party_gst_purchase_nested tpn on tp.purchaseid=tpn.purchaseid
				  left join third_party_master tpm on tpm.third_partyid=tp.third_partyid
				   WHERE tp.companyid=@companyid AND tp.isactive=1
				  group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,tpm.party_name
			END		
END
GO
/****** Object:  StoredProcedure [dbo].[get_gstsales_report_bycustomerid]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_gstsales_report_bycustomerid]
@customerid int,
@companyid int
AS
BEGIN
	DECLARE @FromDateDT DATETIME = CAST((select top 1 fromdate from financial_year where isactive=1 and status=1) AS DATETIME);
	DECLARE @ToDateDT DATETIME = CAST((select top 1 todate from financial_year where isactive=1 and status=1) AS DATETIME);
		
		IF(@customerid>0)
			BEGIN
				select sb.entryid,sb.date,sb.bill_no,cm.customer_name,cm.customerid,cast(sum(cast(ISNULL(sbn.qty,0) as float)) as nvarchar(255)) as qty,
				 cast(sum(cast(ISNULL(sbn.net_total,0) as float)) as nvarchar(255)) as net_total,
				 cast(sum(cast(ISNULL(sbn.total,0) as float)) as nvarchar(255)) as total,
				 cast(sum(cast(ISNULL(sbn.cgst_amount,0) as float)) as nvarchar(255)) as cgst_amount,
				 cast(sum(cast(ISNULL(sbn.sgst_amount,0) as float)) as nvarchar(255)) as sgst_amount,
				 cast(sum(cast(ISNULL(sbn.igst_amount,0) as float)) as nvarchar(255)) as igst_amount,
				 STRING_AGG(sbn.si_code,', ') as si_code,
				 STRING_AGG(sbn.ref_code,', ') as ref_code
				 from sales_billing sb
				 inner join sales_billing_nested sbn on sb.entryid=sbn.entryid
				 left join customer_master cm on cm.customerid=sb.customerid

				  WHERE sb.customerid=@customerid AND sb.companyid=@companyid AND sb.isactive=1  and CAST(sb.date AS DATETIME) >= @FromDateDT
						 AND CAST(sb.date AS DATETIME) <= @ToDateDT

				 group by sb.date,sb.bill_no,cm.customer_name,cm.customerid,sb.entryid
			END
		ELSE
			BEGIN
				select sb.entryid,sb.date,sb.bill_no,cm.customer_name,cm.customerid,cast(sum(cast(ISNULL(sbn.qty,0) as float)) as nvarchar(255)) as qty,
				 cast(sum(cast(ISNULL(sbn.net_total,0) as float)) as nvarchar(255)) as net_total,
				  cast(sum(cast(ISNULL(sbn.total,0) as float)) as nvarchar(255)) as total,
				 cast(sum(cast(ISNULL(sbn.cgst_amount,0) as float)) as nvarchar(255)) as cgst_amount,
				 cast(sum(cast(ISNULL(sbn.sgst_amount,0) as float)) as nvarchar(255)) as sgst_amount,
				 cast(sum(cast(ISNULL(sbn.igst_amount,0) as float)) as nvarchar(255)) as igst_amount,
				 STRING_AGG(sbn.si_code,', ') as si_code,
				 STRING_AGG(sbn.ref_code,', ') as ref_code
				 from sales_billing sb
				 inner join sales_billing_nested sbn on sb.entryid=sbn.entryid
				 left join customer_master cm on cm.customerid=sb.customerid

				  WHERE sb.companyid=@companyid AND sb.isactive=1  and CAST(sb.date AS DATETIME) >= @FromDateDT
						 AND CAST(sb.date AS DATETIME) <= @ToDateDT

				 group by sb.date,sb.bill_no,cm.customer_name,cm.customerid,sb.entryid
			END	
END
GO
/****** Object:  StoredProcedure [dbo].[Get_hsn_group]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_hsn_group]
@companyid int
AS
begin
select hsng.*,gstm.gst_percentage from hsn_group hsng
inner join gst_master gstm on gstm.gstid=hsng.gstid 
where hsng.companyid=@companyid and hsng.isactive=1;

end
GO
/****** Object:  StoredProcedure [dbo].[Get_item_group]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[Get_item_group] 1
CREATE procedure [dbo].[Get_item_group]
@companyid int
as
begin
select ig.*,hg.hsn_number,gsm.gst_percentage from item_group ig
inner join hsn_group hg on hg.hsnid=ig.hsnid
inner join gst_master gsm on gsm.gstid=hg.gstid
where ig.isactive=1 and ig.companyid=@companyid 


end

GO
/****** Object:  StoredProcedure [dbo].[Get_item_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_item_master]
@companyid int
as
begin 
 select itmm.*,itmg.item_group_name,bndm.brand_name,hsng.hsn_number,gstm.gst_percentage from item_master itmm
 inner join item_group itmg on itmg.item_groupid=itmm.item_groupid
 inner join hsn_group hsng on hsng.hsnid=itmg.hsnid
 inner join gst_master gstm on gstm.gstid=hsng.gstid
 inner join brand_master bndm on bndm.brandid=itmm.brandid


 where itmm.companyid=@companyid and itmm.isactive=1;
end
GO
/****** Object:  StoredProcedure [dbo].[Get_MaxID_gst_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_MaxID_gst_master]
@companyid int
as
begin 
select COUNT(gstid)+1 as gstid
from gst_master where companyid=@companyid and isactive=1;
end
GO
/****** Object:  StoredProcedure [dbo].[Get_MaxID_item_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_MaxID_item_master]
@companyid int
AS
Begin
select COUNT(itemid)+1 as itemid
 from item_master where companyid=@companyid and isactive=1;
end
GO
/****** Object:  StoredProcedure [dbo].[get_Maxid_material_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_Maxid_material_purchase]
@companyid int
AS
BEGIN
	select max(CAST(bill_no as int)) as purchaseid from raw_material_purchase where companyid=@companyid
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Maxid_return_sales_billing_gst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [Get_Maxid_return_sales_billing_gst] 3
CREATE procedure [dbo].[Get_Maxid_return_sales_billing_gst]
@companyid int
AS
BEGIN
	select  ISNULL(max(CAST(return_no as int)),0) as entryid from sales_billing_returnDebit where companyid=@companyid
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Maxid_return_sales_billingNongst_returnDebit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[Get_Maxid_return_sales_billingNongst_returnDebit] 3
CREATE procedure [dbo].[Get_Maxid_return_sales_billingNongst_returnDebit]
@companyid int
AS
BEGIN
	select ISNULL(max(CAST(return_no as int)),0) as entryid from sales_billingNongst_returnDebit where companyid=@companyid
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Maxid_sales_billing]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [Get_Maxid_sales_billing] 3
CREATE procedure [dbo].[Get_Maxid_sales_billing]
@companyid int
AS
BEGIN
	select max(CAST(bill_no as int)) as entryid from sales_billing where companyid=@companyid
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Maxid_sales_billing_nongst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [Get_Maxid_sales_billing] 3
CREATE procedure [dbo].[Get_Maxid_sales_billing_nongst]
@companyid int
AS
BEGIN
	select max(CAST(bill_no as int)) as entryid from sales_billing_nongst where companyid=@companyid
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Maxid_supplier_debit_note]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_Maxid_supplier_debit_note]
@companyid int
AS
BEGIN
	select ISNULL(max(s_debitid),0) as s_debitid from supplier_debit_note where companyid=@companyid
END
GO
/****** Object:  StoredProcedure [dbo].[get_Maxid_third_party_gst_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_Maxid_third_party_gst_purchase]
@companyid int
AS
BEGIN
	select max(CAST(bill_no as int)) as purchaseid from third_party_gst_purchase where companyid=@companyid
END
GO
/****** Object:  StoredProcedure [dbo].[get_Maxid_third_party_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_Maxid_third_party_purchase]
@companyid int
AS
BEGIN
	select max(CAST(bill_no as int)) as purchaseid from third_party_purchase where companyid=@companyid
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Maxid_third_partyPurchasegst_debit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [Get_Maxid_third_partyPurchasegst_debit] 3
CREATE procedure [dbo].[Get_Maxid_third_partyPurchasegst_debit]
@companyid int
AS
BEGIN
	select ISNULL(max(thirdPartyDebitid),0) as entryid from third_partyPurchasegst_debit where companyid=@companyid
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Maxid_third_partyPurchaseNongst_debit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [Get_Maxid_third_partyPurchaseNongst_debit] 3
create procedure [dbo].[Get_Maxid_third_partyPurchaseNongst_debit]
@companyid int
AS
BEGIN
	select ISNULL(max(thirdPartyDebitid),0) as entryid from third_partyPurchaseNongst_debit where companyid=@companyid
END
GO
/****** Object:  StoredProcedure [dbo].[get_multiple_sales_report]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- get_multiple_sales_report 83

CREATE procedure [dbo].[get_multiple_sales_report]
@entryid int
AS
BEGIN
    select sb.*, cm.customer_name, cm.gst_in, cm.state, cm.state_code,
           sbn.hsn_number, sbn.gst_percentage, cm.mobile_no,
           cast(sum(CAST(sbn.qty as float)) as nvarchar(255)) as qty,
           sbn.price,
           sbn.discount,
           cm.shipping_address as cust_ship_address,
           CAST(sum(CAST(sbn.total as float)) as nvarchar(255)) as n_total,
           STRING_AGG(sbn.ref_code, ',') WITHIN GROUP (ORDER BY sbn.entry_n_id ASC) as ref_code,
           CAST(sum(CAST(sbn.cgst_amount as float)) as nvarchar(255)) as cgst_amount,
           CAST(sum(CAST(sbn.sgst_amount as float)) as nvarchar(255)) as sgst_amount,
           CAST(sum(CAST(sbn.igst_amount as float)) as nvarchar(255)) as igst_amount,
           CAST(sum(CAST(sbn.net_total as float)) as nvarchar(255)) as net_total
    from sales_billing sb 
    left join customer_master cm on cm.customerid = sb.customerid
    left join sales_billing_nested sbn on sbn.entryid = sb.entryid
    where sb.entryid = @entryid
    group by sb.entryid, sb.customerid, sb.date, sb.bill_no, sb.credit_days, sb.balance,
             sb.billing_address, sb.shipping_address, sb.total, sb.companyid, sb.isactive, sb.cuid, 
             sb.cdate, sb.muid, sb.mdate, cm.customer_name, cm.gst_in, cm.state, cm.state_code,
             sbn.hsn_number, sbn.gst_percentage, sbn.discount, sbn.price, cm.shipping_address, cm.mobile_no
    order by MIN(sbn.entry_n_id) ASC
END
GO
/****** Object:  StoredProcedure [dbo].[get_multiple_salesNongst_report]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- get_multiple_salesNongst_report 2

CREATE procedure [dbo].[get_multiple_salesNongst_report]
@entryid int
AS
BEGIN
select sb.*,cm.customer_name,cm.gst_in,cm.state,cm.state_code
,sbn.hsn_number,cm.mobile_no,
cast(sum(CAST(sbn.qty as float))as nvarchar(255)) as qty,
sbn.price,
sbn.discount,
cm.shipping_address as cust_ship_address,
CAST(sum(CAST(sbn.total as float)) as nvarchar(255)) as n_total,
STRING_AGG(sbn.ref_code,',')as ref_code
from sales_billing_nongst sb 
left join customer_master cm on cm.customerid=sb.customerid
left join sales_billing_nested_nongst sbn on sbn.entryid=sb.entryid

where sb.entryid=@entryid

group by sb.entryid,sb.customerid,sb.date,sb.bill_no,sb.credit_days,sb.balance,sb.billing_address,
sb.shipping_address,sb.total,sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate,
cm.customer_name,cm.gst_in,cm.state,cm.state_code,sbn.hsn_number,
sbn.discount,sbn.price,sbn.discount,cm.shipping_address,cm.mobile_no
END
GO
/****** Object:  StoredProcedure [dbo].[get_NongstPurchase_report_bythird_partyid]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_NongstPurchase_report_bythird_partyid]
@companyid int,
@third_partyid int
AS
BEGIN
	IF(@third_partyid>0)
		BEGIN
			select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,
			  tpm.party_name,
			  STRING_AGG(ISNULL(tpn.si_code,''),',') as si_code,
			  STRING_AGG(ISNULL(tpn.ref_code,''),',') as ref_code,
			  cast(sum(cast(ISNULL(tpn.qty,0)as float))as nvarchar(255)) as qty,
			  cast(CAST(sum(cast(ISNULL(tpn.total,0)as float))as int)as nvarchar(255)) as total
			  from third_party_purchase tp
			  inner join third_party_purchase_nested tpn on tp.purchaseid=tpn.purchaseid
			  left join third_party_master tpm on tpm.third_partyid=tp.third_partyid
			   WHERE tp.third_partyid=@third_partyid AND tp.companyid=@companyid AND tp.isactive=1
			  group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,tpm.party_name
		END
	ELSE
		BEGIN
				select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,
			  tpm.party_name,
			  STRING_AGG(ISNULL(tpn.si_code,''),',') as si_code,
			  STRING_AGG(ISNULL(tpn.ref_code,''),',') as ref_code,
			  cast(sum(cast(ISNULL(tpn.qty,0)as float))as nvarchar(255)) as qty,
			  cast(CAST(sum(cast(ISNULL(tpn.total,0)as float))as int)as nvarchar(255)) as total
			  from third_party_purchase tp
			  inner join third_party_purchase_nested tpn on tp.purchaseid=tpn.purchaseid
			  left join third_party_master tpm on tpm.third_partyid=tp.third_partyid
			   WHERE tp.companyid=@companyid AND tp.isactive=1
			  group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,tpm.party_name
		END	
END
GO
/****** Object:  StoredProcedure [dbo].[get_NonGstpurchasebythirdpartyid]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_NonGstpurchasebythirdpartyid]
@third_partyid int,
@companyid int
AS
BEGIN
	WITH GETPURCHASEAMOUNT AS (
	select tp.purchaseid,sum(cast(ISNULL(tpn.total,0) as float)) as nettot from third_party_purchase tp
	inner join third_party_purchase_nested tpn on tpn.purchaseid=tp.purchaseid
	group by tp.purchaseid
	)

		select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,
		CAST(CAST(SUM(ISNULL(CAST(rmn.nettot AS float), 0))as int)as nvarchar(255)) as total,tp.companyid
		,tpm.party_name,tpm.gst_in,tpm.address,tpm.state,tpm.state_code 
		from third_party_purchase tp
		inner join third_party_master tpm on tpm.third_partyid=tp.third_partyid
		left join GETPURCHASEAMOUNT rmn on rmn.purchaseid=tp.purchaseid
		where tp.companyid=@companyid and tp.third_partyid=@third_partyid

		group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.companyid,
		tpm.party_name,tpm.gst_in,tpm.address,tpm.state,tpm.state_code
END
GO
/****** Object:  StoredProcedure [dbo].[get_Nongstsales_report_bycustomerid]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_Nongstsales_report_bycustomerid]
@customerid int,
@companyid int
AS
BEGIN
DECLARE @FromDateDT DATETIME = CAST((select top 1 fromdate from financial_year where isactive=1 and status=1) AS DATETIME);
	DECLARE @ToDateDT DATETIME = CAST((select top 1 todate from financial_year where isactive=1 and status=1) AS DATETIME);
		
		IF(@customerid>0)
			BEGIN
				select sb.entryid,sb.date,sb.bill_no,cm.customer_name,cm.customerid,cast(sum(cast(ISNULL(sbn.qty,0) as float)) as nvarchar(255)) as qty,
				 cast(sum(cast(ISNULL(sbn.total,0) as float)) as nvarchar(255)) as total,
				 STRING_AGG(sbn.si_code,', ') as si_code,
				 STRING_AGG(sbn.ref_code,', ') as ref_code
				 from sales_billing_nongst sb
				 inner join sales_billing_nested_nongst sbn on sb.entryid=sbn.entryid
				 left join customer_master cm on cm.customerid=sb.customerid

				  WHERE sb.customerid=@customerid AND sb.companyid=@companyid AND sb.isactive=1  and CAST(sb.date AS DATETIME) >= @FromDateDT
						 AND CAST(sb.date AS DATETIME) <= @ToDateDT

				 group by sb.date,sb.bill_no,cm.customer_name,cm.customerid,sb.entryid
			END
		ELSE
			BEGIN
				select sb.entryid,sb.date,sb.bill_no,cm.customer_name,cm.customerid,cast(sum(cast(ISNULL(sbn.qty,0) as float)) as nvarchar(255)) as qty,
				 cast(sum(cast(ISNULL(sbn.total,0) as float)) as nvarchar(255)) as total,
				 STRING_AGG(sbn.si_code,', ') as si_code,
				 STRING_AGG(sbn.ref_code,', ') as ref_code
				 from sales_billing_nongst sb
				 inner join sales_billing_nested_nongst sbn on sb.entryid=sbn.entryid
				 left join customer_master cm on cm.customerid=sb.customerid

				  WHERE sb.companyid=@companyid AND sb.isactive=1  and CAST(sb.date AS DATETIME) >= @FromDateDT
						 AND CAST(sb.date AS DATETIME) <= @ToDateDT

				 group by sb.date,sb.bill_no,cm.customer_name,cm.customerid,sb.entryid
			END
END
GO
/****** Object:  StoredProcedure [dbo].[get_raw_material_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- get_raw_material_purchase 3,'All'
CREATE procedure [dbo].[get_raw_material_purchase]
@companyid int,
@date nvarchar(255)
as
BEGIN

if(@date='All')
	BEGIN
		WITH GETPURCHASEAMOUNT AS (
	select rm.purchaseid,sum(cast(ISNULL(rmn.net_total,0) as decimal(10,2))) as nettot from raw_material_purchase rm
	inner join raw_material_purchase_nested rmn on rmn.purchaseid=rm.purchaseid
	group by rm.purchaseid
	)

		select rmp.purchaseid,rmp.supplierid,rmp.date,rmp.supplier_bill_no,rmp.bill_no,rmp.c_balance,rmp.credit_days,
		CAST(SUM(ISNULL(CAST(rmn.nettot AS decimal(10,2)), 0))as nvarchar(255)) as total,rmp.companyid
		,sm.supplier_name,sm.gst_in,sm.address,sm.shipping_address,sm.state,sm.state_code 
		from raw_material_purchase rmp
		inner join supplier_master sm on sm.supplierid=rmp.supplierid
		left join GETPURCHASEAMOUNT rmn on rmn.purchaseid=rmp.purchaseid
		where rmp.companyid=@companyid

		group by rmp.purchaseid,rmp.supplierid,rmp.date,rmp.supplier_bill_no,rmp.bill_no,rmp.c_balance,rmp.credit_days,rmp.companyid,
		sm.supplier_name,sm.gst_in,sm.address,sm.shipping_address,sm.state,sm.state_code
		order by rmp.purchaseid desc
	END

	ELSE
		BEGIN
			WITH GETPURCHASEAMOUNT AS (
	select rm.purchaseid,sum(cast(ISNULL(rmn.net_total,0) as decimal(10,2))) as nettot from raw_material_purchase rm
	inner join raw_material_purchase_nested rmn on rmn.purchaseid=rm.purchaseid
	group by rm.purchaseid
	)

		select rmp.purchaseid,rmp.supplierid,rmp.date,rmp.supplier_bill_no,rmp.bill_no,rmp.c_balance,rmp.credit_days,
		CAST(SUM(ISNULL(CAST(rmn.nettot AS decimal(10,2)), 0))as nvarchar(255)) as total,rmp.companyid
		,sm.supplier_name,sm.gst_in,sm.address,sm.shipping_address,sm.state,sm.state_code 
		from raw_material_purchase rmp
		inner join supplier_master sm on sm.supplierid=rmp.supplierid
		left join GETPURCHASEAMOUNT rmn on rmn.purchaseid=rmp.purchaseid
		where rmp.companyid=@companyid and rmp.date=@date

		group by rmp.purchaseid,rmp.supplierid,rmp.date,rmp.supplier_bill_no,rmp.bill_no,rmp.c_balance,rmp.credit_days,rmp.companyid,
		sm.supplier_name,sm.gst_in,sm.address,sm.shipping_address,sm.state,sm.state_code
		order by rmp.purchaseid desc
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_raw_material_purchasenested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_raw_material_purchasenested]
@purchaseid int
as
BEGIN
	select rmpn.*,itmm.item_name,rmp.supplier_bill_no from raw_material_purchase_nested rmpn
	inner join item_master itmm on itmm.itemid=rmpn.itemid
	inner join raw_material_purchase rmp on rmp.purchaseid=rmpn.purchaseid
	where rmpn.purchaseid=@purchaseid
END
GO
/****** Object:  StoredProcedure [dbo].[get_rawmat_purchase_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_rawmat_purchase_from_to_date] ''
CREATE procedure [dbo].[get_rawmat_purchase_from_to_date]
@companyid int,
@supplierid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN
	IF(@supplierid>0)
		BEGIN
			 SELECT sb.date,sb.supplierid,sb.supplier_bill_no,cm.supplier_name,sb.bill_no,
			 CAST(SUM(CAST(sbn.qty as float)) as nvarchar(255)) as qty,
			 CAST(SUM(CAST(sbn.net_total as decimal(10,2))) as nvarchar(255)) as net_total
			 From raw_material_purchase sb
			 inner join raw_material_purchase_nested sbn on sbn.purchaseid=sb.purchaseid
			 left join supplier_master cm on cm.supplierid=sb.supplierid
			   WHERE CAST(sb.date AS DATETIME) >= CAST(@fromdate as datetime)
				  AND CAST(sb.date AS DATETIME) <= CAST(@todate as datetime) AND sb.companyid=@companyid AND sb.isactive=1 and sb.supplierid=@supplierid
				  group by sb.date,sb.supplier_bill_no,sb.supplierid,cm.supplier_name,sb.bill_no
		END
		----------------------------------xxxxxxxxxxxx------------------------------------
	ELSE
		BEGIN
			 SELECT sb.date,sb.supplierid,sb.supplier_bill_no,cm.supplier_name,sb.bill_no,
			 CAST(SUM(CAST(sbn.qty as float)) as nvarchar(255)) as qty,
			 CAST(SUM(CAST(sbn.net_total as decimal(10,2))) as nvarchar(255)) as net_total
			 From raw_material_purchase sb
			 inner join raw_material_purchase_nested sbn on sbn.purchaseid=sb.purchaseid
			 left join supplier_master cm on cm.supplierid=sb.supplierid
			   WHERE CAST(sb.date AS DATETIME) >= CAST(@fromdate as datetime)
				  AND CAST(sb.date AS DATETIME) <= CAST(@todate as datetime) AND sb.companyid=@companyid AND sb.isactive=1
				  group by sb.date,sb.supplier_bill_no,sb.supplierid,cm.supplier_name,sb.bill_no
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_rawMaterial_purchase_bill]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- get_multiple_sales_report 1

Create procedure [dbo].[get_rawMaterial_purchase_bill]
@purchaseid int
AS
BEGIN
select sb.*,cm.supplier_name,cm.gst_in,cm.state,cm.state_code
,sbn.hsn_number,sbn.gst_percentage,
cast(sum(CAST(sbn.qty as float))as nvarchar(255)) as qty,
sb.supplier_bill_no,
sbn.price,
sbn.discount,
cm.shipping_address as cust_ship_address,
CAST(sum(CAST(sbn.total as float)) as nvarchar(255)) as n_total,
CAST(sum(CAST(sbn.cgst_amount as float))as nvarchar(255)) as cgst_amount,
CAST(sum(CAST(sbn.sgst_amount as float))as nvarchar(255)) as sgst_amount,
CAST(sum(CAST(sbn.igst_amount as float))as nvarchar(255)) as igst_amount,
CAST(sum(CAST(sbn.net_total as float))as nvarchar(255)) as net_total
from raw_material_purchase sb 
left join supplier_master cm on cm.supplierid=sb.supplierid
left join raw_material_purchase_nested sbn on sbn.purchaseid=sb.purchaseid

where sb.purchaseid=@purchaseid

group by sb.purchaseid,sb.supplierid,sb.date,sb.bill_no,sb.credit_days,sb.c_balance,
sb.total,sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate,cm.supplier_name,
cm.gst_in,cm.state,cm.state_code,sbn.hsn_number,sbn.gst_percentage,
sbn.discount,sbn.price,sbn.discount,cm.shipping_address,sb.supplier_bill_no
END
GO
/****** Object:  StoredProcedure [dbo].[get_rawmaterial_purchase_by_supplier_bill_no]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_rawmaterial_purchase_by_supplier_bill_no]
@companyid int,
@purchaseid nvarchar(255)
AS
BEGIN
    SELECT 
        rmp.*,
        rmpn.brandid,
        rmpn.itemid,
        rmpn.gst_percentage,
        rmpn.hsn_number,
        rmpn.price,
        rmpn.discount,
        rmpn.qty,
        rmpn.cgst_amount,
        rmpn.sgst_amount,
        rmpn.igst_amount,
        rmpn.total as rmpntotal,
        rmpn.net_total,
        spm.gst_in,
        rmpn.purchase_n_id,
		spm.supplier_name,
		rmp.bill_no
    FROM raw_material_purchase rmp
    INNER JOIN raw_material_purchase_nested rmpn ON rmp.purchaseid = rmpn.purchaseid
    left JOIN supplier_master spm ON spm.supplierid = rmp.supplierid
    WHERE rmp.purchaseid = @purchaseid AND rmp.companyid = @companyid
END
GO
/****** Object:  StoredProcedure [dbo].[get_RawMaterial_purchase_return_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_RawMaterial_purchase_return_from_to_date]
@companyid int,
@supplierid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN 
	IF(@supplierid>0)
		BEGIN
			select sdp.*,sm.supplier_name,
			cast(sum(CAST(sdpn.return_qty as decimal(10,2))) as nvarchar(255)) as return_qty,
			cast(sum(CAST(sdpn.return_net_total as decimal(10,2))) as nvarchar(255)) as return_net_total
			from supplier_debit_note sdp
			inner join supplier_debit_note_nested sdpn on sdpn.s_debitid=sdp.s_debitid
			inner join supplier_master sm on sm.supplierid=sdp.supplierid
			WHERE CAST(sdp.return_date AS DATETIME) >= CAST(@fromdate as datetime)
			AND CAST(sdp.return_date AS DATETIME) <= CAST(@todate as datetime) AND sdp.companyid=@companyid AND sdp.isactive=1 and sdp.supplierid=@supplierid

			group by sdp.s_debitid,sdp.purchaseid,sdp.supplierid,sdp.supplier_bill_no,sdp.date,sdp.return_no,sdp.return_date,sdp.gst_in,sdp.total,
			sdp.return_total,sdp.isactive,sdp.companyid,sdp.cuid,sdp.cdate,sdp.muid,sdp.mdate,sm.supplier_name
		END
		---------------------------xxxxxxxx----------------
	ELSE
		BEGIN
			select sdp.*,sm.supplier_name,
			cast(sum(CAST(sdpn.return_qty as decimal(10,2))) as nvarchar(255)) as return_qty,
			cast(sum(CAST(sdpn.return_net_total as decimal(10,2))) as nvarchar(255)) as return_net_total
			from supplier_debit_note sdp
			inner join supplier_debit_note_nested sdpn on sdpn.s_debitid=sdp.s_debitid
			inner join supplier_master sm on sm.supplierid=sdp.supplierid
			WHERE CAST(sdp.return_date AS DATETIME) >= CAST(@fromdate as datetime)
			AND CAST(sdp.return_date AS DATETIME) <= CAST(@todate as datetime) AND sdp.companyid=@companyid AND sdp.isactive=1

			group by sdp.s_debitid,sdp.purchaseid,sdp.supplierid,sdp.supplier_bill_no,sdp.date,sdp.return_no,sdp.return_date,sdp.gst_in,sdp.total,
			sdp.return_total,sdp.isactive,sdp.companyid,sdp.cuid,sdp.cdate,sdp.muid,sdp.mdate,sm.supplier_name
		END	
END
GO
/****** Object:  StoredProcedure [dbo].[get_RawMatpurchase_payment_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_RawMatpurchase_payment_from_to_date] 1,'2024-05-01','2024-05-20'
CREATE procedure [dbo].[get_RawMatpurchase_payment_from_to_date]
@companyid int,
@supplierid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN
	IF(@supplierid>0)
		BEGIN
			select sp.*,spn.*,sm.supplier_name,rmp.bill_no from supplier_payment sp
			inner join supplier_payment_nested spn on spn.paymentid=sp.paymentid
			inner join supplier_master sm on sm.supplierid=sp.supplierid
			inner join raw_material_purchase rmp on rmp.purchaseid=spn.purchaseid
			WHERE CAST(sp.date AS DATETIME) >= CAST(@fromdate as datetime)
			 AND CAST(sp.date AS DATETIME) <= CAST(@todate as datetime) AND sp.companyid=@companyid AND sp.isactive=1 and sp.supplierid=@supplierid
		END
	ELSE
		BEGIN
			select sp.*,spn.*,sm.supplier_name,rmp.bill_no from supplier_payment sp
			inner join supplier_payment_nested spn on spn.paymentid=sp.paymentid
			inner join supplier_master sm on sm.supplierid=sp.supplierid
			inner join raw_material_purchase rmp on rmp.purchaseid=spn.purchaseid
			WHERE CAST(sp.date AS DATETIME) >= CAST(@fromdate as datetime)
			 AND CAST(sp.date AS DATETIME) <= CAST(@todate as datetime) AND sp.companyid=@companyid AND sp.isactive=1
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_RawMatPurchase_report_bysupplierid]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_RawMatPurchase_report_bysupplierid] 0,3

CREATE procedure [dbo].[get_RawMatPurchase_report_bysupplierid]
@supplierid int,
@companyid int
AS
BEGIN
	IF(@supplierid>0)
		BEGIN
			SELECT sb.date,sb.supplierid,sb.supplier_bill_no,cm.supplier_name,sb.bill_no,
			 CAST(SUM(CAST(sbn.qty as float)) as nvarchar(255)) as qty,
			 CAST(SUM(CAST(sbn.net_total as decimal(10,2))) as nvarchar(255)) as net_total
			 From raw_material_purchase sb
			 inner join raw_material_purchase_nested sbn on sbn.purchaseid=sb.purchaseid 
			 left join supplier_master cm on cm.supplierid=sb.supplierid
			   WHERE sb.supplierid=@supplierid and sb.companyid=@companyid AND sb.isactive=1
				  group by sb.date,sb.supplier_bill_no,sb.supplierid,cm.supplier_name,sb.bill_no
		END
	ELSE
		BEGIN
			SELECT sb.date,sb.supplierid,sb.supplier_bill_no,cm.supplier_name,sb.bill_no,
			 CAST(SUM(CAST(sbn.qty as float)) as nvarchar(255)) as qty,
			 CAST(SUM(CAST(sbn.net_total as decimal(10,2))) as nvarchar(255)) as net_total
			 From raw_material_purchase sb
			 inner join raw_material_purchase_nested sbn on sbn.purchaseid=sb.purchaseid 
			 left join supplier_master cm on cm.supplierid=sb.supplierid
			   WHERE sb.companyid=@companyid AND sb.isactive=1
				  group by sb.date,sb.supplier_bill_no,sb.supplierid,cm.supplier_name,sb.bill_no
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_RefCode_third_party_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_RefCode_third_party_purchase]
@companyid int,
@third_partyid int
AS
BEGIN
declare @fromdate nvarchar(255);
declare @todate nvarchar(255);
set @fromdate = (select fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
set @todate = (select todate from financial_year where isactive=1 and status=1 and companyid=@companyid);

SELECT 
    ISNULL((select count(tpp.purchaseid) from third_party_purchase  tpp
	left join third_party_purchase_nested tppn on tppn.purchaseid=tpp.purchaseid
	where tpp.companyid=@companyid and tpp.date between @fromdate and @todate and tpp.third_partyid=@third_partyid), 0) 
    +
    ISNULL((select count(tppg.purchaseid) from third_party_gst_purchase  tppg
	left join third_party_gst_purchase_nested tppng on tppng.purchaseid=tppg.purchaseid
	where tppg.companyid=@companyid and tppg.date between @fromdate and @todate and tppg.third_partyid=@third_partyid), 0) 
AS purchaseid

END
GO
/****** Object:  StoredProcedure [dbo].[get_RefCode_weaver_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_RefCode_weaver_purchase]
@companyid int,
@weaverid int
AS
BEGIN
declare @fromdate nvarchar(255);
declare @todate nvarchar(255);
set @fromdate = (select fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
set @todate = (select todate from financial_year where isactive=1 and status=1 and companyid=@companyid);

SELECT 
     ISNULL((select count(wep.purchaseid) from weavers_purchase  wep
	left join weavers_purchase_nested wepn on wepn.purchaseid=wep.purchaseid
	where wep.companyid=@companyid and wep.weaverid=@weaverid and wep.date between @fromdate and @todate), 0)
AS weaverid

END
GO
/****** Object:  StoredProcedure [dbo].[get_sales_billing]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_sales_billing]
@companyid int,
@date nvarchar(255)
as
BEGIN
	IF(@date='All')
		BEGIN
			select sb.entryid,sb.date,sb.bill_no,cm.customer_name,sb.customerid,sb.credit_days,sb.balance,sb.billing_address,sb.shipping_address,
			 sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate,
			 cast(sum(cast(ISNULL(sbn.net_total,0) as float)) as nvarchar(255)) as total
			 from sales_billing sb
			 inner join sales_billing_nested sbn on sb.entryid=sbn.entryid
			 left join customer_master cm on cm.customerid=sb.customerid
			where sb.companyid=@companyid
			 group by sb.entryid,sb.date,sb.bill_no,cm.customer_name,sb.customerid,sb.credit_days,sb.balance,sb.billing_address,sb.shipping_address,
			 sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate

			 order by sb.entryid desc
		END
	ELSE
		BEGIN
			select sb.entryid,sb.date,sb.bill_no,cm.customer_name,sb.customerid,sb.credit_days,sb.balance,sb.billing_address,sb.shipping_address,
			 sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate,
			 cast(sum(cast(ISNULL(sbn.net_total,0) as float)) as nvarchar(255)) as total
			 from sales_billing sb
			 inner join sales_billing_nested sbn on sb.entryid=sbn.entryid
			 left join customer_master cm on cm.customerid=sb.customerid
			where sb.companyid=@companyid and sb.date=@date
			 group by sb.entryid,sb.date,sb.bill_no,cm.customer_name,sb.customerid,sb.credit_days,sb.balance,sb.billing_address,sb.shipping_address,
			 sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate

			 order by sb.entryid desc
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_sales_billing_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_sales_billing_from_to_date]
@companyid int,
@customerid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN

  DECLARE @FromDateDT DATETIME = CAST(@fromdate AS DATETIME);
  DECLARE @ToDateDT DATETIME = CAST(@todate AS DATETIME);

	if(@customerid>0)
		BEGIN
			select sb.date,sb.bill_no,cm.customer_name,cm.customerid,cast(sum(cast(ISNULL(sbn.qty,0) as float)) as nvarchar(255)) as qty,
		 cast(sum(cast(ISNULL(sbn.net_total,0) as float)) as nvarchar(255)) as net_total,
		 STRING_AGG(sbn.si_code,', ') as si_code,
		 STRING_AGG(sbn.ref_code,', ') as ref_code
		 from sales_billing sb
		 inner join sales_billing_nested sbn on sb.entryid=sbn.entryid
		 left join customer_master cm on cm.customerid=sb.customerid

		  WHERE CAST(sb.date AS DATETIME) >= @FromDateDT
		 AND CAST(sb.date AS DATETIME) <= @ToDateDT AND sb.companyid=@companyid AND sb.isactive=1 and sb.customerid=@customerid

		 group by sb.date,sb.bill_no,cm.customer_name,cm.customerid
		END
	ELSE
	BEGIN
		 select sb.date,sb.bill_no,cm.customer_name,cm.customerid,cast(sum(cast(ISNULL(sbn.qty,0) as float)) as nvarchar(255)) as qty,
		 cast(sum(cast(ISNULL(sbn.net_total,0) as float)) as nvarchar(255)) as net_total,
		 STRING_AGG(sbn.si_code,', ') as si_code,
		 STRING_AGG(sbn.ref_code,', ') as ref_code
		 from sales_billing sb
		 inner join sales_billing_nested sbn on sb.entryid=sbn.entryid
		 left join customer_master cm on cm.customerid=sb.customerid

		  WHERE CAST(sb.date AS DATETIME) >= @FromDateDT
		 AND CAST(sb.date AS DATETIME) <= @ToDateDT AND sb.companyid=@companyid AND sb.isactive=1

		 group by sb.date,sb.bill_no,cm.customer_name,cm.customerid
	END
END
GO
/****** Object:  StoredProcedure [dbo].[get_sales_billing_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_sales_billing_nested]
@entryid int
as
BEGIN
	select sbn.*,itm.item_name from sales_billing_nested sbn
	inner join item_master itm on itm.itemid=sbn.itemid
	where sbn.entryid=@entryid
END
GO
/****** Object:  StoredProcedure [dbo].[get_sales_billing_nested_nongst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_sales_billing_nested_nongst]
@entryid int
as
BEGIN
	select sbnn.*,itm.item_name from sales_billing_nested_nongst sbnn
	inner join item_master itm on itm.itemid=sbnn.itemid
	where sbnn.entryid=@entryid
END
GO
/****** Object:  StoredProcedure [dbo].[get_sales_billing_nongst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_sales_billing_nongst]
@companyid int,
@date nvarchar(255)
as
BEGIN
	IF(@date='All')
		BEGIN
			select sb.*,cm.customer_name,cm.customerid,
			 cast(sum(cast(ISNULL(sbn.total,0) as float)) as nvarchar(255)) as total
			 from sales_billing_nongst sb
			 inner join sales_billing_nested_nongst sbn on sb.entryid=sbn.entryid
			 left join customer_master cm on cm.customerid=sb.customerid
			 where sb.companyid=@companyid
			 group by sb.date,sb.bill_no,cm.customer_name,cm.customerid,sb.entryid,sb.customerid,sb.balance,sb.credit_days,sb.billing_address,
			 sb.shipping_address,sb.total,sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate

			 order by sb.entryid desc
		END
	ELSE
		BEGIN
			select sb.*,cm.customer_name,cm.customerid,
			 cast(sum(cast(ISNULL(sbn.total,0) as float)) as nvarchar(255)) as total
			 from sales_billing_nongst sb
			 inner join sales_billing_nested_nongst sbn on sb.entryid=sbn.entryid
			 left join customer_master cm on cm.customerid=sb.customerid
			 where sb.companyid=@companyid and sb.date=@date
			 group by sb.date,sb.bill_no,cm.customer_name,cm.customerid,sb.entryid,sb.customerid,sb.balance,sb.credit_days,sb.billing_address,
			 sb.shipping_address,sb.total,sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate

			 order by sb.entryid desc
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_sales_billing_NONgstpayment_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_sales_billing_NONgstpayment_from_to_date]
@companyid int,
@customerid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN

  DECLARE @FromDateDT DATETIME = CAST(@fromdate AS DATETIME);
  DECLARE @ToDateDT DATETIME = CAST(@todate AS DATETIME);

  IF(@customerid>0)
	BEGIN
		select cp.*,cpn.*,cm.customer_name,sb.bill_no from customer_payment cp
		inner join customer_payment_nested cpn on cpn.paymentid=cp.paymentid
		inner join customer_master cm on cm.customerid=cpn.customerid
		inner join sales_billing sb on sb.entryid=cpn.entryid

		WHERE CAST(cp.date AS DATETIME) >= @FromDateDT
		AND CAST(cp.date AS DATETIME) <= @ToDateDT AND sb.companyid=@companyid AND sb.isactive=1 AND cpn.non_gst=1 and cpn.customerid=@customerid
	END
  ELSE
	BEGIN
		select cp.*,cpn.*,cm.customer_name,sb.bill_no from customer_payment cp
		inner join customer_payment_nested cpn on cpn.paymentid=cp.paymentid
		inner join customer_master cm on cm.customerid=cpn.customerid
		inner join sales_billing sb on sb.entryid=cpn.entryid

		WHERE CAST(cp.date AS DATETIME) >= @FromDateDT
		AND CAST(cp.date AS DATETIME) <= @ToDateDT AND sb.companyid=@companyid AND sb.isactive=1 AND cpn.non_gst=1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[get_sales_billing_payment_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_sales_billing_payment_from_to_date]
@companyid int,
@customerid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN

  DECLARE @FromDateDT DATETIME = CAST(@fromdate AS DATETIME);
  DECLARE @ToDateDT DATETIME = CAST(@todate AS DATETIME);

  IF(@customerid>0)
	BEGIN
		select cp.*,cpn.*,cm.customer_name,sb.bill_no from customer_payment cp
		inner join customer_payment_nested cpn on cpn.paymentid=cp.paymentid
		inner join customer_master cm on cm.customerid=cpn.customerid
		inner join sales_billing sb on sb.entryid=cpn.entryid

		WHERE CAST(cp.date AS DATETIME) >= @FromDateDT
		AND CAST(cp.date AS DATETIME) <= @ToDateDT AND sb.companyid=@companyid AND sb.isactive=1 AND cpn.gst=1 and cpn.customerid=@customerid
	END
  ELSE
	BEGIN
		select cp.*,cpn.*,cm.customer_name,sb.bill_no from customer_payment cp
		inner join customer_payment_nested cpn on cpn.paymentid=cp.paymentid
		inner join customer_master cm on cm.customerid=cpn.customerid
		inner join sales_billing sb on sb.entryid=cpn.entryid

		WHERE CAST(cp.date AS DATETIME) >= @FromDateDT
		AND CAST(cp.date AS DATETIME) <= @ToDateDT AND sb.companyid=@companyid AND sb.isactive=1 AND cpn.gst=1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[get_sales_billing_return_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_sales_billing_return_from_to_date]
@companyid int,
@customerid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN

  DECLARE @FromDateDT DATETIME = CAST(@fromdate AS DATETIME);
  DECLARE @ToDateDT DATETIME = CAST(@todate AS DATETIME);

  IF(@customerid>0)
	BEGIN
		select sbr.*,cast(sum(CAST(sbrn.return_qty as int))as nvarchar(255)) as return_qty,
		cast(sum(CAST(sbrn.return_net_total as decimal(10,2)))as nvarchar(255)) as return_net_total,
		cm.customer_name
		from sales_billing_returnDebit sbr
		inner join sales_billing_returnDebit_nested sbrn on sbrn.returndebit_id=sbr.returndebit_id
		inner join customer_master cm on cm.customerid=sbr.customerid

		WHERE CAST(sbr.return_date AS DATETIME) >= @FromDateDT
      AND CAST(sbr.return_date AS DATETIME) <= @ToDateDT AND sbr.companyid=@companyid AND sbr.isactive=1 and sbr.customerid=@customerid

	  group by sbr.returndebit_id,sbr.entryid,sbr.customerid,sbr.bill_date,sbr.invoice_no,sbr.invoice_date,sbr.return_no,sbr.return_date,
	  sbr.total,sbr.return_total,sbr.isactive,sbr.companyid,sbr.cuid,sbr.cdate,sbr.muid,sbr.mdate,cm.customer_name
	END
  ELSE
	BEGIN
		select sbr.*,cast(sum(CAST(sbrn.return_qty as int))as nvarchar(255)) as return_qty,
		cast(sum(CAST(sbrn.return_net_total as decimal(10,2)))as nvarchar(255)) as return_net_total,
		cm.customer_name
		from sales_billing_returnDebit sbr
		inner join sales_billing_returnDebit_nested sbrn on sbrn.returndebit_id=sbr.returndebit_id
		inner join customer_master cm on cm.customerid=sbr.customerid

		WHERE CAST(sbr.return_date AS DATETIME) >= @FromDateDT
      AND CAST(sbr.return_date AS DATETIME) <= @ToDateDT AND sbr.companyid=@companyid AND sbr.isactive=1

	  group by sbr.returndebit_id,sbr.entryid,sbr.customerid,sbr.bill_date,sbr.invoice_no,sbr.invoice_date,sbr.return_no,sbr.return_date,
	  sbr.total,sbr.return_total,sbr.isactive,sbr.companyid,sbr.cuid,sbr.cdate,sbr.muid,sbr.mdate,cm.customer_name
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Get_sales_billing_returnDebit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_sales_billing_returnDebit]
@companyid int,
@return_date nvarchar(255)
as
begin
	IF(@return_date='All')
		BEGIN
			select DISTINCT sbrd.* ,cm.customer_name,cm.mobile_no,cm.state,cm.state_code,cm.state,
				cm.gst_in,cm.address,cm.shipping_address,cm.address,
				cast(sum(cast(isnull(sbrdn.return_cgst_amount,0) as float))as nvarchar(255)) as return_cgst_amount,
				cast(sum(cast(isnull(sbrdn.return_sgst_amount,0) as float))as nvarchar(255)) as return_sgst_amount,
				cast(sum(cast(isnull(sbrdn.return_net_total,0) as float))as nvarchar(255)) as return_net_total,
				cast(sum(cast(isnull(sbrdn.return_igst_amount,0) as float))as nvarchar(255)) AS return_igst_amount,
				cast(sum(cast(isnull(sbrdn.return_qty,0) as float))as nvarchar(255)) AS return_qtyn,
				cast(sum(cast(isnull(sbrdn.return_total,0) as float))as nvarchar(255)) AS return_totaln
				from sales_billing_returnDebit sbrd
				inner join customer_master cm on cm.customerid=sbrd.customerid
				inner join sales_billing_returnDebit_nested sbrdn on sbrd.returndebit_id=sbrdn.returndebit_id
				where sbrd.companyid=@companyid
				group by sbrd.returndebit_id,sbrd.entryid,sbrd.customerid,sbrd.bill_date,sbrd.invoice_no,sbrd.invoice_date,sbrd.return_no,
				sbrd.return_date,sbrd.total,sbrd.return_total,sbrd.isactive,sbrd.companyid,sbrd.cuid,sbrd.cdate,sbrd.muid,sbrd.mdate,cm.customer_name,
				cm.mobile_no,cm.address,cm.state,cm.state_code,cm.gst_in,cm.shipping_address

				order by sbrd.returndebit_id desc
		END
	ELSE
		BEGIN
			select DISTINCT sbrd.* ,cm.customer_name,cm.mobile_no,cm.state,cm.state_code,cm.state,
			cm.gst_in,cm.address,cm.shipping_address,cm.address,
			cast(sum(cast(isnull(sbrdn.return_cgst_amount,0) as float))as nvarchar(255)) as return_cgst_amount,
			cast(sum(cast(isnull(sbrdn.return_sgst_amount,0) as float))as nvarchar(255)) as return_sgst_amount,
			cast(sum(cast(isnull(sbrdn.return_net_total,0) as float))as nvarchar(255)) as return_net_total,
			cast(sum(cast(isnull(sbrdn.return_igst_amount,0) as float))as nvarchar(255)) AS return_igst_amount,
			cast(sum(cast(isnull(sbrdn.return_qty,0) as float))as nvarchar(255)) AS return_qtyn,
			cast(sum(cast(isnull(sbrdn.return_total,0) as float))as nvarchar(255)) AS return_totaln
			from sales_billing_returnDebit sbrd
			inner join customer_master cm on cm.customerid=sbrd.customerid
			inner join sales_billing_returnDebit_nested sbrdn on sbrd.returndebit_id=sbrdn.returndebit_id
			where sbrd.companyid=@companyid AND sbrd.return_date=@return_date
			group by sbrd.returndebit_id,sbrd.entryid,sbrd.customerid,sbrd.bill_date,sbrd.invoice_no,sbrd.invoice_date,sbrd.return_no,
			sbrd.return_date,sbrd.total,sbrd.return_total,sbrd.isactive,sbrd.companyid,sbrd.cuid,sbrd.cdate,sbrd.muid,sbrd.mdate,cm.customer_name,
			cm.mobile_no,cm.address,cm.state,cm.state_code,cm.gst_in,cm.shipping_address

			order by sbrd.returndebit_id desc
		END
end
GO
/****** Object:  StoredProcedure [dbo].[get_sales_billing_returnDebit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_sales_billing_returnDebit_nested]
@returndebit_id int
as
BEGIN
	select sbrdn.*,itmm.item_name from sales_billing_returnDebit_nested sbrdn
	inner join item_master itmm on itmm.itemid=sbrdn.itemid
	where sbrdn.returndebit_id=@returndebit_id
END
GO
/****** Object:  StoredProcedure [dbo].[get_sales_billingNongst_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_sales_billingNongst_from_to_date]
@companyid int,
@customerid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN

  DECLARE @FromDateDT DATETIME = CAST(@fromdate AS DATETIME);
  DECLARE @ToDateDT DATETIME = CAST(@todate AS DATETIME);

	if(@customerid>0)
		BEGIN
			select sb.date,sb.bill_no,cm.customer_name,cm.customerid,cast(sum(cast(ISNULL(sbn.qty,0) as float)) as nvarchar(255)) as qty,
		 cast(sum(cast(ISNULL(sbn.total,0) as float)) as nvarchar(255)) as total,
		 STRING_AGG(sbn.si_code,', ') as si_code,
		 STRING_AGG(sbn.ref_code,', ') as ref_code
		 from sales_billing_nongst sb
		 inner join sales_billing_nested_nongst sbn on sb.entryid=sbn.entryid
		 left join customer_master cm on cm.customerid=sb.customerid

		  WHERE CAST(sb.date AS DATETIME) >= @FromDateDT
		 AND CAST(sb.date AS DATETIME) <= @ToDateDT AND sb.companyid=@companyid AND sb.isactive=1 and sb.customerid=@customerid

		 group by sb.date,sb.bill_no,cm.customer_name,cm.customerid
		END
	ELSE
	BEGIN
		 select sb.date,sb.bill_no,cm.customer_name,cm.customerid,cast(sum(cast(ISNULL(sbn.qty,0) as float)) as nvarchar(255)) as qty,
		 cast(sum(cast(ISNULL(sbn.total,0) as float)) as nvarchar(255)) as total,
		 STRING_AGG(sbn.si_code,', ') as si_code,
		 STRING_AGG(sbn.ref_code,', ') as ref_code
		 from sales_billing_nongst sb
		 inner join sales_billing_nested_nongst sbn on sb.entryid=sbn.entryid
		 left join customer_master cm on cm.customerid=sb.customerid

		  WHERE CAST(sb.date AS DATETIME) >= @FromDateDT
		 AND CAST(sb.date AS DATETIME) <= @ToDateDT AND sb.companyid=@companyid AND sb.isactive=1

		 group by sb.date,sb.bill_no,cm.customer_name,cm.customerid
	END

END
GO
/****** Object:  StoredProcedure [dbo].[get_sales_billingNongst_return_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_sales_billingNongst_return_from_to_date]
@companyid int,
@customerid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN

  DECLARE @FromDateDT DATETIME = CAST(@fromdate AS DATETIME);
  DECLARE @ToDateDT DATETIME = CAST(@todate AS DATETIME);

  IF(@customerid>0)
	BEGIN
		select sbr.*,cast(sum(CAST(sbrn.return_qty as int))as nvarchar(255)) as return_qty,
		cast(sum(CAST(sbrn.return_total as decimal(10,2)))as nvarchar(255)) as return_total,
		cm.customer_name
		from sales_billingNongst_returnDebit sbr
		inner join sales_billingNongst_returnDebit_nested sbrn on sbrn.returndebit_id=sbr.returndebit_id
		inner join customer_master cm on cm.customerid=sbr.customerid

		WHERE CAST(sbr.return_date AS DATETIME) >= @FromDateDT
      AND CAST(sbr.return_date AS DATETIME) <= @ToDateDT AND sbr.companyid=@companyid AND sbr.isactive=1 and sbr.customerid=@customerid

	  group by sbr.returndebit_id,sbr.entryid,sbr.customerid,sbr.bill_date,sbr.invoice_no,sbr.invoice_date,sbr.return_no,sbr.return_date,
	  sbr.total,sbr.return_total,sbr.isactive,sbr.companyid,sbr.cuid,sbr.cdate,sbr.muid,sbr.mdate,cm.customer_name
	END
  ELSE
	BEGIN
		select sbr.*,cast(sum(CAST(sbrn.return_qty as int))as nvarchar(255)) as return_qty,
		cast(sum(CAST(sbrn.return_total as decimal(10,2)))as nvarchar(255)) as return_total,
		cm.customer_name
		from sales_billingNongst_returnDebit sbr
		inner join sales_billingNongst_returnDebit_nested sbrn on sbrn.returndebit_id=sbr.returndebit_id
		inner join customer_master cm on cm.customerid=sbr.customerid

		WHERE CAST(sbr.return_date AS DATETIME) >= @FromDateDT
      AND CAST(sbr.return_date AS DATETIME) <= @ToDateDT AND sbr.companyid=@companyid AND sbr.isactive=1

	  group by sbr.returndebit_id,sbr.entryid,sbr.customerid,sbr.bill_date,sbr.invoice_no,sbr.invoice_date,sbr.return_no,sbr.return_date,
	  sbr.total,sbr.return_total,sbr.isactive,sbr.companyid,sbr.cuid,sbr.cdate,sbr.muid,sbr.mdate,cm.customer_name
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Get_sales_billingNongst_returnDebit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [Get_sales_billingNongst_returnDebit] 3,'2024-05-24'
CREATE procedure [dbo].[Get_sales_billingNongst_returnDebit]
@companyid int,
@return_date nvarchar(255)
as
begin
	IF(@return_date='All')
		BEGIN
			select DISTINCT sbrd.* ,cm.customer_name,cm.mobile_no,cm.state,cm.state_code,
				cm.gst_in,cm.address,cm.shipping_address,cm.address,
				cast(sum(CAST(ISNULL(sbrdn.return_qty,0) as float)) as nvarchar(255)) as return_qtyn,
				cast(sum(CAST(ISNULL(sbrdn.return_total,0) as float)) as nvarchar(255)) as return_totaln
				from sales_billingNongst_returnDebit sbrd
				left join customer_master cm on cm.customerid=sbrd.customerid
				inner join sales_billingNongst_returnDebit_nested sbrdn on sbrdn.returndebit_id=sbrd.returndebit_id
				where sbrd.companyid=@companyid
				group by sbrd.returndebit_id,sbrd.entryid,sbrd.customerid,sbrd.bill_date,sbrd.invoice_no,sbrd.invoice_date,
				sbrd.return_no,sbrd.return_date,sbrd.total,sbrd.return_total,sbrd.isactive,sbrd.companyid,sbrd.cuid,sbrd.cdate,sbrd.muid,sbrd.mdate,
				cm.customer_name,cm.mobile_no,cm.state,cm.state_code,cm.gst_in,cm.address,cm.shipping_address

				order by sbrd.returndebit_id desc
		END
	ELSE
		BEGIN
			select DISTINCT sbrd.* ,cm.customer_name,cm.mobile_no,cm.state,cm.state_code,
			cm.gst_in,cm.address,cm.shipping_address,cm.address,
			cast(sum(CAST(ISNULL(sbrdn.return_qty,0) as float)) as nvarchar(255)) as return_qtyn,
			cast(sum(CAST(ISNULL(sbrdn.return_total,0) as float)) as nvarchar(255)) as return_totaln
			from sales_billingNongst_returnDebit sbrd
			left join customer_master cm on cm.customerid=sbrd.customerid
			inner join sales_billingNongst_returnDebit_nested sbrdn on sbrdn.returndebit_id=sbrd.returndebit_id
			where sbrd.companyid=@companyid AND sbrd.return_date=@return_date
			group by sbrd.returndebit_id,sbrd.entryid,sbrd.customerid,sbrd.bill_date,sbrd.invoice_no,sbrd.invoice_date,
			sbrd.return_no,sbrd.return_date,sbrd.total,sbrd.return_total,sbrd.isactive,sbrd.companyid,sbrd.cuid,sbrd.cdate,sbrd.muid,sbrd.mdate,
			cm.customer_name,cm.mobile_no,cm.state,cm.state_code,cm.gst_in,cm.address,cm.shipping_address
			order by sbrd.returndebit_id desc
		END
end
GO
/****** Object:  StoredProcedure [dbo].[get_sales_billingNongst_returnDebit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_sales_billingNongst_returnDebit_nested]
@returndebit_id int
as
BEGIN
	select * from sales_billingNongst_returnDebit_nested where returndebit_id=@returndebit_id
END
GO
/****** Object:  StoredProcedure [dbo].[get_sales_legger]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- get_sales_legger 5,'2022-01-01','2024-07-17'
CREATE PROCEDURE [dbo].[get_sales_legger]
@customerid INT,
@fromdate NVARCHAR(255),
@todate NVARCHAR(255)
AS
BEGIN
    -- Use CTEs for intermediate results
    WITH getsalesnested AS (
        SELECT entryid, SUM(CAST(ISNULL(net_total, 0) AS DECIMAL(10,2))) AS total 
        FROM sales_billing_nested
        GROUP BY entryid
    ),
    getreturnnested AS (
        SELECT returndebit_id, SUM(CAST(ISNULL(return_net_total, 0) AS DECIMAL(10,2))) AS ret_total 
        FROM sales_billing_returnDebit_nested
        GROUP BY returndebit_id
    ),
    get_payment AS (
        SELECT paymentid, SUM(ISNULL(CAST(NULLIF(deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment 
        FROM customer_payment_nested
        WHERE gst = 1 or isbal=1
        GROUP BY paymentid
    ),
	getBalpayment as (
		select sp.customerid,SUM(ISNULL(CAST(NULLIF(spn.deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment from customer_payment sp
		inner join customer_payment_nested spn on spn.paymentid=sp.paymentid and spn.isbal=1	
		WHERE TRY_CONVERT(DATE, sp.date, 23) BETWEEN @fromdate AND @todate
		group by sp.customerid
	),
	getGSTADAmount as (
	select sp.advanceid,SUM(ISNULL(CAST(NULLIF(spn.deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment from customer_payment sp
		inner join customer_payment_nested spn on spn.paymentid=sp.paymentid and spn.non_gst=1	
		WHERE TRY_CONVERT(DATE, sp.date, 23) BETWEEN @fromdate AND @todate
		group by sp.advanceid
	)
-------------------------------------------
    SELECT 
        sb.date,
        sb.bill_no,
        sbn.total AS debit,
        0.00 AS credit,
        'Sales Bill No ' AS descrip_tion,
        3 AS sort_order
    FROM 
        sales_billing sb
    LEFT JOIN 
        getsalesnested sbn ON sbn.entryid = sb.entryid
    WHERE 
        sb.customerid = @customerid 
        AND TRY_CONVERT(DATE, sb.date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        sbr.return_date AS date,
        sbr.return_no AS bill_no,
        0.00 AS debit,
        sbrn.ret_total AS credit,
        'Return No' AS descrip_tion,
        4 AS sort_order
    FROM 
        sales_billing_returnDebit sbr
    LEFT JOIN 
        getreturnnested sbrn ON sbrn.returndebit_id = sbr.returndebit_id
    WHERE 
        sbr.customerid = @customerid 
        AND TRY_CONVERT(DATE, sbr.return_date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        cp.date,
        '' AS bill_no,
        0.00 AS debit,
        cpn.payment AS credit,
        'Payment Received' AS descrip_tion,
        5 AS sort_order
    FROM customer_payment cp
    LEFT JOIN get_payment cpn ON cpn.paymentid = cp.paymentid
    WHERE cp.customerid = @customerid and cp.advanceid<1 and cp.amount_mode!='Deduct from Advance'
        AND TRY_CONVERT(DATE, cp.date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        '' AS date,
        '' AS bill_no,
       Try_CAST(cm.balance AS DECIMAL(10,2)) + ISNULL(CAST(gb.payment AS DECIMAL(10,2)),0.00) AS debit,
        0.00 AS credit,
        'Opening Balance' AS descrip_tion,
        1 AS sort_order
    FROM customer_master  cm
	left join getBalpayment gb on gb.customerid=cm.customerid
    WHERE cm.customerid = @customerid

	UNION All 

	select date,
	 '' AS bill_no,
	 0.00 as debit,
	advance_amount-ISNULL(ggaa.payment,0.00) as credit,
	 'Advance' AS descrip_tion,
	 2 as sort_order
	 from customer_advance ca
	 left join getGSTADAmount ggaa on ggaa.advanceid=ca.advanceid
	 where customerid=@customerid AND TRY_CONVERT(DATE,date, 23) BETWEEN @fromdate AND @todate

    ORDER BY
	date,
        sort_order
        
END
GO
/****** Object:  StoredProcedure [dbo].[get_sales_legger_non_gst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_sales_legger_non_gst]
@customerid INT,
@fromdate NVARCHAR(255),
@todate NVARCHAR(255)
AS
BEGIN
    -- Use CTEs for intermediate results
    WITH getsalesnested AS (
        SELECT entryid, SUM(CAST(ISNULL(total, 0) AS DECIMAL(10,2))) AS total 
        FROM sales_billing_nested_nongst
        GROUP BY entryid
    ),
    getreturnnested AS (
        SELECT returndebit_id, SUM(CAST(ISNULL(return_total, 0) AS DECIMAL(10,2))) AS ret_total 
        FROM sales_billingNongst_returnDebit_nested
        GROUP BY returndebit_id
    ),
    get_payment AS (
        SELECT paymentid, SUM(ISNULL(CAST(NULLIF(deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment 
        FROM customer_payment_nested
        WHERE non_gst = 1 or isbal=1
        GROUP BY paymentid
    ),
	getBalpayment as (
		select sp.customerid,SUM(ISNULL(CAST(NULLIF(spn.deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment from customer_payment sp
		inner join customer_payment_nested spn on spn.paymentid=sp.paymentid and spn.isbal=1	
		WHERE TRY_CONVERT(DATE, sp.date, 23) BETWEEN @fromdate AND @todate
		group by sp.customerid
	),
	getGSTADAmount as (
	select sp.advanceid,SUM(ISNULL(CAST(NULLIF(spn.deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment from customer_payment sp
		inner join customer_payment_nested spn on spn.paymentid=sp.paymentid and spn.gst=1	
		WHERE TRY_CONVERT(DATE, sp.date, 23) BETWEEN @fromdate AND @todate
		group by sp.advanceid
	)

    SELECT 
        sb.date,
        sb.bill_no,
        sbn.total AS debit,
        0.00 AS credit,
        'Sales Bill No ' AS descrip_tion,
        3 AS sort_order
    FROM 
        sales_billing_nongst sb
    LEFT JOIN 
        getsalesnested sbn ON sbn.entryid = sb.entryid
    WHERE 
        sb.customerid = @customerid 
        AND TRY_CONVERT(DATE, sb.date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        sbr.return_date AS date,
        sbr.return_no AS bill_no,
        0.00 AS debit,
        sbrn.ret_total AS credit,
        'Return No' AS descrip_tion,
        4 AS sort_order
    FROM 
        sales_billingNongst_returnDebit sbr
    LEFT JOIN 
        getreturnnested sbrn ON sbrn.returndebit_id = sbr.returndebit_id
    WHERE 
        sbr.customerid = @customerid 
        AND TRY_CONVERT(DATE, sbr.return_date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        cp.date,
        '' AS bill_no,
        0.00 AS debit,
        cpn.payment AS credit,
        'Payment Received' AS descrip_tion,
        5 AS sort_order
    FROM customer_payment cp
    LEFT JOIN get_payment cpn ON cpn.paymentid = cp.paymentid
    WHERE cp.customerid = @customerid and cp.advanceid<1 and cp.amount_mode!='Deduct from Advance'
        AND TRY_CONVERT(DATE, cp.date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        '' AS date,
        '' AS bill_no,
        Try_CAST(cm.balance AS DECIMAL(10,2)) + ISNULL(CAST(gb.payment AS DECIMAL(10,2)),0.00) AS debit,
        0.00 AS credit,
        'Opening Balance' AS descrip_tion,
        1 AS sort_order
    FROM customer_master cm
	left join getBalpayment gb on gb.customerid=cm.customerid
    WHERE cm.customerid = @customerid

	UNION All 

	select date,
	 '' AS bill_no,
	 0.00 as debit,
	 advance_amount-ISNULL(ggaa.payment,0.00) as credit,
	 'Advance' AS descrip_tion,
	 2 as sort_order
	 from customer_advance ca
	 left join getGSTADAmount ggaa on ggaa.advanceid=ca.advanceid
	 where customerid=@customerid AND TRY_CONVERT(DATE,date, 23) BETWEEN @fromdate AND @todate

    ORDER BY
	date,
        sort_order        
END
GO
/****** Object:  StoredProcedure [dbo].[get_salesbilling_gst_bycustomerid]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_salesbilling_gst_bycustomerid]
@customerid int,
@companyid int
AS
	BEGIN
		select sb.entryid,sb.date,sb.bill_no,cm.customer_name,sb.customerid,sb.credit_days,sb.balance,sb.billing_address,sb.shipping_address,
			 sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate,
			 cast(sum(cast(ISNULL(sbn.net_total,0) as float)) as nvarchar(255)) as total
			 from sales_billing sb
			 inner join sales_billing_nested sbn on sb.entryid=sbn.entryid
			 left join customer_master cm on cm.customerid=sb.customerid
			where sb.companyid=@companyid and sb.customerid=@customerid
			 group by sb.entryid,sb.date,sb.bill_no,cm.customer_name,sb.customerid,sb.credit_days,sb.balance,sb.billing_address,sb.shipping_address,
			 sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate
	END
GO
/****** Object:  StoredProcedure [dbo].[get_salesbilling_Nongst_bycustomerid]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_salesbilling_Nongst_bycustomerid]
@customerid int,
@companyid int
AS
	BEGIN
		select sb.*,cm.customer_name,cm.customerid,
			 cast(sum(cast(ISNULL(sbn.total,0) as float)) as nvarchar(255)) as total
			 from sales_billing_nongst sb
			 inner join sales_billing_nested_nongst sbn on sb.entryid=sbn.entryid
			 left join customer_master cm on cm.customerid=sb.customerid
			 where sb.companyid=@companyid and sb.customerid=@customerid
			 group by sb.date,sb.bill_no,cm.customer_name,cm.customerid,sb.entryid,sb.customerid,sb.balance,sb.credit_days,sb.billing_address,
			 sb.shipping_address,sb.total,sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate
	END
GO
/****** Object:  StoredProcedure [dbo].[Get_salesBilling_sbnestedBy_ref_code]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Get_salesBilling_sbnestedBy_ref_code 3,'KO1'
CREATE PROCEDURE [dbo].[Get_salesBilling_sbnestedBy_ref_code]
    @companyid INT,
    @ref_code NVARCHAR(255)
AS
BEGIN
    SELECT
        sbn.*,
		sb.entryid,
        sb.bill_no,
        sb.date as bill_date,
        sb.customerid,
        sb.total as return_total,
		cm.customer_name,
		itmm.item_name,
		sb.bill_no
    FROM
        sales_billing_nested sbn
    INNER JOIN
        sales_billing sb ON sbn.entryid = sb.entryid
		INNER JOIN
		customer_master cm ON cm.customerid=sb.customerid
		INNER JOIN
		item_master itmm ON itmm.itemid=sbn.itemid
    WHERE
        sb.companyid = @companyid
        AND sbn.ref_code = @ref_code;
END
GO
/****** Object:  StoredProcedure [dbo].[Get_salesBilling_sbnestedBy_si_code]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Get_salesBilling_sbnestedBy_si_code 3,'0002'
CREATE PROCEDURE [dbo].[Get_salesBilling_sbnestedBy_si_code]
    @companyid INT,
    @si_code NVARCHAR(255)
AS
BEGIN
    SELECT
        sbn.*,
        sb.bill_no,
		sb.entryid,
        sb.date as bill_date,
        sb.customerid,
        sb.total AS return_total,
		cm.customer_name,
		itmm.item_name,
		sb.bill_no
    FROM
        sales_billing_nested sbn
    INNER JOIN
        sales_billing sb ON sbn.entryid = sb.entryid
		INNER JOIN
		customer_master cm ON cm.customerid=sb.customerid
		INNER JOIN
		item_master itmm ON itmm.itemid=sbn.itemid
    WHERE
        sb.companyid = @companyid
        AND sbn.si_code = @si_code;
END
GO
/****** Object:  StoredProcedure [dbo].[Get_salesBillingNongst_sbnestedBy__si_code]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [Get_salesBillingNongst_sbnestedBy__si_code] 3,'0002'
CREATE PROCEDURE [dbo].[Get_salesBillingNongst_sbnestedBy__si_code]
    @companyid INT,
    @si_code NVARCHAR(255)
AS
BEGIN
    SELECT
        sbnn.*,
        sb.bill_no,
		sb.entryid,
        sb.date as bill_date,
        sb.customerid,
        sb.total AS return_total,
		cm.customer_name,	
		itmm.item_name,
		sb.bill_no
    FROM
        sales_billing_nested_nongst sbnn
    INNER JOIN
        sales_billing_nongst sb ON sbnn.entryid = sb.entryid
			INNER JOIN
		customer_master cm ON cm.customerid=sb.customerid
		INNER JOIN
		item_master itmm ON itmm.itemid=sbnn.itemid
    WHERE
        sb.companyid = @companyid
        AND sbnn.si_code = @si_code;
END
GO
/****** Object:  StoredProcedure [dbo].[Get_salesBillingNongst_sbnestedBy_ref_code]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Get_salesBillingNongst_sbnestedBy_ref_code 3,'KO1'
CREATE PROCEDURE [dbo].[Get_salesBillingNongst_sbnestedBy_ref_code]
    @companyid INT,
    @ref_code NVARCHAR(255)
AS
BEGIN
    SELECT
        sbnn.*,
		sb.entryid,
        sb.bill_no,
        sb.date as bill_date,
        sb.customerid,
        sb.total as return_total,
		cm.customer_name,
		itmm.item_name,
		sb.bill_no
    FROM
        sales_billing_nested_nongst sbnn
    INNER JOIN
        sales_billing_nongst sb ON sbnn.entryid = sb.entryid
			INNER JOIN
		customer_master cm ON cm.customerid=sb.customerid
		INNER JOIN
		item_master itmm ON itmm.itemid=sbnn.itemid
    WHERE
        sb.companyid = @companyid
        AND sbnn.ref_code = @ref_code;
END
GO
/****** Object:  StoredProcedure [dbo].[get_SiCode_third_party_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[get_SiCode_third_party_purchase] 3
CREATE procedure [dbo].[get_SiCode_third_party_purchase]
@companyid int
AS
BEGIN
declare @fromdate nvarchar(255);
declare @todate nvarchar(255);
set @fromdate = (select top 1 fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
set @todate = (select top 1 todate from financial_year where isactive=1 and status=1 and companyid=@companyid);

--SELECT 
--    ISNULL((select count(tpp.purchaseid) from third_party_purchase  tpp
--	inner join third_party_purchase_nested tppn on tppn.purchaseid=tpp.purchaseid
--	where tpp.companyid=@companyid and tpp.date between @fromdate and @todate), 0) 
--    +
--    ISNULL((select count(tppg.purchaseid) from third_party_gst_purchase  tppg
--	inner join third_party_gst_purchase_nested tppng on tppng.purchaseid=tppg.purchaseid
--	where tppg.companyid=@companyid and tppg.date between @fromdate and @todate), 0) 
--	+
--	 ISNULL((select count(wep.purchaseid) from weavers_purchase  wep
--	inner join weavers_purchase_nested wepn on wepn.purchaseid=wep.purchaseid
--	where wep.companyid=@companyid and wep.date between @fromdate and @todate), 0) 
--AS purchaseid

select max(cast(si_code as int)) as purchaseid from stock_table where companyid=@companyid and date between @fromdate and @todate
END
GO
/****** Object:  StoredProcedure [dbo].[get_stock_table]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_stock_table] 3,'sicode','2022-12-27','2024-06-27','01'
-- [get_stock_table] 3,'date','2022-12-27','2024-06-27','01'
CREATE PROCEDURE [dbo].[get_stock_table] 
@companyid int,
@type nvarchar(255),
@fromdate nvarchar(255),
@todate nvarchar(255),
@si_code nvarchar(255)
AS
BEGIN

IF(@type='date')
BEGIN
	With GetPartName as (
select st.stockid,
CASE 
    WHEN st.third_party_gst = 1 THEN tpm.party_name
    WHEN st.third_party_nongst = 1 THEN tpmm.party_name -- Use the same alias for both cases
    WHEN st.weavers = 1 THEN wm.weaver_name
END AS party_name
from stock_table st
LEFT JOIN third_party_gst_purchase tp ON tp.purchaseid = st.purchaseid AND st.third_party_gst = 1
LEFT JOIN third_party_master tpm ON tpm.third_partyid = tp.third_partyid
LEFT JOIN third_party_purchase tpn ON tpn.purchaseid = st.purchaseid AND st.third_party_nongst = 1
LEFT JOIN third_party_master tpmm ON tpmm.third_partyid=tpn.third_partyid
LEFT JOIN weavers_purchase wp ON wp.purchaseid = st.purchaseid AND st.weavers = 1
LEFT JOIN weaver_master wm ON wm.weaverid = wp.weaverid
),
GETSALES as (
select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
STRING_AGG(sb.bill_no,'-') as bill_no from 
sales_billing_nested sbn
inner join sales_billing sb on sb.entryid=sbn.entryid
inner join customer_master cm on cm.customerid=sb.customerid
group by sbn.stockid
),
GETSALESNONGST as (
select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
STRING_AGG(sb.bill_no,'-') as bill_no from 
sales_billing_nested_nongst sbn
inner join sales_billing_nongst sb on sb.entryid=sbn.entryid
inner join customer_master cm on cm.customerid=sb.customerid
group by sbn.stockid
),
GETSALESBILLGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billing_returnDebit_nested sbnr
inner join sales_billing_nested sbn on sbn.entry_n_id=sbnr.entry_n_id
group by stockid
),
GETSALESBILLNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billingNongst_returnDebit_nested sbnr
inner join sales_billing_nested_nongst sbn on sbn.entry_n_id=sbnr.entry_n_id
group by stockid
),
GETTHIRDPARTYGSTReturn as(
select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchasegst_debit_nested
group by purchase_n_id,si_code
),
GETTHIRDPARTYNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchaseNongst_debit_nested
group by purchase_n_id,si_code
)
-------------
select stk.stockid,stk.itemid,im.item_name,stk.brandid,bm.brand_name,stk.date,
stk.si_code,stk.ref_code,stk.qty as total_qty,
CASE 
	WHEN stk.third_party_gst = 1 THEN 'THIRD PARTY GST'
	WHEN stk.third_party_nongst = 1 THEN 'THIRD PARTY NON GST'
	WHEN stk.weavers = 1 THEN 'WEAVERS'
END AS p_from,
GPN.party_name,
(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)) as saleqty,
CAST(CAST(ISNULL(GS.saleqty,0)as float)as nvarchar(255)) as sold_qty_gst,
CAST(CAST(ISNULL(GSNG.saleqty,0)as float)as nvarchar(255)) as sold_qty_nogst,
(ISNULL(GS.customer_name,'')+ '-' + ISNULL(GSNG.customer_name,'')) as customer_name,
(ISNULL(GS.bill_no,'')+ ',' + ISNULL(GSNG.bill_no,'')) as bill_no,
CAST((CAST(stk.qty as float)+ISNULL(sbnr.return_qty,0)+ISNULL(sbnnr.return_qty,0))-(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)+ISNULL(tpdr.return_qty,0)+ISNULL(tpdnr.return_qty,0)) as nvarchar(255)) as avail_qty
--,stk.qty,sbnr.return_qty,sbnnr.return_qty,GS.saleqty,GSNG.saleqty,tpdr.return_qty,tpdnr.return_qty
from stock_table stk
inner join brand_master bm on bm.brandid=stk.brandid
inner join item_master im on im.itemid=stk.itemid
left Join  GetPartName GPN on GPN.stockid=stk.stockid
left join GETSALES GS on GS.stockid=stk.stockid
left join GETSALESNONGST GSNG on GSNG.stockid=stk.stockid
left join GETSALESBILLGSTReturn sbnr on sbnr.stockid=stk.stockid
left join GETSALESBILLNONGSTReturn sbnnr on sbnnr.stockid=stk.stockid
left join GETTHIRDPARTYGSTReturn tpdr on tpdr.purchase_n_id=stk.purchase_n_id and tpdr.si_code=stk.si_code
left join GETTHIRDPARTYNONGSTReturn tpdnr on tpdnr.purchase_n_id=stk.purchase_n_id and tpdnr.si_code=stk.si_code
where stk.isactive=1 and stk.companyid=@companyid and stk.date between @fromdate and @todate
END
ELSE IF(@type='sicode')
BEGIN
	With GetPartName as (
select st.stockid,
CASE 
    WHEN st.third_party_gst = 1 THEN tpm.party_name
    WHEN st.third_party_nongst = 1 THEN tpmm.party_name -- Use the same alias for both cases
    WHEN st.weavers = 1 THEN wm.weaver_name
END AS party_name
from stock_table st
LEFT JOIN third_party_gst_purchase tp ON tp.purchaseid = st.purchaseid AND st.third_party_gst = 1
LEFT JOIN third_party_master tpm ON tpm.third_partyid = tp.third_partyid
LEFT JOIN third_party_purchase tpn ON tpn.purchaseid = st.purchaseid AND st.third_party_nongst = 1
LEFT JOIN third_party_master tpmm ON tpmm.third_partyid=tpn.third_partyid
LEFT JOIN weavers_purchase wp ON wp.purchaseid = st.purchaseid AND st.weavers = 1
LEFT JOIN weaver_master wm ON wm.weaverid = wp.weaverid
),
GETSALES as (
select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
STRING_AGG(sb.bill_no,'-') as bill_no from 
sales_billing_nested sbn
inner join sales_billing sb on sb.entryid=sbn.entryid
inner join customer_master cm on cm.customerid=sb.customerid
group by sbn.stockid
),
GETSALESNONGST as (
select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
STRING_AGG(sb.bill_no,'-') as bill_no from 
sales_billing_nested_nongst sbn
inner join sales_billing_nongst sb on sb.entryid=sbn.entryid
inner join customer_master cm on cm.customerid=sb.customerid
group by sbn.stockid
),
GETSALESBILLGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billing_returnDebit_nested sbnr
inner join sales_billing_nested sbn on sbn.entry_n_id=sbnr.entry_n_id
where sbnr.si_code=@si_code
group by stockid
),
GETSALESBILLNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billingNongst_returnDebit_nested sbnr
inner join sales_billing_nested_nongst sbn on sbn.entry_n_id=sbnr.entry_n_id
where sbnr.si_code=@si_code
group by stockid
),
GETTHIRDPARTYGSTReturn as(
select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id from third_partyPurchasegst_debit_nested
where si_code=@si_code
group by purchase_n_id
),
GETTHIRDPARTYNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id from third_partyPurchaseNongst_debit_nested
where si_code=@si_code
group by purchase_n_id
)
-------------
select stk.stockid,stk.itemid,im.item_name,stk.brandid,bm.brand_name,stk.date,
stk.si_code,stk.ref_code,stk.qty as total_qty,
CASE 
	WHEN stk.third_party_gst = 1 THEN 'THIRD PARTY GST'
	WHEN stk.third_party_nongst = 1 THEN 'THIRD PARTY NON GST'
	WHEN stk.weavers = 1 THEN 'WEAVERS'
END AS p_from,
GPN.party_name,
(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)) as saleqty,
CAST(CAST(ISNULL(GS.saleqty,0)as float)as nvarchar(255)) as sold_qty_gst,
CAST(CAST(ISNULL(GSNG.saleqty,0)as float)as nvarchar(255)) as sold_qty_nogst,
(ISNULL(GS.customer_name,'')+ '-' + ISNULL(GSNG.customer_name,'')) as customer_name,
(ISNULL(GS.bill_no,'')+ ',' + ISNULL(GSNG.bill_no,'')) as bill_no,
CAST((CAST(stk.qty as float)+ISNULL(sbnr.return_qty,0)+ISNULL(sbnnr.return_qty,0))-(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)+ISNULL(tpdr.return_qty,0)+ISNULL(tpdnr.return_qty,0)) as nvarchar(255)) as avail_qty
--,stk.qty,sbnr.return_qty,sbnnr.return_qty,GS.saleqty,GSNG.saleqty,tpdr.return_qty,tpdnr.return_qty
from stock_table stk
inner join brand_master bm on bm.brandid=stk.brandid
inner join item_master im on im.itemid=stk.itemid
left Join  GetPartName GPN on GPN.stockid=stk.stockid
left join GETSALES GS on GS.stockid=stk.stockid
left join GETSALESNONGST GSNG on GSNG.stockid=stk.stockid
left join GETSALESBILLGSTReturn sbnr on sbnr.stockid=stk.stockid
left join GETSALESBILLNONGSTReturn sbnnr on sbnnr.stockid=stk.stockid
left join GETTHIRDPARTYGSTReturn tpdr on tpdr.purchase_n_id=stk.purchase_n_id
left join GETTHIRDPARTYNONGSTReturn tpdnr on tpdnr.purchase_n_id=stk.purchase_n_id
where stk.isactive=1 and stk.companyid=@companyid and stk.si_code=@si_code
END
END
GO
/****** Object:  StoredProcedure [dbo].[get_stock_table_by_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--get_stock_table @companyid=3;
CREATE PROCEDURE [dbo].[get_stock_table_by_date] 
    @companyid int,
	@date nvarchar(255)
AS
BEGIN
SELECT 
      st.stockid, 
    st.itemid, 
    st.brandid, 
    st.si_code,
    st.ref_code, 
	st.date,
	st.qty as total_qty,
	sbn.qty as sold_qty_gst,
	sbnn.qty as sold_qty_nogst,
   CAST((CAST(st.qty as float)-SUM((CAST(ISNULL(sbn.qty,0) as float))+CAST(ISNULL(sbnn.qty,0)as float)))as nvarchar(255)) as avail_qty,
    bm.brand_name, 
    itmm.item_name,
    CASE 
        WHEN st.third_party_gst = 1 THEN tpm.party_name
        WHEN st.third_party_nongst = 1 THEN tpm.party_name
        WHEN st.weavers = 1 THEN wm.weaver_name
        ELSE NULL
    END AS party_name
FROM 
    stock_table st
INNER JOIN 
    brand_master bm ON bm.brandid = st.brandid
INNER JOIN 
    item_master itmm ON itmm.itemid = st.itemid
LEFT JOIN 
    third_party_gst_purchase tp ON tp.purchaseid = st.purchaseid AND st.third_party_gst = 1
LEFT JOIN 
    third_party_master tpm ON tpm.third_partyid = tp.third_partyid
LEFT JOIN 
    third_party_purchase tpn ON tpn.purchaseid = st.purchaseid AND st.third_party_nongst = 1
LEFT JOIN 
    weavers_purchase wp ON wp.purchaseid = st.purchaseid AND st.weavers = 1
LEFT JOIN 
    weaver_master wm ON wm.weaverid = wp.weaverid
	LEFT JOIN
	sales_billing_nested sbn on sbn.stockid=st.stockid
	LEFT JOIN sales_billing_nested_nongst sbnn on sbnn.stockid=st.stockid
WHERE 
    st.isactive = 1 AND st.companyid = @companyid AND st.date=@date
	group by st.stockid,st.itemid,st.brandid,st.si_code,st.ref_code,st.qty,bm.brand_name
	,itmm.item_name,st.third_party_gst,tpm.party_name,tpm.party_name,st.third_party_nongst,
	st.weavers,wm.weaver_name,st.qty,sbn.qty,sbnn.qty,st.date
	;

    --DECLARE @SQL AS NVARCHAR(MAX)

    ---- Base SELECT statement joining main tables.
    --SET @SQL = N'SELECT st.*, bm.brand_name, itmm.item_name, ' + 
    --           N'CASE ' +
    --           N'    WHEN st.third_party_gst = 1 THEN tpm_gst.party_name ' +
    --           N'    WHEN st.third_party_nongst = 1 THEN tpm_nongst.party_name ' +
    --           N'    WHEN st.weavers = 1 THEN wm.weaver_name ' +
    --           N'    ELSE NULL ' +
    --           N'END AS party_name ' +
    --           N'FROM stock_table st ' +
    --           N'INNER JOIN brand_master bm ON bm.brandid = st.brandid ' +
    --           N'INNER JOIN item_master itmm ON itmm.itemid = st.itemid '

    ---- Add dynamic joins for third_party_gst
    --SET @SQL = @SQL + N'LEFT JOIN third_party_gst_purchase tp ON tp.purchaseid = st.purchaseid AND st.third_party_gst = 1 ' +
    --                   N'LEFT JOIN third_party_master tpm_gst ON tpm_gst.third_partyid = tp.third_partyid '

    ---- Add dynamic joins for third_party_nongst
    --SET @SQL = @SQL + N'LEFT JOIN third_party_purchase tpn ON tpn.purchaseid = st.purchaseid AND st.third_party_nongst = 1 '+
    --                   N'LEFT JOIN third_party_master tpm_nongst ON tpm_nongst.third_partyid = tpn.third_partyid '

    ---- Add dynamic joins for weavers
    --SET @SQL = @SQL + N'LEFT JOIN weavers_purchase wp ON wp.purchaseid = st.purchaseid AND st.weavers = 1 '+
    --                   N'LEFT JOIN weaver_master wm ON wm.weaverid = wp.weaverid '

    ---- Append the WHERE clause with dynamic parameters
    --SET @SQL = @SQL + N'WHERE st.isactive = 1 AND st.companyid = @companyid '

    ---- Optional: Print the SQL for debugging
    ---- PRINT @SQL

    ---- Execute the dynamic SQL
    --EXEC sp_executesql @SQL,
    --                   N'@companyid int',
    --                   @companyid
END;

--EXEC get_stock_table @companyid = 3;
GO
/****** Object:  StoredProcedure [dbo].[get_stock_table_by_refcode]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- get_stock_table_by_refcode 1,'RH0002'
CREATE procedure [dbo].[get_stock_table_by_refcode]
@companyid int,
@ref_code nvarchar(255)
AS
BEGIN
declare @fromdate nvarchar(255);
declare @todate nvarchar(255);
set @fromdate = (select fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
set @todate = (select todate from financial_year where isactive=1 and status=1 and companyid=@companyid);


select stk.stockid,stk.purchaseid,stk.purchase_n_id,stk.si_code,stk.ref_code,stk.brandid,stk.itemid,stk.date,
stk.gst_percentage,stk.hsn_number,stk.price,stk.discount,stk.total,stk.cgst_amount,stk.sgst_amount,
stk.igst_amount,stk.net_total,stk.isactive,stk.activestatus,stk.purchasein,stk.purchasereturn,stk.salesin,
stk.salesreturn,stk.third_party_gst,stk.third_party_nongst,stk.weavers,stk.companyid,
CAST(CAst(stk.qty as float) - (ISNULL(CAST(sbn.qty as float),0)+ ISNULL(CAST(sbnn.qty as float),0) )as nvarchar(255)) as qty

from stock_table stk
left join sales_billing_nested sbn on sbn.stockid=stk.stockid
left join sales_billing_nested_nongst sbnn on sbnn.stockid=stk.stockid
where stk.activestatus=1 and stk.isactive=1 and stk.companyid=@companyid  and (stk.date between @fromdate and @todate)
and stk.ref_code=@ref_code 

END
GO
/****** Object:  StoredProcedure [dbo].[get_stock_table_by_SiCode]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- get_stock_table_by_SiCode 3,'0103'
CREATE procedure [dbo].[get_stock_table_by_SiCode]
@companyid int,
@si_code nvarchar(255)
AS
BEGIN
declare @fromdate nvarchar(255);
declare @todate nvarchar(255);
set @fromdate = (select fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
set @todate = (select todate from financial_year where isactive=1 and status=1 and companyid=@companyid);
--------
WITH GETSALESBILLGST as(
select ISNULL(sum(CAST(ISNULL(qty,0) as float)),0) as sales_gst_qty,stockid from sales_billing_nested
where si_code=@si_code
group by stockid
),
GETSALESBILLNONGST as(
select ISNULL(sum(CAST(ISNULL(qty,0) as float)),0) as sales_gst_qty,stockid from sales_billing_nested_nongst
where si_code=@si_code
group by stockid
),
GETSALESBILLGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billing_returnDebit_nested sbnr
inner join sales_billing_nested sbn on sbn.entry_n_id=sbnr.entry_n_id
where sbnr.si_code=@si_code
group by stockid
),
GETSALESBILLNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billingNongst_returnDebit_nested sbnr
inner join sales_billing_nested_nongst sbn on sbn.entry_n_id=sbnr.entry_n_id
where sbnr.si_code=@si_code
group by stockid
)

------------
select stk.stockid,stk.purchaseid,stk.purchase_n_id,stk.si_code,stk.ref_code,stk.brandid,stk.itemid,stk.date,
gstm.gst_percentage,hsng.hsn_number,stk.price,stk.discount,stk.total,stk.cgst_amount,stk.sgst_amount,
stk.igst_amount,stk.net_total,stk.isactive,stk.activestatus,stk.purchasein,stk.purchasereturn,stk.salesin,
stk.salesreturn,stk.third_party_gst,stk.third_party_nongst,stk.weavers,stk.companyid,
--stk.qty as qt,
--sbn.sales_gst_qty as sb,sbnn.sales_gst_qty as sbnn,
CAST((CAST(stk.qty as float)+ISNULL(sbnr.return_qty,0)+ISNULL(sbnnr.return_qty,0)) -(ISNULL(sbn.sales_gst_qty,0)+ISNULL(sbnn.sales_gst_qty,0))as nvarchar(255)) as qty
from stock_table stk
left join item_master itmm on  itmm.itemid=stk.itemid
left join item_group itmg on itmg.item_groupid=itmm.item_groupid
left join hsn_group hsng on hsng.hsnid=itmg.hsnid
left join gst_master gstm on gstm.gstid=hsng.gstid
left join GETSALESBILLGST sbn on sbn.stockid=stk.stockid
left join GETSALESBILLNONGST sbnn on sbnn.stockid=stk.stockid
left join GETSALESBILLGSTReturn sbnr on sbnr.stockid=stk.stockid
left join GETSALESBILLNONGSTReturn sbnnr on sbnnr.stockid=stk.stockid
where stk.activestatus=1 and stk.isactive=1 and stk.companyid=@companyid  and (stk.date between @fromdate and @todate)
and stk.si_code=@si_code
END
GO
/****** Object:  StoredProcedure [dbo].[get_stock_table_by_thirdparty]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_stock_table_by_thirdparty]
@companyid int,
@third_partyid int
AS
BEGIN
--declare @fromdate nvarchar(255);
--declare @todate nvarchar(255);
--set @fromdate = (select fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
--set @todate = (select todate from financial_year where isactive=1 and status=1 and companyid=@companyid);

IF(@third_partyid>0)
BEGIN
	With GetPartName as (
select st.stockid,
CASE 
    WHEN st.third_party_gst = 1 THEN tpm.party_name
    WHEN st.third_party_nongst = 1 THEN tpmm.party_name -- Use the same alias for both cases
    WHEN st.weavers = 1 THEN wm.weaver_name
END AS party_name
from stock_table st
LEFT JOIN third_party_gst_purchase tp ON tp.purchaseid = st.purchaseid AND st.third_party_gst = 1
LEFT JOIN third_party_master tpm ON tpm.third_partyid = tp.third_partyid
LEFT JOIN third_party_purchase tpn ON tpn.purchaseid = st.purchaseid AND st.third_party_nongst = 1
LEFT JOIN third_party_master tpmm ON tpmm.third_partyid=tpn.third_partyid
LEFT JOIN weavers_purchase wp ON wp.purchaseid = st.purchaseid AND st.weavers = 1
LEFT JOIN weaver_master wm ON wm.weaverid = wp.weaverid
),
GETSALES as (
select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
STRING_AGG(sb.bill_no,'-') as bill_no from 
sales_billing_nested sbn
inner join sales_billing sb on sb.entryid=sbn.entryid
inner join customer_master cm on cm.customerid=sb.customerid
group by sbn.stockid
),
GETSALESNONGST as (
select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
STRING_AGG(sb.bill_no,'-') as bill_no from 
sales_billing_nested_nongst sbn
inner join sales_billing_nongst sb on sb.entryid=sbn.entryid
inner join customer_master cm on cm.customerid=sb.customerid
group by sbn.stockid
),
GETSALESBILLGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billing_returnDebit_nested sbnr
inner join sales_billing_nested sbn on sbn.entry_n_id=sbnr.entry_n_id
group by stockid
),
GETSALESBILLNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billingNongst_returnDebit_nested sbnr
inner join sales_billing_nested_nongst sbn on sbn.entry_n_id=sbnr.entry_n_id
group by stockid
),
GETTHIRDPARTYGSTReturn as(
select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchasegst_debit_nested
group by purchase_n_id,si_code
),
GETTHIRDPARTYNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchaseNongst_debit_nested
group by purchase_n_id,si_code
)
-------------
select stk.stockid,stk.itemid,im.item_name,stk.brandid,bm.brand_name,stk.date,
stk.si_code,stk.ref_code,stk.qty as total_qty,
CASE 
	WHEN stk.third_party_gst = 1 THEN 'THIRD PARTY GST'
	WHEN stk.third_party_nongst = 1 THEN 'THIRD PARTY NON GST'
	WHEN stk.weavers = 1 THEN 'WEAVERS'
END AS p_from,
GPN.party_name,
(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)) as saleqty,
CAST(CAST(ISNULL(GS.saleqty,0)as float)as nvarchar(255)) as sold_qty_gst,
CAST(CAST(ISNULL(GSNG.saleqty,0)as float)as nvarchar(255)) as sold_qty_nogst,
(ISNULL(GS.customer_name,'')+ '-' + ISNULL(GSNG.customer_name,'')) as customer_name,
(ISNULL(GS.bill_no,'')+ ',' + ISNULL(GSNG.bill_no,'')) as bill_no,
CAST((CAST(stk.qty as float)+ISNULL(sbnr.return_qty,0)+ISNULL(sbnnr.return_qty,0))-(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)+ISNULL(tpdr.return_qty,0)+ISNULL(tpdnr.return_qty,0)) as nvarchar(255)) as avail_qty
from stock_table stk
inner join third_party_gst_purchase wep on wep.purchaseid=stk.purchaseid and wep.third_partyid=@third_partyid
inner join brand_master bm on bm.brandid=stk.brandid
inner join item_master im on im.itemid=stk.itemid
left Join  GetPartName GPN on GPN.stockid=stk.stockid
left join GETSALES GS on GS.stockid=stk.stockid
left join GETSALESNONGST GSNG on GSNG.stockid=stk.stockid
left join GETSALESBILLGSTReturn sbnr on sbnr.stockid=stk.stockid
left join GETSALESBILLNONGSTReturn sbnnr on sbnnr.stockid=stk.stockid
left join GETTHIRDPARTYGSTReturn tpdr on tpdr.purchase_n_id=stk.purchase_n_id and tpdr.si_code=stk.si_code
left join GETTHIRDPARTYNONGSTReturn tpdnr on tpdnr.purchase_n_id=stk.purchase_n_id and tpdnr.si_code=stk.si_code
where stk.isactive=1 and stk.companyid=@companyid and stk.third_party_gst=1 --and stk.date between @fromdate and @todate
END

---------------------xxxx--------------------------

else
	BEGIN
		BEGIN
			With GetPartName as (
		select st.stockid,
		CASE 
			WHEN st.third_party_gst = 1 THEN tpm.party_name
			WHEN st.third_party_nongst = 1 THEN tpmm.party_name -- Use the same alias for both cases
			WHEN st.weavers = 1 THEN wm.weaver_name
		END AS party_name
		from stock_table st
		LEFT JOIN third_party_gst_purchase tp ON tp.purchaseid = st.purchaseid AND st.third_party_gst = 1
		LEFT JOIN third_party_master tpm ON tpm.third_partyid = tp.third_partyid
		LEFT JOIN third_party_purchase tpn ON tpn.purchaseid = st.purchaseid AND st.third_party_nongst = 1
		LEFT JOIN third_party_master tpmm ON tpmm.third_partyid=tpn.third_partyid
		LEFT JOIN weavers_purchase wp ON wp.purchaseid = st.purchaseid AND st.weavers = 1
		LEFT JOIN weaver_master wm ON wm.weaverid = wp.weaverid
		),
		GETSALES as (
		select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
		STRING_AGG(sb.bill_no,'-') as bill_no from 
		sales_billing_nested sbn
		inner join sales_billing sb on sb.entryid=sbn.entryid
		inner join customer_master cm on cm.customerid=sb.customerid
		group by sbn.stockid
		),
		GETSALESNONGST as (
		select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
		STRING_AGG(sb.bill_no,'-') as bill_no from 
		sales_billing_nested_nongst sbn
		inner join sales_billing_nongst sb on sb.entryid=sbn.entryid
		inner join customer_master cm on cm.customerid=sb.customerid
		group by sbn.stockid
		),
		GETSALESBILLGSTReturn as(
		select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billing_returnDebit_nested sbnr
		inner join sales_billing_nested sbn on sbn.entry_n_id=sbnr.entry_n_id
		group by stockid
		),
		GETSALESBILLNONGSTReturn as(
		select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billingNongst_returnDebit_nested sbnr
		inner join sales_billing_nested_nongst sbn on sbn.entry_n_id=sbnr.entry_n_id
		group by stockid
		),
		GETTHIRDPARTYGSTReturn as(
		select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchasegst_debit_nested
		group by purchase_n_id,si_code
		),
		GETTHIRDPARTYNONGSTReturn as(
		select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchaseNongst_debit_nested
		group by purchase_n_id,si_code
		)
		-------------
		select stk.stockid,stk.itemid,im.item_name,stk.brandid,bm.brand_name,stk.date,
		stk.si_code,stk.ref_code,stk.qty as total_qty,
		CASE 
			WHEN stk.third_party_gst = 1 THEN 'THIRD PARTY GST'
			WHEN stk.third_party_nongst = 1 THEN 'THIRD PARTY NON GST'
			WHEN stk.weavers = 1 THEN 'WEAVERS'
		END AS p_from,
		GPN.party_name,
		(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)) as saleqty,
		CAST(CAST(ISNULL(GS.saleqty,0)as float)as nvarchar(255)) as sold_qty_gst,
		CAST(CAST(ISNULL(GSNG.saleqty,0)as float)as nvarchar(255)) as sold_qty_nogst,
		(ISNULL(GS.customer_name,'')+ '-' + ISNULL(GSNG.customer_name,'')) as customer_name,
		(ISNULL(GS.bill_no,'')+ ',' + ISNULL(GSNG.bill_no,'')) as bill_no,
		CAST((CAST(stk.qty as float)+ISNULL(sbnr.return_qty,0)+ISNULL(sbnnr.return_qty,0))-(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)+ISNULL(tpdr.return_qty,0)+ISNULL(tpdnr.return_qty,0)) as nvarchar(255)) as avail_qty
		from stock_table stk
		inner join brand_master bm on bm.brandid=stk.brandid
		inner join item_master im on im.itemid=stk.itemid
		left Join  GetPartName GPN on GPN.stockid=stk.stockid
		left join GETSALES GS on GS.stockid=stk.stockid
		left join GETSALESNONGST GSNG on GSNG.stockid=stk.stockid
		left join GETSALESBILLGSTReturn sbnr on sbnr.stockid=stk.stockid
		left join GETSALESBILLNONGSTReturn sbnnr on sbnnr.stockid=stk.stockid
		left join GETTHIRDPARTYGSTReturn tpdr on tpdr.purchase_n_id=stk.purchase_n_id and tpdr.si_code=stk.si_code
		left join GETTHIRDPARTYNONGSTReturn tpdnr on tpdnr.purchase_n_id=stk.purchase_n_id and tpdnr.si_code=stk.si_code
		where stk.isactive=1 and stk.companyid=@companyid and stk.third_party_gst=1 --and stk.date between @fromdate and @todate
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[get_stock_table_by_thirdpartyNonGst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_stock_table_by_thirdpartyNonGst]
@companyid int,
@third_partyid int
AS
BEGIN
--declare @fromdate nvarchar(255);
--declare @todate nvarchar(255);
--set @fromdate = (select fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
--set @todate = (select todate from financial_year where isactive=1 and status=1 and companyid=@companyid);

IF(@third_partyid>0)
BEGIN
	With GetPartName as (
select st.stockid,
CASE 
    WHEN st.third_party_gst = 1 THEN tpm.party_name
    WHEN st.third_party_nongst = 1 THEN tpmm.party_name -- Use the same alias for both cases
    WHEN st.weavers = 1 THEN wm.weaver_name
END AS party_name
from stock_table st
LEFT JOIN third_party_gst_purchase tp ON tp.purchaseid = st.purchaseid AND st.third_party_gst = 1
LEFT JOIN third_party_master tpm ON tpm.third_partyid = tp.third_partyid
LEFT JOIN third_party_purchase tpn ON tpn.purchaseid = st.purchaseid AND st.third_party_nongst = 1
LEFT JOIN third_party_master tpmm ON tpmm.third_partyid=tpn.third_partyid
LEFT JOIN weavers_purchase wp ON wp.purchaseid = st.purchaseid AND st.weavers = 1
LEFT JOIN weaver_master wm ON wm.weaverid = wp.weaverid
),
GETSALES as (
select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
STRING_AGG(sb.bill_no,'-') as bill_no from 
sales_billing_nested sbn
inner join sales_billing sb on sb.entryid=sbn.entryid
inner join customer_master cm on cm.customerid=sb.customerid
group by sbn.stockid
),
GETSALESNONGST as (
select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
STRING_AGG(sb.bill_no,'-') as bill_no from 
sales_billing_nested_nongst sbn
inner join sales_billing_nongst sb on sb.entryid=sbn.entryid
inner join customer_master cm on cm.customerid=sb.customerid
group by sbn.stockid
),
GETSALESBILLGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billing_returnDebit_nested sbnr
inner join sales_billing_nested sbn on sbn.entry_n_id=sbnr.entry_n_id
group by stockid
),
GETSALESBILLNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billingNongst_returnDebit_nested sbnr
inner join sales_billing_nested_nongst sbn on sbn.entry_n_id=sbnr.entry_n_id
group by stockid
),
GETTHIRDPARTYGSTReturn as(
select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchasegst_debit_nested
group by purchase_n_id,si_code
),
GETTHIRDPARTYNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchaseNongst_debit_nested
group by purchase_n_id,si_code
)
-------------
select stk.stockid,stk.itemid,im.item_name,stk.brandid,bm.brand_name,stk.date,
stk.si_code,stk.ref_code,stk.qty as total_qty,
CASE 
	WHEN stk.third_party_gst = 1 THEN 'THIRD PARTY GST'
	WHEN stk.third_party_nongst = 1 THEN 'THIRD PARTY NON GST'
	WHEN stk.weavers = 1 THEN 'WEAVERS'
END AS p_from,
GPN.party_name,
(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)) as saleqty,
CAST(CAST(ISNULL(GS.saleqty,0)as float)as nvarchar(255)) as sold_qty_gst,
CAST(CAST(ISNULL(GSNG.saleqty,0)as float)as nvarchar(255)) as sold_qty_nogst,
(ISNULL(GS.customer_name,'')+ '-' + ISNULL(GSNG.customer_name,'')) as customer_name,
(ISNULL(GS.bill_no,'')+ ',' + ISNULL(GSNG.bill_no,'')) as bill_no,
CAST((CAST(stk.qty as float)+ISNULL(sbnr.return_qty,0)+ISNULL(sbnnr.return_qty,0))-(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)+ISNULL(tpdr.return_qty,0)+ISNULL(tpdnr.return_qty,0)) as nvarchar(255)) as avail_qty
from stock_table stk
inner join third_party_purchase wep on wep.purchaseid=stk.purchaseid and wep.third_partyid=@third_partyid
inner join brand_master bm on bm.brandid=stk.brandid
inner join item_master im on im.itemid=stk.itemid
left Join  GetPartName GPN on GPN.stockid=stk.stockid
left join GETSALES GS on GS.stockid=stk.stockid
left join GETSALESNONGST GSNG on GSNG.stockid=stk.stockid
left join GETSALESBILLGSTReturn sbnr on sbnr.stockid=stk.stockid
left join GETSALESBILLNONGSTReturn sbnnr on sbnnr.stockid=stk.stockid
left join GETTHIRDPARTYGSTReturn tpdr on tpdr.purchase_n_id=stk.purchase_n_id and tpdr.si_code=stk.si_code
left join GETTHIRDPARTYNONGSTReturn tpdnr on tpdnr.purchase_n_id=stk.purchase_n_id and tpdnr.si_code=stk.si_code
where stk.isactive=1 and stk.companyid=@companyid and stk.third_party_nongst=1 --and stk.date between @fromdate and @todate
END

---------------------xxxx--------------------------

else
	BEGIN
		BEGIN
			With GetPartName as (
		select st.stockid,
		CASE 
			WHEN st.third_party_gst = 1 THEN tpm.party_name
			WHEN st.third_party_nongst = 1 THEN tpmm.party_name -- Use the same alias for both cases
			WHEN st.weavers = 1 THEN wm.weaver_name
		END AS party_name
		from stock_table st
		LEFT JOIN third_party_gst_purchase tp ON tp.purchaseid = st.purchaseid AND st.third_party_gst = 1
		LEFT JOIN third_party_master tpm ON tpm.third_partyid = tp.third_partyid
		LEFT JOIN third_party_purchase tpn ON tpn.purchaseid = st.purchaseid AND st.third_party_nongst = 1
		LEFT JOIN third_party_master tpmm ON tpmm.third_partyid=tpn.third_partyid
		LEFT JOIN weavers_purchase wp ON wp.purchaseid = st.purchaseid AND st.weavers = 1
		LEFT JOIN weaver_master wm ON wm.weaverid = wp.weaverid
		),
		GETSALES as (
		select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
		STRING_AGG(sb.bill_no,'-') as bill_no from 
		sales_billing_nested sbn
		inner join sales_billing sb on sb.entryid=sbn.entryid
		inner join customer_master cm on cm.customerid=sb.customerid
		group by sbn.stockid
		),
		GETSALESNONGST as (
		select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
		STRING_AGG(sb.bill_no,'-') as bill_no from 
		sales_billing_nested_nongst sbn
		inner join sales_billing_nongst sb on sb.entryid=sbn.entryid
		inner join customer_master cm on cm.customerid=sb.customerid
		group by sbn.stockid
		),
		GETSALESBILLGSTReturn as(
		select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billing_returnDebit_nested sbnr
		inner join sales_billing_nested sbn on sbn.entry_n_id=sbnr.entry_n_id
		group by stockid
		),
		GETSALESBILLNONGSTReturn as(
		select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billingNongst_returnDebit_nested sbnr
		inner join sales_billing_nested_nongst sbn on sbn.entry_n_id=sbnr.entry_n_id
		group by stockid
		),
		GETTHIRDPARTYGSTReturn as(
		select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchasegst_debit_nested
		group by purchase_n_id,si_code
		),
		GETTHIRDPARTYNONGSTReturn as(
		select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchaseNongst_debit_nested
		group by purchase_n_id,si_code
		)
		-------------
		select stk.stockid,stk.itemid,im.item_name,stk.brandid,bm.brand_name,stk.date,
		stk.si_code,stk.ref_code,stk.qty as total_qty,
		CASE 
			WHEN stk.third_party_gst = 1 THEN 'THIRD PARTY GST'
			WHEN stk.third_party_nongst = 1 THEN 'THIRD PARTY NON GST'
			WHEN stk.weavers = 1 THEN 'WEAVERS'
		END AS p_from,
		GPN.party_name,
		(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)) as saleqty,
		CAST(CAST(ISNULL(GS.saleqty,0)as float)as nvarchar(255)) as sold_qty_gst,
		CAST(CAST(ISNULL(GSNG.saleqty,0)as float)as nvarchar(255)) as sold_qty_nogst,
		(ISNULL(GS.customer_name,'')+ '-' + ISNULL(GSNG.customer_name,'')) as customer_name,
		(ISNULL(GS.bill_no,'')+ ',' + ISNULL(GSNG.bill_no,'')) as bill_no,
		CAST((CAST(stk.qty as float)+ISNULL(sbnr.return_qty,0)+ISNULL(sbnnr.return_qty,0))-(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)+ISNULL(tpdr.return_qty,0)+ISNULL(tpdnr.return_qty,0)) as nvarchar(255)) as avail_qty
		from stock_table stk
		inner join brand_master bm on bm.brandid=stk.brandid
		inner join item_master im on im.itemid=stk.itemid
		left Join  GetPartName GPN on GPN.stockid=stk.stockid
		left join GETSALES GS on GS.stockid=stk.stockid
		left join GETSALESNONGST GSNG on GSNG.stockid=stk.stockid
		left join GETSALESBILLGSTReturn sbnr on sbnr.stockid=stk.stockid
		left join GETSALESBILLNONGSTReturn sbnnr on sbnnr.stockid=stk.stockid
		left join GETTHIRDPARTYGSTReturn tpdr on tpdr.purchase_n_id=stk.purchase_n_id and tpdr.si_code=stk.si_code
		left join GETTHIRDPARTYNONGSTReturn tpdnr on tpdnr.purchase_n_id=stk.purchase_n_id and tpdnr.si_code=stk.si_code
		where stk.isactive=1 and stk.companyid=@companyid and stk.third_party_nongst=1 --and stk.date between @fromdate and @todate
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[get_stock_table_by_weavers]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_stock_table_by_weavers]
@companyid int,
@weaverid int
AS
BEGIN
--declare @fromdate nvarchar(255);
--declare @todate nvarchar(255);
--set @fromdate = (select fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
--set @todate = (select todate from financial_year where isactive=1 and status=1 and companyid=@companyid);

IF(@weaverid>0)
BEGIN
	With GetPartName as (
select st.stockid,
CASE 
    WHEN st.third_party_gst = 1 THEN tpm.party_name
    WHEN st.third_party_nongst = 1 THEN tpmm.party_name -- Use the same alias for both cases
    WHEN st.weavers = 1 THEN wm.weaver_name
END AS party_name
from stock_table st
LEFT JOIN third_party_gst_purchase tp ON tp.purchaseid = st.purchaseid AND st.third_party_gst = 1
LEFT JOIN third_party_master tpm ON tpm.third_partyid = tp.third_partyid
LEFT JOIN third_party_purchase tpn ON tpn.purchaseid = st.purchaseid AND st.third_party_nongst = 1
LEFT JOIN third_party_master tpmm ON tpmm.third_partyid=tpn.third_partyid
LEFT JOIN weavers_purchase wp ON wp.purchaseid = st.purchaseid AND st.weavers = 1
LEFT JOIN weaver_master wm ON wm.weaverid = wp.weaverid
),
GETSALES as (
select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
STRING_AGG(sb.bill_no,'-') as bill_no from 
sales_billing_nested sbn
inner join sales_billing sb on sb.entryid=sbn.entryid
inner join customer_master cm on cm.customerid=sb.customerid
group by sbn.stockid
),
GETSALESNONGST as (
select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
STRING_AGG(sb.bill_no,'-') as bill_no from 
sales_billing_nested_nongst sbn
inner join sales_billing_nongst sb on sb.entryid=sbn.entryid
inner join customer_master cm on cm.customerid=sb.customerid
group by sbn.stockid
),
GETSALESBILLGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billing_returnDebit_nested sbnr
inner join sales_billing_nested sbn on sbn.entry_n_id=sbnr.entry_n_id
group by stockid
),
GETSALESBILLNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billingNongst_returnDebit_nested sbnr
inner join sales_billing_nested_nongst sbn on sbn.entry_n_id=sbnr.entry_n_id
group by stockid
),
GETTHIRDPARTYGSTReturn as(
select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchasegst_debit_nested
group by purchase_n_id,si_code
),
GETTHIRDPARTYNONGSTReturn as(
select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchaseNongst_debit_nested
group by purchase_n_id,si_code
)
-------------
select stk.stockid,stk.itemid,im.item_name,stk.brandid,bm.brand_name,stk.date,
stk.si_code,stk.ref_code,stk.qty as total_qty,
CASE 
	WHEN stk.third_party_gst = 1 THEN 'THIRD PARTY GST'
	WHEN stk.third_party_nongst = 1 THEN 'THIRD PARTY NON GST'
	WHEN stk.weavers = 1 THEN 'WEAVERS'
END AS p_from,
GPN.party_name,
(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)) as saleqty,
CAST(CAST(ISNULL(GS.saleqty,0)as float)as nvarchar(255)) as sold_qty_gst,
CAST(CAST(ISNULL(GSNG.saleqty,0)as float)as nvarchar(255)) as sold_qty_nogst,
(ISNULL(GS.customer_name,'')+ '-' + ISNULL(GSNG.customer_name,'')) as customer_name,
(ISNULL(GS.bill_no,'')+ ',' + ISNULL(GSNG.bill_no,'')) as bill_no,
CAST((CAST(stk.qty as float)+ISNULL(sbnr.return_qty,0)+ISNULL(sbnnr.return_qty,0))-(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)+ISNULL(tpdr.return_qty,0)+ISNULL(tpdnr.return_qty,0)) as nvarchar(255)) as avail_qty
from stock_table stk
inner join weavers_purchase wep on wep.purchaseid=stk.purchaseid and wep.weaverid=@weaverid
inner join brand_master bm on bm.brandid=stk.brandid
inner join item_master im on im.itemid=stk.itemid
left Join  GetPartName GPN on GPN.stockid=stk.stockid
left join GETSALES GS on GS.stockid=stk.stockid
left join GETSALESNONGST GSNG on GSNG.stockid=stk.stockid
left join GETSALESBILLGSTReturn sbnr on sbnr.stockid=stk.stockid
left join GETSALESBILLNONGSTReturn sbnnr on sbnnr.stockid=stk.stockid
left join GETTHIRDPARTYGSTReturn tpdr on tpdr.purchase_n_id=stk.purchase_n_id and tpdr.si_code=stk.si_code
left join GETTHIRDPARTYNONGSTReturn tpdnr on tpdnr.purchase_n_id=stk.purchase_n_id and tpdnr.si_code=stk.si_code
where stk.isactive=1 and stk.companyid=@companyid and stk.weavers=1 --and stk.date between @fromdate and @todate
END

---------------------xxxx--------------------------

else
	BEGIN
		BEGIN
			With GetPartName as (
		select st.stockid,
		CASE 
			WHEN st.third_party_gst = 1 THEN tpm.party_name
			WHEN st.third_party_nongst = 1 THEN tpmm.party_name -- Use the same alias for both cases
			WHEN st.weavers = 1 THEN wm.weaver_name
		END AS party_name
		from stock_table st
		LEFT JOIN third_party_gst_purchase tp ON tp.purchaseid = st.purchaseid AND st.third_party_gst = 1
		LEFT JOIN third_party_master tpm ON tpm.third_partyid = tp.third_partyid
		LEFT JOIN third_party_purchase tpn ON tpn.purchaseid = st.purchaseid AND st.third_party_nongst = 1
		LEFT JOIN third_party_master tpmm ON tpmm.third_partyid=tpn.third_partyid
		LEFT JOIN weavers_purchase wp ON wp.purchaseid = st.purchaseid AND st.weavers = 1
		LEFT JOIN weaver_master wm ON wm.weaverid = wp.weaverid
		),
		GETSALES as (
		select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
		STRING_AGG(sb.bill_no,'-') as bill_no from 
		sales_billing_nested sbn
		inner join sales_billing sb on sb.entryid=sbn.entryid
		inner join customer_master cm on cm.customerid=sb.customerid
		group by sbn.stockid
		),
		GETSALESNONGST as (
		select sum(CAST(ISNULL(sbn.qty,0)as float)) as saleqty,sbn.stockid,STRING_AGG(cm.customer_name,'-') as customer_name,
		STRING_AGG(sb.bill_no,'-') as bill_no from 
		sales_billing_nested_nongst sbn
		inner join sales_billing_nongst sb on sb.entryid=sbn.entryid
		inner join customer_master cm on cm.customerid=sb.customerid
		group by sbn.stockid
		),
		GETSALESBILLGSTReturn as(
		select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billing_returnDebit_nested sbnr
		inner join sales_billing_nested sbn on sbn.entry_n_id=sbnr.entry_n_id
		group by stockid
		),
		GETSALESBILLNONGSTReturn as(
		select ISNULL(sum(CAST(ISNULL(sbnr.return_qty,0) as float)),0) as return_qty,sbn.stockid from sales_billingNongst_returnDebit_nested sbnr
		inner join sales_billing_nested_nongst sbn on sbn.entry_n_id=sbnr.entry_n_id
		group by stockid
		),
		GETTHIRDPARTYGSTReturn as(
		select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchasegst_debit_nested
		group by purchase_n_id,si_code
		),
		GETTHIRDPARTYNONGSTReturn as(
		select ISNULL(sum(CAST(ISNULL(return_qty,0) as float)),0) as return_qty,purchase_n_id,si_code from third_partyPurchaseNongst_debit_nested
		group by purchase_n_id,si_code
		)
		-------------
		select stk.stockid,stk.itemid,im.item_name,stk.brandid,bm.brand_name,stk.date,
		stk.si_code,stk.ref_code,stk.qty as total_qty,
		CASE 
			WHEN stk.third_party_gst = 1 THEN 'THIRD PARTY GST'
			WHEN stk.third_party_nongst = 1 THEN 'THIRD PARTY NON GST'
			WHEN stk.weavers = 1 THEN 'WEAVERS'
		END AS p_from,
		GPN.party_name,
		(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)) as saleqty,
		CAST(CAST(ISNULL(GS.saleqty,0)as float)as nvarchar(255)) as sold_qty_gst,
		CAST(CAST(ISNULL(GSNG.saleqty,0)as float)as nvarchar(255)) as sold_qty_nogst,
		(ISNULL(GS.customer_name,'')+ '-' + ISNULL(GSNG.customer_name,'')) as customer_name,
		(ISNULL(GS.bill_no,'')+ ',' + ISNULL(GSNG.bill_no,'')) as bill_no,
		CAST((CAST(stk.qty as float)+ISNULL(sbnr.return_qty,0)+ISNULL(sbnnr.return_qty,0))-(ISNULL(GS.saleqty,0) + ISNULL(GSNG.saleqty,0)+ISNULL(tpdr.return_qty,0)+ISNULL(tpdnr.return_qty,0)) as nvarchar(255)) as avail_qty
		from stock_table stk
		inner join brand_master bm on bm.brandid=stk.brandid
		inner join item_master im on im.itemid=stk.itemid
		left Join  GetPartName GPN on GPN.stockid=stk.stockid
		left join GETSALES GS on GS.stockid=stk.stockid
		left join GETSALESNONGST GSNG on GSNG.stockid=stk.stockid
		left join GETSALESBILLGSTReturn sbnr on sbnr.stockid=stk.stockid
		left join GETSALESBILLNONGSTReturn sbnnr on sbnnr.stockid=stk.stockid
		left join GETTHIRDPARTYGSTReturn tpdr on tpdr.purchase_n_id=stk.purchase_n_id and tpdr.si_code=stk.si_code
		left join GETTHIRDPARTYNONGSTReturn tpdnr on tpdnr.purchase_n_id=stk.purchase_n_id and tpdnr.si_code=stk.si_code
		where stk.isactive=1 and stk.companyid=@companyid and stk.weavers=1 --and stk.date between @fromdate and @todate
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[get_supplier_advance]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_supplier_advance] 20
CREATE procedure [dbo].[get_supplier_advance]
@supplierid int
AS
BEGIN
WITH get_AdvancePayment as (
select sp.advanceid,ISNULL(sum(CAST(ISNULL(spn.deduction_amount,0.00) as decimal(10,2))),0.00) as payment from supplier_payment sp
inner join supplier_payment_nested spn on spn.paymentid=sp.paymentid
where sp.advanceid>0 and sp.amount_mode='Deduct from Advance'
group by sp.advanceid
)
	select sd.*,
	cast(CAST(advance_amount as decimal(10,2))-ISNULL(getd.payment,0.00) as nvarchar(255)) as aval_addvance 
	from supplier_advance sd
	left join get_AdvancePayment getd on getd.advanceid=sd.advanceid
	where sd.supplierid=@supplierid and CAST(sd.advance_amount as decimal(10,2)) >ISNULL(getd.payment,0.00)
END
GO
/****** Object:  StoredProcedure [dbo].[Get_supplier_debit_note]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_supplier_debit_note]
@companyid int,
@return_date nvarchar(255)
AS 
BEGIN
	IF(@return_date = 'All')
		BEGIN
			SELECT sdn.*,sm.supplier_name,sm.mobile_no,sm.state,sm.address,sm.state_code,sm.shipping_address,
				CAST(sum(CAST(sdnn.net_total as float)) as nvarchar(255)) as net_total,
				CAST(sum(cast(sdnn.return_total as float)) as nvarchar(255)) as return_totaln,
				sm.gst_in as smgst_in,
				STRING_AGG(itm.item_name,'-') as item_name,
				STRING_AGG(bm.brand_name,'-') as brand_name,
				CAST(sum(cast(sdnn.return_cgst_amount as float)) as nvarchar(255)) as return_cgst_amount,
				CAST(sum(cast(sdnn.return_igst_amount as float)) as nvarchar(255)) as return_igst_amount,
				CAST(sum(cast(sdnn.return_sgst_amount as float)) as nvarchar(255)) as return_sgst_amount,
				CAST(sum(CAST(sdnn.return_qty as float)) as nvarchar(255)) as return_qty

				 from supplier_debit_note sdn 
				inner join supplier_master sm on sm.supplierid=sdn.supplierid
				inner join supplier_debit_note_nested sdnn on sdnn.s_debitid=sdn.s_debitid
				inner join item_master itm on itm.itemid=sdnn.itemid
				inner join brand_master bm on itm.brandid=bm.brandid
				where sdn.companyid=@companyid

				group by sdn.s_debitid,sdn.purchaseid,sdn.supplierid,sdn.supplier_bill_no,sdn.date,sdn.return_no,sdn.return_date,sdn.gst_in,sdn.total,
				sdn.return_total,sdn.isactive,sdn.companyid,sdn.cuid,sdn.cdate,sdn.muid,sdn.mdate,sm.supplier_name,sm.mobile_no,sm.state,sm.address,sm.state_code,
				sm.shipping_address,sm.gst_in

				order by sdn.s_debitid desc
		END
	ELSE
		BEGIN
		SELECT sdn.*,sm.supplier_name,sm.mobile_no,sm.state,sm.address,sm.state_code,sm.shipping_address,
			CAST(sum(CAST(sdnn.net_total as float)) as nvarchar(255)) as net_total,
			CAST(sum(cast(sdnn.return_total as float)) as nvarchar(255)) as return_totaln,
			sm.gst_in as smgst_in,
			STRING_AGG(itm.item_name,'-') as item_name,
			STRING_AGG(bm.brand_name,'-') as brand_name,
			CAST(sum(cast(sdnn.return_cgst_amount as float)) as nvarchar(255)) as return_cgst_amount,
			CAST(sum(cast(sdnn.return_igst_amount as float)) as nvarchar(255)) as return_igst_amount,
			CAST(sum(cast(sdnn.return_sgst_amount as float)) as nvarchar(255)) as return_sgst_amount,
			CAST(sum(CAST(sdnn.return_qty as float)) as nvarchar(255)) as return_qty

			 from supplier_debit_note sdn 
			inner join supplier_master sm on sm.supplierid=sdn.supplierid
			inner join supplier_debit_note_nested sdnn on sdnn.s_debitid=sdn.s_debitid
			inner join item_master itm on itm.itemid=sdnn.itemid
			inner join brand_master bm on itm.brandid=bm.brandid
			where sdn.companyid=@companyid AND sdn.return_date=@return_date

			group by sdn.s_debitid,sdn.purchaseid,sdn.supplierid,sdn.supplier_bill_no,sdn.date,sdn.return_no,sdn.return_date,sdn.gst_in,sdn.total,
			sdn.return_total,sdn.isactive,sdn.companyid,sdn.cuid,sdn.cdate,sdn.muid,sdn.mdate,sm.supplier_name,sm.mobile_no,sm.state,sm.address,sm.state_code,
			sm.shipping_address,sm.gst_in
			order by sdn.s_debitid desc
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_supplier_debit_note_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_supplier_debit_note_nested]
@s_debitid int
as
BEGIN
	select sdnn.*,sdn.supplier_bill_no,itmm.item_name from supplier_debit_note_nested sdnn
	inner join supplier_debit_note sdn on sdn.s_debitid=sdnn.s_debitid
	inner join item_master itmm on itmm.itemid=sdnn.itemid
	
	where sdnn.s_debitid=@s_debitid
END
GO
/****** Object:  StoredProcedure [dbo].[get_supplier_legger]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_supplier_legger] 14,'2024-01-01','2025-03-31'

CREATE PROCEDURE [dbo].[get_supplier_legger]
@supplierid INT,
@fromdate NVARCHAR(255),
@todate NVARCHAR(255)
AS
BEGIN
    WITH getpurchasenested AS (
        SELECT purchaseid, SUM(CAST(ISNULL(net_total, 0) AS DECIMAL(10,2))) AS total 
        FROM raw_material_purchase_nested
        GROUP BY purchaseid
    ),
    getreturnnested AS (
        SELECT s_debitid, SUM(CAST(ISNULL(return_net_total, 0) AS DECIMAL(10,2))) AS ret_total 
        FROM supplier_debit_note_nested
        GROUP BY s_debitid
    ),
    get_payment AS (
        SELECT paymentid, SUM(ISNULL(CAST(NULLIF(deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment 
        FROM supplier_payment_nested       
        GROUP BY paymentid
    ),
	getsupplierpayment as (
		select sp.supplierid,SUM(ISNULL(CAST(NULLIF(spn.deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment from supplier_payment sp
		inner join supplier_payment_nested spn on spn.paymentid=sp.paymentid and spn.isbal=1	
		WHERE TRY_CONVERT(DATE, sp.date, 23) BETWEEN @fromdate AND @todate
		group by sp.supplierid
	)
----------------------------------------------
    SELECT 
        sb.date,
        sb.bill_no,
        sbn.total AS debit,
        0.00 AS credit,
        'Purchase Bill No ' AS descrip_tion,
        3 AS sort_order
    FROM raw_material_purchase sb
    LEFT JOIN getpurchasenested sbn ON sbn.purchaseid = sb.purchaseid
    WHERE sb.supplierid = @supplierid AND TRY_CONVERT(DATE, sb.date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        sbr.return_date AS date,
        sbr.return_no AS bill_no,
        0.00 AS debit,
        sbrn.ret_total AS credit,
        'Return No' AS descrip_tion,
        4 AS sort_order
    FROM supplier_debit_note sbr
    LEFT JOIN getreturnnested sbrn ON sbrn.s_debitid = sbr.s_debitid
    WHERE sbr.supplierid = @supplierid AND TRY_CONVERT(DATE, sbr.return_date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        cp.date,
        '' AS bill_no,
        0.00 AS debit,
        cpn.payment AS credit,
        'Payment Paid' AS descrip_tion,
        5 AS sort_order
    FROM supplier_payment cp
    LEFT JOIN get_payment cpn ON cpn.paymentid = cp.paymentid
    WHERE cp.supplierid = @supplierid AND TRY_CONVERT(DATE, cp.date, 23) BETWEEN @fromdate AND @todate and cp.advanceid<1 and cp.amount_mode!='Deduct from Advance'

    UNION ALL

    SELECT 
        '' AS date,
        '' AS bill_no,
       CAST(CAST(sm.balance AS FLOAT) AS DECIMAL(10,2)) + ISNULL(sp.payment,0.00) AS debit,
	    0.00 as credit,	
        'Opening Balance' AS descrip_tion,
        1 AS sort_order
    FROM supplier_master sm
	left join getsupplierpayment sp on sp.supplierid=sm.supplierid
    WHERE sm.supplierid = @supplierid


	UNION All 

	select date,
	 '' AS bill_no,
	 0.00 as debit,
	 advance_amount as credit,
	 'Advance' AS descrip_tion,
	 2 as sort_order
	 from supplier_advance
	 where supplierid=@supplierid AND TRY_CONVERT(DATE,date, 23) BETWEEN @fromdate AND @todate

    ORDER BY
	date,
        sort_order        
END
GO
/****** Object:  StoredProcedure [dbo].[get_supplier_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- get_supplier_master 3
CREATE PROCEDURE [dbo].[get_supplier_master]
@companyid int
AS
BEGIN
    WITH supplier_payment_agg AS(
	select sp.supplierid,SUM(ISNULL(CAST(NULLIF(spn.deduction_amount,'') AS decimal(10,2)), 0)) AS total_deduction_amount from supplier_payment sp
	left join supplier_payment_nested spn on spn.paymentid=sp.paymentid
         where sp.advanceid<1 and sp.amount_mode!='Deduct from Advance' and isbill=1
        GROUP BY sp.supplierid),
		---------------------------------------
		getAdBalDeAmpunt as (
	select sp.supplierid,SUM(ISNULL(CAST(NULLIF(spn.deduction_amount,'') AS decimal(10,2)), 0)) AS total_deduction_amount from supplier_payment sp
	left join supplier_payment_nested spn on spn.paymentid=sp.paymentid
         where sp.advanceid>0 and sp.amount_mode='Deduct from Advance' and isbal=1
        GROUP BY sp.supplierid
		),------------------------------
	GETPURCHASEAMOUNT AS (
	select rm.supplierid,sum(cast(ISNULL(rmn.net_total,0) as decimal(10,2))) as nettot from raw_material_purchase rm
	inner join raw_material_purchase_nested rmn on rmn.purchaseid=rm.purchaseid
	group by rm.supplierid
	),
	ReturnrawMatPurchase AS (
		select sd.supplierid,SUM(CAST(ISNULL(sdn.return_net_total,0) as decimal(10,2))) as retot from supplier_debit_note sd
		left join supplier_debit_note_nested sdn on sdn.s_debitid=sd.s_debitid
		group by sd.supplierid
		),

		getAdvance as (
		select supplierid, ISNULL(sum(cast(ISNULL(advance_amount,0.00) as decimal(10,2))),0.00) as advance from supplier_advance
		group by supplierid
		)
	-------------------------------------------------------------------------------------------------
SELECT sm.supplierid,sm.supplier_name,sm.mobile_no,sm.state,sm.state_code,sm.gst_in,sm.address,sm.shipping_address,sm.companyid,sm.isactive,
sm.balance,
CAST(CAST(CAST(sm.balance AS decimal(10,2)) + sum(ISNULL(aadbal.total_deduction_amount,0.00)) + SUM(ISNULL(CAST(rmp.nettot AS decimal(10,2)), 0)) - (sum(ISNULL(ad.advance,0.00)) +sum(ISNULL(spa.total_deduction_amount, 0))+(sum(ISNULL(RET.retot,0))))as decimal(10,2)) AS nvarchar(255)) AS c_balance
    FROM supplier_master sm
    LEFT JOIN GETPURCHASEAMOUNT rmp ON rmp.supplierid = sm.supplierid
    LEFT JOIN supplier_payment_agg spa ON spa.supplierid = sm.supplierid
	left join ReturnrawMatPurchase ret on ret.supplierid=sm.supplierid
	left join getAdvance ad on ad.supplierid=sm.supplierid
	left join getAdBalDeAmpunt aadbal on aadbal.supplierid=sm.supplierid
    WHERE sm.isactive = 1 AND sm.companyid = @companyid       
    GROUP BY 
        sm.supplierid,
        sm.supplier_name,
        sm.mobile_no,		
        sm.state,
        sm.state_code,
        sm.gst_in,
        sm.balance,		
        sm.address,
        sm.shipping_address,
        sm.companyid,
        sm.isactive
END
GO
/****** Object:  StoredProcedure [dbo].[get_supplier_payment]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_supplier_payment]
@companyid int,
@supplierid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN
	IF(@supplierid>0)
		BEGIN			
			SELECT sp.*, sm.supplier_name,
			CAST(sum(ISNUll(TRY_CAST(NULLIF(spn.deduction_amount, '0') AS decimal(10,2)),0)) as nvarchar(255)) AS deduction_amount
			FROM supplier_payment sp
			INNER JOIN supplier_payment_nested spn ON spn.paymentid = sp.paymentid
			INNER JOIN supplier_master sm ON sm.supplierid = sp.supplierid
			where sp.companyid=@companyid and sp.date between @fromdate and @todate and sp.supplierid=@supplierid
			group by sp.paymentid,sp.supplierid,sp.date,sp.balance,sp.amount_mode,sp.payment_type,sp.cheque_no,sp.c_date,
			sp.advanceid,sp.adnp_amount,
			sp.c_amount,sp.companyid,sp.isactive,
			sp.cuid,sp.cdate,sp.muid,sp.mdate,sm.supplier_name
		END
		-------------xxxxxxxxx---------------
	ELSE
		BEGIN
			SELECT sp.*, sm.supplier_name,
			CAST(sum(ISNUll(TRY_CAST(NULLIF(spn.deduction_amount, '0') AS decimal(10,2)),0)) as nvarchar(255)) AS deduction_amount
			FROM supplier_payment sp
			INNER JOIN supplier_payment_nested spn ON spn.paymentid = sp.paymentid
			INNER JOIN supplier_master sm ON sm.supplierid = sp.supplierid
			where sp.companyid=@companyid and sp.date between @fromdate and @todate
			group by sp.paymentid,sp.supplierid,sp.date,sp.balance,sp.amount_mode,sp.payment_type,sp.cheque_no,sp.c_date,
			sp.advanceid,sp.adnp_amount,
			sp.c_amount,sp.companyid,sp.isactive,
			sp.cuid,sp.cdate,sp.muid,sp.mdate,sm.supplier_name
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_supplier_Payment_details]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_supplier_Payment_details] 7
CREATE procedure [dbo].[get_supplier_Payment_details]
@supplierid int
As
Begin
WITH rawMatPurchase AS (    
select purchaseid,SUM(CAST(ISNULL(net_total,0) as decimal(10,2))) as tot from raw_material_purchase_nested
group by purchaseid
),
PAYMENT as (
select purchaseid,supplierid,SUM(CAST(ISNULL(deduction_amount, 0) as float)) as deduction_amount from supplier_payment_nested
group by purchaseid,supplierid
),
ReturnrawMatPurchase AS (
select sd.purchaseid,SUM(CAST(ISNULL(sdn.return_net_total,0) as decimal(10,2))) as retot from supplier_debit_note sd
left join supplier_debit_note_nested sdn on sdn.s_debitid=sd.s_debitid
group by sd.purchaseid
)

---------------------------------------------------------------------------------------------------------------------------------
select 0 as purchaseid,sp.supplierid,'' as date,'Opening Balance' as supplier_bill_no,
'Opening Balance' as bill_no,'0' as c_balance,'0'as credit_days,balance as total,sp.isactive,sp.cuid,sp.companyid,sp.cdate,sp.muid,sp.mdate,
CAST(ISNULL(sp.balance,0) as decimal(10,2)) as tot,0.00 as de,'0.00' as retTot,CAST(ISNULL(sp.balance,0) as decimal(10,2)) as totalcal,
cast(0 as bit) as isbill,
cast(1 as bit) as isbal
from supplier_master sp
where CAST(ISNULL(sp.balance,0) as float)>0 and sp.supplierid=@supplierid

union all ---------------------------------------------------------------------------

select rmp.*,
sbt.tot,
SUM(CAST(ISNULL(supn.deduction_amount, 0) as decimal(10,2))) as de,
CAST(sum(ISNULL(RET.retot,0))as nvarchar(255)) as retTot,
CAST((sbt.tot - (SUM(CAST(ISNULL(supn.deduction_amount, 0) as decimal(10,2)))+sum(ISNULL(RET.retot,0)))) as decimal(10,2)) as totalcal,
cast(1 as bit) as isbill,
cast(0 as bit) as isbal
from raw_material_purchase rmp
INNER JOIN rawMatPurchase sbt ON sbt.purchaseid = rmp.purchaseid
left JOIN ReturnrawMatPurchase RET ON RET.purchaseid=rmp.purchaseid
LEFT join PAYMENT supn on supn.supplierid=rmp.supplierid and supn.purchaseid=rmp.purchaseid

where rmp.supplierid=@supplierid
group by rmp.purchaseid,rmp.supplierid,rmp.date,rmp.supplier_bill_no,rmp.bill_no,rmp.c_balance,rmp.credit_days,rmp.total
,rmp.isactive,rmp.cuid,rmp.companyid,rmp.cdate,rmp.muid,rmp.mdate,sbt.tot
END
GO
/****** Object:  StoredProcedure [dbo].[get_supplierbno_by_supid]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_supplierbno_by_supid]
@companyid int,
@supplierid int
AS
BEGIN
    SELECT  *
    FROM raw_material_purchase
    WHERE supplierid=@supplierid AND companyid =@companyid;
END
GO
/****** Object:  StoredProcedure [dbo].[get_third_party_gst_legger]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[get_third_party_gst_legger]
@third_partyid INT,
@fromdate NVARCHAR(255),
@todate NVARCHAR(255)
AS
BEGIN
    -- Use CTEs for intermediate results
    WITH getthirdpartygstpuechasenested AS (
        SELECT purchaseid, SUM(CAST(ISNULL(net_total, 0) AS DECIMAL(10,2))) AS total 
        FROM third_party_gst_purchase_nested
        GROUP BY purchaseid
    ),
    getreturnnested AS (
        SELECT thirdPartyDebitid, SUM(CAST(ISNULL(return_net_total, 0) AS DECIMAL(10,2))) AS ret_total 
        FROM third_partyPurchasegst_debit_nested
        GROUP BY thirdPartyDebitid
    ),
    get_payment AS (
        SELECT paymentid, SUM(ISNULL(CAST(NULLIF(deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment 
        FROM thirdparty_payment_nested
        WHERE gst = 1 or isbal=1
        GROUP BY paymentid
    ),
	getBalpayment as (
		select sp.third_partyid,SUM(ISNULL(CAST(NULLIF(spn.deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment from thirdparty_payment sp
		inner join thirdparty_payment_nested spn on spn.paymentid=sp.paymentid and spn.isbal=1	
		WHERE TRY_CONVERT(DATE, sp.date, 23) BETWEEN @fromdate AND @todate
		group by sp.third_partyid
	),
	getGSTADAmount as (
	select sp.advanceid,SUM(ISNULL(CAST(NULLIF(spn.deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment from thirdparty_payment sp
		inner join thirdparty_payment_nested spn on spn.paymentid=sp.paymentid and spn.non_gst=1	
		WHERE TRY_CONVERT(DATE, sp.date, 23) BETWEEN @fromdate AND @todate
		group by sp.advanceid
	)
-------------------------------------------
    SELECT 
        sb.date,
        sb.bill_no,
        sbn.total AS debit,
        0.00 AS credit,
        'Purchase Bill No ' AS descrip_tion,
        3 AS sort_order
    FROM third_party_gst_purchase sb
    LEFT JOIN getthirdpartygstpuechasenested sbn ON sbn.purchaseid = sb.purchaseid
    WHERE sb.third_partyid = @third_partyid AND TRY_CONVERT(DATE, sb.date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        sbr.return_date AS date,
        sbr.return_no AS bill_no,
        0.00 AS debit,
        sbrn.ret_total AS credit,
        'Return No' AS descrip_tion,
        4 AS sort_order
    FROM third_partyPurchasegst_debit sbr
    LEFT JOIN getreturnnested sbrn ON sbrn.thirdPartyDebitid = sbr.thirdPartyDebitid
    WHERE sbr.third_partyid = @third_partyid AND TRY_CONVERT(DATE, sbr.return_date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        cp.date,
        '' AS bill_no,
        0.00 AS debit,
        cpn.payment AS credit,
        'Payment Paid' AS descrip_tion,
        5 AS sort_order
    FROM thirdparty_payment cp
    LEFT JOIN get_payment cpn ON cpn.paymentid = cp.paymentid
    WHERE cp.third_partyid = @third_partyid and cp.advanceid<1 and cp.amount_mode!='Deduct from Advance'
        AND TRY_CONVERT(DATE, cp.date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        '' AS date,
        '' AS bill_no,
       Try_CAST(cm.balance AS DECIMAL(10,2)) + ISNULL(CAST(gb.payment AS DECIMAL(10,2)),0.00) AS debit,
        0.00 AS credit,
        'Opening Balance' AS descrip_tion,
        1 AS sort_order
    FROM third_party_master  cm
	left join getBalpayment gb on gb.third_partyid=cm.third_partyid
    WHERE cm.third_partyid = @third_partyid

	UNION All 

	select date,
	 '' AS bill_no,
	 0.00 as debit,
	advance_amount-ISNULL(ggaa.payment,0.00) as credit,
	 'Advance' AS descrip_tion,
	 2 as sort_order
	 from thirdparty_advance ca
	 left join getGSTADAmount ggaa on ggaa.advanceid=ca.advanceid
	 where third_partyid=@third_partyid AND TRY_CONVERT(DATE,date, 23) BETWEEN @fromdate AND @todate

    ORDER BY
	date,
        sort_order
        
END
GO
/****** Object:  StoredProcedure [dbo].[get_third_party_gst_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- get_raw_material_purchase 3,'2024-03-07'
CREATE procedure [dbo].[get_third_party_gst_purchase]
@companyid int,
@date nvarchar(255)
as
BEGIN
	--select tpp.*,tpm.party_name,tpm.short_code,tpm.gst_in,tpm.address,tpm.state_code,tpm.state
	--from third_party_gst_purchase tpp
	--inner join third_party_master tpm on tpm.third_partyid=tpp.third_partyid
	--where tpp.companyid=@companyid and tpp.date=@date

	if(@date='All')
	BEGIN
		WITH GETPURCHASEAMOUNT AS (
	select tp.purchaseid,sum(cast(ISNULL(tpn.net_total,0) as float)) as nettot from third_party_gst_purchase tp
	inner join third_party_gst_purchase_nested tpn on tpn.purchaseid=tp.purchaseid
	group by tp.purchaseid
	)

		select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,
		CAST(SUM(ISNULL(CAST(rmn.nettot AS float), 0))as nvarchar(255)) as total,tp.companyid
		,tpm.party_name,tpm.gst_in,tpm.address,tpm.state,tpm.state_code 
		from third_party_gst_purchase tp
		inner join third_party_master tpm on tpm.third_partyid=tp.third_partyid
		left join GETPURCHASEAMOUNT rmn on rmn.purchaseid=tp.purchaseid
		where tp.companyid=@companyid

		group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.companyid,
		tpm.party_name,tpm.gst_in,tpm.address,tpm.state,tpm.state_code
		order by tp.purchaseid desc
	END

	ELSE
		BEGIN
			WITH GETPURCHASEAMOUNT AS (
	select tp.purchaseid,sum(cast(ISNULL(tpn.net_total,0) as float)) as nettot from third_party_gst_purchase tp
	inner join third_party_gst_purchase_nested tpn on tpn.purchaseid=tp.purchaseid
	group by tp.purchaseid
	)

		select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,
		CAST(SUM(ISNULL(CAST(rmn.nettot AS float), 0))as nvarchar(255)) as total,tp.companyid
		,tpm.party_name,tpm.gst_in,tpm.address,tpm.state,tpm.state_code 
		from third_party_gst_purchase tp
		inner join third_party_master tpm on tpm.third_partyid=tp.third_partyid
		left join GETPURCHASEAMOUNT rmn on rmn.purchaseid=tp.purchaseid
		where tp.companyid=@companyid and tp.date=@date

		group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.companyid,
		tpm.party_name,tpm.gst_in,tpm.address,tpm.state,tpm.state_code
		order by tp.purchaseid desc
		END
END

GO
/****** Object:  StoredProcedure [dbo].[get_third_party_gst_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_third_party_gst_purchase_nested]
@purchaseid int
as
BEGIN
	select tpgpn.*,itmm.item_name from third_party_gst_purchase_nested tpgpn
	inner join item_master itmm on itmm.itemid=tpgpn.itemid
	where tpgpn.purchaseid=@purchaseid
END
GO
/****** Object:  StoredProcedure [dbo].[get_third_party_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_third_party_master] 3

CREATE procedure [dbo].[get_third_party_master]
@companyid int
AS
BEGIN
WITH GET_ThirdParty_PURCHASE_NONGST as (
		select sb.third_partyid,sum(CAST(ISNULL(sbn.total,0)as decimal(10,2))) as total from third_party_purchase sb
		inner join third_party_purchase_nested sbn on sbn.purchaseid=sb.purchaseid
		where sb.companyid=@companyid
		group by sb.third_partyid
		),
		GET_THIRDPARTY_PURCHASE_GST as (
		select sb.third_partyid,sum(CAST(ISNULL(sbn.net_total,0)as decimal(10,2))) as net_total from third_party_gst_purchase sb
		inner join third_party_gst_purchase_nested sbn on sbn.purchaseid=sb.purchaseid
		where sb.companyid=@companyid
		group by sb.third_partyid
		),
		GET_THIRDPARTY_PAYMET as (
		SELECT cp.third_partyid,
       SUM(CAST(ISNULL(NULLIF(TRY_CAST(cpn.deduction_amount AS decimal(10,2)), 0), 0) AS decimal(10,2))) AS deduction_amount
		FROM thirdparty_payment cp
		INNER JOIN thirdparty_payment_nested cpn ON cpn.paymentid = cp.paymentid
		where cp.advanceid<1 and cp.amount_mode!='Deduct from Advance' and cpn.isbal=0
		GROUP BY cp.third_partyid
		),
		GET_ADBALTHIRDPARTY_PAYMET as (
		SELECT cp.third_partyid,
       SUM(CAST(ISNULL(NULLIF(TRY_CAST(cpn.deduction_amount AS decimal(10,2)), 0), 0) AS decimal(10,2))) AS deduction_amount
		FROM thirdparty_payment cp
		INNER JOIN thirdparty_payment_nested cpn ON cpn.paymentid = cp.paymentid
		where cp.advanceid>0 and cp.amount_mode='Deduct from Advance' and cpn.isbal=1
		GROUP BY cp.third_partyid
		),
		----------Return------------------------------
ThirdPartyGstReturnTotals AS (
    SELECT sb.third_partyid,
     SUM(CAST(ISNULL(sbn.return_net_total,0) as decimal(10,2))) as retTot
    FROM third_partyPurchasegst_debit sb
    left JOIN third_partyPurchasegst_debit_nested sbn ON sbn.purchaseid = sb.purchaseid
    WHERE sb.companyid = @companyid
    GROUP BY sb.third_partyid
),
THIRDPARTYNonGstReturnTotals AS (
    SELECT sb.third_partyid,
           SUM(CAST(sbn.return_total as decimal(10,2))) as retTot
    FROM third_partyPurchaseNongst_debit sb
    INNER JOIN third_partyPurchaseNongst_debit_nested sbn ON sbn.purchaseid = sb.purchaseid
    WHERE sb.companyid = @companyid
    GROUP BY sb.third_partyid
),
getAdvance as (
		select third_partyid, ISNULL(sum(cast(ISNULL(advance_amount,0.00) as decimal(10,2))),0.00) as advance from thirdparty_advance
		group by third_partyid
		)
		---------
		select cm.*,
		CAST((
               (ISNULL(TRY_CAST(balance AS DECIMAL(10,2)), 0) 
			   + (ISNULL(getbalad.deduction_amount,0.00))
                + ISNULL(TNGST.total, 0) 
                + ISNULL(TGST.net_total, 0))
               - (ISNULL(TPAY.deduction_amount, 0)
				+ (ISNULL(ad.advance,0.00))
                + ISNULL(RTNGST.retTot, 0) 
                + ISNULL(RTGST.retTot, 0))) AS NVARCHAR(255)) AS c_balance
		--cm.balance,
		--CNGST.total,
		--CGST.net_total,		
		--CPAY.deduction_amount,
		--ad.advance,
		--RCNGST.retTot,
		--RCGST.retTot
		from third_party_master cm
		left join GET_ThirdParty_PURCHASE_NONGST TNGST on TNGST.third_partyid=cm.third_partyid
		left join GET_THIRDPARTY_PURCHASE_GST TGST on TGST.third_partyid=cm.third_partyid
		left join THIRDPARTYNonGstReturnTotals RTNGST on RTNGST.third_partyid=cm.third_partyid
		left join ThirdPartyGstReturnTotals RTGST on RTGST.third_partyid=cm.third_partyid
		LEFT join GET_THIRDPARTY_PAYMET TPAY on TPAY.third_partyid=cm.third_partyid
		left join getAdvance ad on ad.third_partyid=cm.third_partyid
		left join GET_ADBALTHIRDPARTY_PAYMET getbalad on getbalad.third_partyid=cm.third_partyid
		WHERE cm.isactive = 1 AND cm.companyid = @companyid
END
GO
/****** Object:  StoredProcedure [dbo].[get_third_party_nongst_ledger]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[get_third_party_nongst_ledger]
@third_partyid INT,
@fromdate NVARCHAR(255),
@todate NVARCHAR(255)
AS
BEGIN
    -- Use CTEs for intermediate results
    WITH getthirdpartypurchasenested AS (
        SELECT purchaseid, SUM(CAST(ISNULL(total, 0) AS DECIMAL(10,2))) AS total 
        FROM third_party_purchase_nested
        GROUP BY purchaseid
    ),
    getreturnnested AS (
        SELECT thirdPartyDebitid, SUM(CAST(ISNULL(return_total, 0) AS DECIMAL(10,2))) AS ret_total 
        FROM third_partyPurchaseNongst_debit_nested
        GROUP BY thirdPartyDebitid
    ),
    get_payment AS (
        SELECT paymentid, SUM(ISNULL(CAST(NULLIF(deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment 
        FROM thirdparty_payment_nested
        WHERE non_gst = 1 or isbal=1
        GROUP BY paymentid
    ),
	getBalpayment as (
		select sp.third_partyid,SUM(ISNULL(CAST(NULLIF(spn.deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment from thirdparty_payment sp
		inner join thirdparty_payment_nested spn on spn.paymentid=sp.paymentid and spn.isbal=1	
		WHERE TRY_CONVERT(DATE, sp.date, 23) BETWEEN @fromdate AND @todate
		group by sp.third_partyid
	),
	getGSTADAmount as (
	select sp.advanceid,SUM(ISNULL(CAST(NULLIF(spn.deduction_amount, '') AS DECIMAL(10,2)), 0)) AS payment from thirdparty_payment sp
		inner join thirdparty_payment_nested spn on spn.paymentid=sp.paymentid and spn.gst=1	
		WHERE TRY_CONVERT(DATE, sp.date, 23) BETWEEN @fromdate AND @todate
		group by sp.advanceid
	)

    SELECT 
        sb.date,
        sb.bill_no,
        sbn.total AS debit,
        0.00 AS credit,
        'Purchase Bill No ' AS descrip_tion,
        3 AS sort_order
    FROM third_party_purchase sb
    LEFT JOIN getthirdpartypurchasenested sbn ON sbn.purchaseid = sb.purchaseid
    WHERE sb.third_partyid = @third_partyid AND TRY_CONVERT(DATE, sb.date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        sbr.return_date AS date,
        sbr.return_no AS bill_no,
        0.00 AS debit,
        sbrn.ret_total AS credit,
        'Return No' AS descrip_tion,
        4 AS sort_order
    FROM third_partyPurchaseNongst_debit sbr
    LEFT JOIN getreturnnested sbrn ON sbrn.thirdPartyDebitid = sbr.thirdPartyDebitid
    WHERE sbr.third_partyid = @third_partyid AND TRY_CONVERT(DATE, sbr.return_date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        cp.date,
        '' AS bill_no,
        0.00 AS debit,
        cpn.payment AS credit,
        'Payment Paid' AS descrip_tion,
        5 AS sort_order
    FROM thirdparty_payment cp
    LEFT JOIN get_payment cpn ON cpn.paymentid = cp.paymentid
    WHERE cp.third_partyid = @third_partyid and cp.advanceid<1 and cp.amount_mode!='Deduct from Advance'
        AND TRY_CONVERT(DATE, cp.date, 23) BETWEEN @fromdate AND @todate

    UNION ALL

    SELECT 
        '' AS date,
        '' AS bill_no,
        Try_CAST(cm.balance AS DECIMAL(10,2)) + ISNULL(CAST(gb.payment AS DECIMAL(10,2)),0.00) AS debit,
        0.00 AS credit,
        'Opening Balance' AS descrip_tion,
        1 AS sort_order
    FROM third_party_master cm
	left join getBalpayment gb on gb.third_partyid=cm.third_partyid
    WHERE cm.third_partyid = @third_partyid

	UNION All 

	select date,
	 '' AS bill_no,
	 0.00 as debit,
	 advance_amount-ISNULL(ggaa.payment,0.00) as credit,
	 'Advance' AS descrip_tion,
	 2 as sort_order
	 from thirdparty_advance ca
	 left join getGSTADAmount ggaa on ggaa.advanceid=ca.advanceid
	 where third_partyid=@third_partyid AND TRY_CONVERT(DATE,date, 23) BETWEEN @fromdate AND @todate

    ORDER BY
	date,
        sort_order        
END
GO
/****** Object:  StoredProcedure [dbo].[get_third_party_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- get_raw_material_purchase 3,'2024-03-07'
CREATE procedure [dbo].[get_third_party_purchase]
@companyid int,
@date nvarchar(255)
as
BEGIN
	--select tpp.*,tpm.party_name,tpm.short_code,tpm.gst_in,tpm.state,tpm.state_code,
	--tpm.address from third_party_purchase tpp
	--inner join third_party_master tpm on tpm.third_partyid=tpp.third_partyid
	--where tpp.companyid=@companyid and tpp.date=@date


	if(@date='All')
	BEGIN
		WITH GETPURCHASEAMOUNT AS (
	select tp.purchaseid,sum(cast(ISNULL(tpn.total,0) as float)) as nettot from third_party_purchase tp
	inner join third_party_purchase_nested tpn on tpn.purchaseid=tp.purchaseid
	group by tp.purchaseid
	)

		select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,
		CAST(CAST(SUM(ISNULL(CAST(rmn.nettot AS float), 0))as int)as nvarchar(255)) as total,tp.companyid
		,tpm.party_name,tpm.gst_in,tpm.address,tpm.state,tpm.state_code 
		from third_party_purchase tp
		inner join third_party_master tpm on tpm.third_partyid=tp.third_partyid
		left join GETPURCHASEAMOUNT rmn on rmn.purchaseid=tp.purchaseid
		where tp.companyid=@companyid

		group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.companyid,
		tpm.party_name,tpm.gst_in,tpm.address,tpm.state,tpm.state_code
		order by tp.purchaseid desc
	END

	ELSE
		BEGIN
			WITH GETPURCHASEAMOUNT AS (
	select tp.purchaseid,sum(cast(ISNULL(tpn.total,0) as float)) as nettot from third_party_purchase tp
	inner join third_party_purchase_nested tpn on tpn.purchaseid=tp.purchaseid
	group by tp.purchaseid
	)

		select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,
		CAST(CAST(SUM(ISNULL(CAST(rmn.nettot AS float), 0))as int)as nvarchar(255)) as total,tp.companyid
		,tpm.party_name,tpm.gst_in,tpm.address,tpm.state,tpm.state_code 
		from third_party_purchase tp
		inner join third_party_master tpm on tpm.third_partyid=tp.third_partyid
		left join GETPURCHASEAMOUNT rmn on rmn.purchaseid=tp.purchaseid
		where tp.companyid=@companyid and tp.date=@date

		group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.companyid,
		tpm.party_name,tpm.gst_in,tpm.address,tpm.state,tpm.state_code
		order by tp.purchaseid desc
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_third_party_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_third_party_purchase_nested]
@purchaseid int
as
BEGIN
	select tppn.*,itmm.item_name from third_party_purchase_nested tppn
	inner join item_master itmm on itmm.itemid=tppn.itemid
	where tppn.purchaseid=@purchaseid
END
GO
/****** Object:  StoredProcedure [dbo].[Get_third_party_purchase_nestedBy_ref_code]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Get_salesBilling_sbnestedBy_ref_code 3,'KO1'
CREATE PROCEDURE [dbo].[Get_third_party_purchase_nestedBy_ref_code]
    @companyid INT,
    @ref_code NVARCHAR(255)
AS
BEGIN
    SELECT
        sbn.*,
		sb.purchaseid,
        sb.bill_no,
        sb.date as purchase_date,
        sb.third_partyid,
        sb.total as return_total,
		tpm.party_name
    FROM
        third_party_purchase_nested sbn
    INNER JOIN
        third_party_purchase sb ON sbn.purchaseid = sb.purchaseid
		INNER JOIN
		third_party_master tpm ON tpm.third_partyid=sb.third_partyid
    WHERE
        sb.companyid = @companyid
        AND sbn.ref_code = @ref_code;
END
GO
/****** Object:  StoredProcedure [dbo].[Get_third_party_purchase_nestedBy_si_code]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Get_salesBilling_sbnestedBy_si_code 3,'0002'
CREATE PROCEDURE [dbo].[Get_third_party_purchase_nestedBy_si_code]
    @companyid INT,
    @si_code NVARCHAR(255)
AS
BEGIN
    SELECT
       sbn.*,
		sb.purchaseid,
        sb.bill_no,
        sb.date as purchase_date,
        sb.third_partyid,
        sb.total as return_total,
		tpm.party_name
    FROM
        third_party_purchase_nested sbn
    INNER JOIN
        third_party_purchase sb ON sbn.purchaseid = sb.purchaseid
		INNER JOIN
		third_party_master tpm ON tpm.third_partyid=sb.third_partyid
    WHERE
        sb.companyid = @companyid
        AND sbn.si_code = @si_code;
END
GO
/****** Object:  StoredProcedure [dbo].[get_Third_partygst_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_Third_partygst_from_to_date] 3,'2024-06-01','2024-06-17'
CREATE procedure [dbo].[get_Third_partygst_from_to_date]
@companyid int,
@third_partyid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN
		IF(@third_partyid >0)
			BEGIN
				select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,
					  tpm.party_name,
					  STRING_AGG(ISNULL(tpn.si_code,''),',') as si_code,
					  STRING_AGG(ISNULL(tpn.ref_code,''),',') as ref_code,
					  cast(sum(cast(ISNULL(tpn.qty,0)as float))as nvarchar(255)) as qty,
					  cast(CAST(sum(cast(ISNULL(tpn.net_total,0)as float))as int)as nvarchar(255)) as total
					  from third_party_gst_purchase tp
					  inner join third_party_gst_purchase_nested tpn on tp.purchaseid=tpn.purchaseid
					  left join third_party_master tpm on tpm.third_partyid=tp.third_partyid
					   WHERE CAST(tp.date AS DATETIME) >= CAST(@fromdate AS DATETIME) and tp.third_partyid=@third_partyid
					  AND CAST(tp.date AS DATETIME) <= CAST(@todate AS DATETIME) AND tp.companyid=@companyid AND tp.isactive=1
					  group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,tpm.party_name
			END
		ELSE
			BEGIN
				select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,
				  tpm.party_name,
				  STRING_AGG(ISNULL(tpn.si_code,''),',') as si_code,
				  STRING_AGG(ISNULL(tpn.ref_code,''),',') as ref_code,
				  cast(sum(cast(ISNULL(tpn.qty,0)as float))as nvarchar(255)) as qty,
				  cast(CAST(sum(cast(ISNULL(tpn.net_total,0)as float))as int)as nvarchar(255)) as total
				  from third_party_gst_purchase tp
				  inner join third_party_gst_purchase_nested tpn on tp.purchaseid=tpn.purchaseid
				  left join third_party_master tpm on tpm.third_partyid=tp.third_partyid
				   WHERE CAST(tp.date AS DATETIME) >= CAST(@fromdate AS DATETIME)
				  AND CAST(tp.date AS DATETIME) <= CAST(@todate AS DATETIME) AND tp.companyid=@companyid AND tp.isactive=1
				  group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,tpm.party_name
			END
	  
END

GO
/****** Object:  StoredProcedure [dbo].[get_Third_partyNongst_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_Third_partyNongst_from_to_date]
@companyid int,
@third_partyid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN
	IF(@third_partyid>0)
		BEGIN
			select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,
			  tpm.party_name,
			  STRING_AGG(ISNULL(tpn.si_code,''),',') as si_code,
			  STRING_AGG(ISNULL(tpn.ref_code,''),',') as ref_code,
			  cast(sum(cast(ISNULL(tpn.qty,0)as float))as nvarchar(255)) as qty,
			  cast(CAST(sum(cast(ISNULL(tpn.total,0)as float))as int)as nvarchar(255)) as total
			  from third_party_purchase tp
			  inner join third_party_purchase_nested tpn on tp.purchaseid=tpn.purchaseid
			  left join third_party_master tpm on tpm.third_partyid=tp.third_partyid
			   WHERE CAST(tp.date AS DATETIME) >= CAST(@fromdate AS DATETIME) and tp.third_partyid=@third_partyid
			  AND CAST(tp.date AS DATETIME) <= CAST(@todate AS DATETIME) AND tp.companyid=@companyid AND tp.isactive=1
			  group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,tpm.party_name
		END
	ELSE
		BEGIN
			select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,
			  tpm.party_name,
			  STRING_AGG(ISNULL(tpn.si_code,''),',') as si_code,
			  STRING_AGG(ISNULL(tpn.ref_code,''),',') as ref_code,
			  cast(sum(cast(ISNULL(tpn.qty,0)as float))as nvarchar(255)) as qty,
			  cast(CAST(sum(cast(ISNULL(tpn.total,0)as float))as int)as nvarchar(255)) as total
			  from third_party_purchase tp
			  inner join third_party_purchase_nested tpn on tp.purchaseid=tpn.purchaseid
			  left join third_party_master tpm on tpm.third_partyid=tp.third_partyid
			   WHERE CAST(tp.date AS DATETIME) >= CAST(@fromdate AS DATETIME)
			  AND CAST(tp.date AS DATETIME) <= CAST(@todate AS DATETIME) AND tp.companyid=@companyid AND tp.isactive=1
			group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.isactive,tpm.party_name
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_third_partyPurchasegst_debit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_third_partyPurchasegst_debit]
@companyid int,
@return_date nvarchar(255)
as
begin
	IF(@return_date='All')
		BEGIN
			select DISTINCT sbrd.* ,cm.party_name,cm.mobile,cm.state,cm.state_code,
			cm.gst_in,cm.address,
			CAST(sum(CAST(sbrdn.return_cgst_amount as float))as nvarchar(255)) as return_cgst_amount,
			CAST(sum(CAST(sbrdn.return_sgst_amount as float))as nvarchar(255)) as return_sgst_amount,
			CAST(sum(CAST(sbrdn.return_igst_amount as float))as nvarchar(255)) as return_igst_amount,
			CAST(sum(CAST(sbrdn.return_net_total as float))as nvarchar(255)) as return_net_total,
			CAST(sum(CAST(sbrdn.return_qty as float))as nvarchar(255)) as return_qtyn,
			CAST(sum(CAST(sbrdn.return_total as float))as nvarchar(255)) as return_totaln

			from third_partyPurchasegst_debit sbrd
			inner join third_party_master cm on cm.third_partyid=sbrd.third_partyid
			--inner join third_party_gst_purchase sb on sb.third_partyid=sbrd.third_partyid 
			inner join third_partyPurchasegst_debit_nested sbrdn on sbrd.thirdPartyDebitid=sbrdn.thirdPartyDebitid
			where sbrd.companyid=@companyid

			group by sbrd.thirdPartyDebitid,sbrd.purchaseid,sbrd.third_partyid,sbrd.purchase_date,sbrd.invoice_no,sbrd.invoice_date,sbrd.return_no,
			sbrd.return_date,sbrd.total,sbrd.return_total,sbrd.isactive,sbrd.companyid,sbrd.cuid,sbrd.cdate,sbrd.muid,sbrd.mdate,
			cm.party_name,cm.mobile,cm.state,cm.state_code,
			cm.gst_in,cm.address

			order by sbrd.thirdPartyDebitid desc
		END
	ELSE
		BEGIN
			select DISTINCT sbrd.* ,cm.party_name,cm.mobile,cm.state,cm.state_code,
			cm.gst_in,cm.address,
			CAST(sum(CAST(sbrdn.return_cgst_amount as float))as nvarchar(255)) as return_cgst_amount,
			CAST(sum(CAST(sbrdn.return_sgst_amount as float))as nvarchar(255)) as return_sgst_amount,
			CAST(sum(CAST(sbrdn.return_igst_amount as float))as nvarchar(255)) as return_igst_amount,
			CAST(sum(CAST(sbrdn.return_net_total as float))as nvarchar(255)) as return_net_total,
			CAST(sum(CAST(sbrdn.return_qty as float))as nvarchar(255)) as return_qtyn,
			CAST(sum(CAST(sbrdn.return_total as float))as nvarchar(255)) as return_totaln

			from third_partyPurchasegst_debit sbrd
			inner join third_party_master cm on cm.third_partyid=sbrd.third_partyid
			--inner join third_party_gst_purchase sb on sb.third_partyid=sbrd.third_partyid 
			inner join third_partyPurchasegst_debit_nested sbrdn on sbrd.thirdPartyDebitid=sbrdn.thirdPartyDebitid
			where sbrd.companyid=@companyid AND sbrd.return_date=@return_date

			group by sbrd.thirdPartyDebitid,sbrd.purchaseid,sbrd.third_partyid,sbrd.purchase_date,sbrd.invoice_no,sbrd.invoice_date,sbrd.return_no,
			sbrd.return_date,sbrd.total,sbrd.return_total,sbrd.isactive,sbrd.companyid,sbrd.cuid,sbrd.cdate,sbrd.muid,sbrd.mdate,
			cm.party_name,cm.mobile,cm.state,cm.state_code,
			cm.gst_in,cm.address

			order by sbrd.thirdPartyDebitid desc
		END
end
GO
/****** Object:  StoredProcedure [dbo].[get_third_partyPurchasegst_debit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_third_partyPurchasegst_debit_nested]
@thirdPartyDebitid int
as
BEGIN
	select tppgdn.*,itmm.item_name from third_partyPurchasegst_debit_nested tppgdn
	inner join item_master itmm on itmm.itemid=tppgdn.itemid
	where tppgdn.thirdPartyDebitid=@thirdPartyDebitid
END
GO
/****** Object:  StoredProcedure [dbo].[Get_third_partyPurchaseNongst_debit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_third_partyPurchaseNongst_debit]
@companyid int,
@return_date nvarchar(255)
as
begin
	IF(@return_date='All')
		BEGIN
			SELECT DISTINCT
				sbrd.*,
				cm.party_name,
				cm.mobile,
				cm.state,
				cm.state_code,
				cm.gst_in,
				cm.address,
				Cast(sum(CAST(sbrdn.return_qty as float))as nvarchar(255)) AS return_qtyn,
				Cast(sum(CAST(sbrdn.return_total as float))as nvarchar(255)) AS return_totaln
			FROM 
				third_partyPurchaseNongst_debit sbrd
				INNER JOIN third_party_master cm ON cm.third_partyid = sbrd.third_partyid
				INNER JOIN third_partyPurchaseNongst_debit_nested sbrdn ON sbrd.thirdPartyDebitid = sbrdn.thirdPartyDebitid
			where sbrd.companyid=@companyid

			group by sbrd.thirdPartyDebitid,sbrd.purchaseid,sbrd.third_partyid,sbrd.purchase_date,sbrd.invoice_no,sbrd.invoice_date,sbrd.return_no,sbrd.return_date,
			sbrd.total,sbrd.return_total,sbrd.isactive,sbrd.cuid,sbrd.cdate,sbrd.muid,sbrd.mdate,sbrd.companyid,cm.party_name,cm.mobile,cm.state,
				cm.state_code,
				cm.gst_in,
				cm.address

				order by sbrd.thirdPartyDebitid desc
		END
	ELSE
		BEGIN
			SELECT DISTINCT
				sbrd.*,
				cm.party_name,
				cm.mobile,
				cm.state,
				cm.state_code,
				cm.gst_in,
				cm.address,
				Cast(sum(CAST(sbrdn.return_qty as float))as nvarchar(255)) AS return_qtyn,
				Cast(sum(CAST(sbrdn.return_total as float))as nvarchar(255)) AS return_totaln
			FROM 
				third_partyPurchaseNongst_debit sbrd
				INNER JOIN third_party_master cm ON cm.third_partyid = sbrd.third_partyid
				INNER JOIN third_partyPurchaseNongst_debit_nested sbrdn ON sbrd.thirdPartyDebitid = sbrdn.thirdPartyDebitid
			where sbrd.companyid=@companyid AND sbrd.return_date=@return_date

			group by sbrd.thirdPartyDebitid,sbrd.purchaseid,sbrd.third_partyid,sbrd.purchase_date,sbrd.invoice_no,sbrd.invoice_date,sbrd.return_no,sbrd.return_date,
			sbrd.total,sbrd.return_total,sbrd.isactive,sbrd.cuid,sbrd.cdate,sbrd.muid,sbrd.mdate,sbrd.companyid,cm.party_name,cm.mobile,cm.state,
				cm.state_code,
				cm.gst_in,
				cm.address
				order by sbrd.thirdPartyDebitid desc
		END	
end
GO
/****** Object:  StoredProcedure [dbo].[get_third_partyPurchaseNongst_debit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_third_partyPurchaseNongst_debit_nested]
@thirdPartyDebitid int
as
BEGIN
	select tppngdn.*,itmm.item_name from third_partyPurchaseNongst_debit_nested tppngdn
	inner join item_master itmm on itmm.itemid=tppngdn.itemid
	where tppngdn.thirdPartyDebitid=@thirdPartyDebitid
END
GO
/****** Object:  StoredProcedure [dbo].[get_thirdparty_advance]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_thirdparty_advance]
@third_partyid int
AS
BEGIN
WITH get_AdvancePayment as (
select sp.advanceid,ISNULL(sum(CAST(ISNULL(spn.deduction_amount,0.00) as decimal(10,2))),0.00) as payment from thirdparty_payment sp
inner join thirdparty_payment_nested spn on spn.paymentid=sp.paymentid
where sp.advanceid>0 and sp.amount_mode='Deduct from Advance'
group by sp.advanceid
)
	select sd.*,
	cast(CAST(advance_amount as decimal(10,2))-ISNULL(getd.payment,0.00) as nvarchar(255)) as aval_addvance 
	from thirdparty_advance sd
	left join get_AdvancePayment getd on getd.advanceid=sd.advanceid
	where sd.third_partyid=@third_partyid and CAST(sd.advance_amount as decimal(10,2)) >ISNULL(getd.payment,0.00)
END
GO
/****** Object:  StoredProcedure [dbo].[get_thirdparty_payment]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_thirdparty_payment]
@companyid int,
@third_partyid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN
	IF(@third_partyid>0)
		BEGIN
				select cp.*,
				cm.party_name,
				CAST(sum(CAst(cpn.deduction_amount as decimal(10,2))) as nvarchar(255)) as deduction_amount
				from thirdparty_payment cp
				inner join thirdparty_payment_nested cpn on cpn.paymentid=cp.paymentid
				inner join third_party_master cm on cm.third_partyid=cp.third_partyid
				 where cp.companyid=@companyid and cp.date between @fromdate And @todate and cp.third_partyid=@third_partyid 
				group by cp.paymentid,cp.third_partyid,cp.date,cp.balance,cp.amount_mode,cp.payment_type,cp.cheque_no,cp.c_date,cp.c_amount,
				cp.companyid,cp.isactive,cp.cuid,cp.cdate,cp.muid,cp.mdate,cm.party_name,cp.advanceid,cp.adnp_amount
		END
	ELSE
		BEGIN			
			select cp.*,
				cm.party_name,
				CAST(sum(CAst(cpn.deduction_amount as decimal(10,2))) as nvarchar(255)) as deduction_amount
				from thirdparty_payment cp
				inner join thirdparty_payment_nested cpn on cpn.paymentid=cp.paymentid
				inner join third_party_master cm on cm.third_partyid=cp.third_partyid
				 where cp.companyid=@companyid and cp.date between @fromdate And @todate
				group by cp.paymentid,cp.third_partyid,cp.date,cp.balance,cp.amount_mode,cp.payment_type,cp.cheque_no,cp.c_date,cp.c_amount,
				cp.companyid,cp.isactive,cp.cuid,cp.cdate,cp.muid,cp.mdate,cm.party_name,cp.advanceid,cp.adnp_amount
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_thirdparty_Payment_details]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- get_thirdparty_Payment_details 1
CREATE procedure [dbo].[get_thirdparty_Payment_details]
@third_partyid int
AS
BEGIN
-- Calculate sums separately for sales_billing
WITH SalesBillingTotals AS (
	select purchaseid,SUM(CAST(ISNULL(net_total,0) as decimal(10,2))) as tot from third_party_gst_purchase_nested
	group by purchaseid
),
-- Calculate sums separately for sales_billing_nongst
SalesBillingNonGstTotals AS (
	select purchaseid,SUM(CAST(ISNULL(total,0) as decimal(10,2))) as tot from third_party_purchase_nested
	group by purchaseid
),
-- Calculate sums separately for sales_billing_returnDebit
SalesBillingReturnTotals AS (
    select purchaseid,SUM(CAST(ISNULL(return_net_total,0) as decimal(10,2))) as retTot from third_partyPurchasegst_debit_nested
	group by purchaseid
),
-- Calculate sums separately for sales_billingNongst_returnDebit
SalesBillingNonGstReturnTotals AS (
    select purchaseid,SUM(TRY_CAST(ISNULL(return_total,0) as decimal(10,2))) as retTot from third_partyPurchaseNongst_debit_nested
	group by purchaseid
),
CUSTOMERPAYMENTGST as(
select purchaseid,third_partyid,SUM(CAST(ISNULL(deduction_amount,0) as decimal(10,2))) as de from thirdparty_payment_nested
where gst=1 and non_gst=0
group by purchaseid,third_partyid
),
CUSTOMERPAYMENTNONGST as(
select purchaseid,third_partyid,SUM(CAST(ISNULL(deduction_amount,0) as decimal(10,2))) as de from thirdparty_payment_nested
where gst=0 and non_gst=1
group by purchaseid,third_partyid
)
----------------------------------------------------------------------------------
select 0 as purchaseid,third_partyid,'' as date,'Opening Balance' as bill_no,'' as  invoice_no,cast(0 as bit) as gst,cast(0 as bit) as non_gst,cast(1 as bit) as isbal,
ISNULL(TRY_CAST(ISNULL(balance,0) as decimal(10,2)),0.00) as tot,'0.00' as retTot,
 CAST(0.00 as decimal(10,2)) as de,
ISNULL(TRY_CAST(ISNULL(balance,0) as decimal(10,2)),0.00) as totalcal
from third_party_master
where ISNULL(TRY_CAST(ISNULL(balance,0) as decimal(10,2)),0.00)>0 and third_partyid=@third_partyid
---------------------------------------------------------------------------------------------------------------------------------
UNION all

SELECT sb.purchaseid, sb.third_partyid, sb.date, sb.bill_no,sb.invoice_no,    
   cast(1 as bit) as gst,cast(0 as bit) as non_gst,cast(0 as bit) as isbal,
	SUM(CAST(ISNULL(sbt.tot, 0) as decimal(10,2))) as tot,
    CAST(SUM(CAST(ISNULL(rsbt.retTot, 0) as decimal(10,2)))as nvarchar(245)) as retTot,
    CAST(SUM(CAST(ISNULL(cpn.de, 0) as decimal(10,2)))as decimal(10,2)) as de,
    ISNULL(sbt.tot, 0) - (SUM(CAST(ISNULL(rsbt.retTot, 0) as decimal(10,2))) + SUM(CAST(ISNULL(cpn.de, 0) as decimal(10,2)))) as totalcal
FROM third_party_gst_purchase sb
LEFT JOIN SalesBillingTotals sbt ON sbt.purchaseid = sb.purchaseid
LEFT JOIN SalesBillingReturnTotals rsbt ON rsbt.purchaseid = sb.purchaseid
LEFT JOIN CUSTOMERPAYMENTGST cpn ON cpn.purchaseid = sb.purchaseid AND cpn.third_partyid = sb.third_partyid
WHERE sb.third_partyid = @third_partyid
GROUP BY sb.purchaseid, sb.third_partyid, sb.date, sb.bill_no,sb.invoice_no,sbt.tot

UNION all

SELECT sb.purchaseid, sb.third_partyid, sb.date, sb.bill_no,sb.invoice_no,  
   cast(0 as bit) as gst,cast(1 as bit) as non_gst,cast(0 as bit) as isbal,
    SUM(CAST(ISNULL(sbngt.tot, 0) as decimal(10,2))) as tot,
    CAST(SUM(CAST(ISNULL(rsbngt.retTot, 0) as decimal(10,2)))as nvarchar(245)) as retTot,    
    CAST(SUM(CAST(ISNULL(cpn.de, 0) as decimal(10,2)))as decimal(10,2)) as de,
   ISNULL(sbngt.tot, 0) - (SUM(CAST(ISNULL(rsbngt.retTot, 0) as decimal(10,2))) + SUM(CAST(ISNULL(cpn.de, 0) as decimal(10,2)))) as totalcal
FROM third_party_purchase sb
LEFT JOIN SalesBillingNonGstTotals sbngt ON sbngt.purchaseid = sb.purchaseid
LEFT JOIN SalesBillingNonGstReturnTotals rsbngt ON rsbngt.purchaseid = sb.purchaseid
LEFT JOIN CUSTOMERPAYMENTNONGST cpn ON cpn.purchaseid = sb.purchaseid AND cpn.third_partyid = sb.third_partyid
WHERE sb.third_partyid = @third_partyid
GROUP BY sb.purchaseid, sb.third_partyid, sb.date, sb.bill_no,sb.invoice_no,sbngt.tot

order by date
END
GO
/****** Object:  StoredProcedure [dbo].[get_thirdParty_payment_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_thirdParty_payment_from_to_date] 3,'2024-04-01','2024-06-28'
CREATE procedure [dbo].[get_thirdParty_payment_from_to_date]
@companyid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN

--  DECLARE @FromDateDT DATETIME = CAST(@fromdate AS DATETIME);
--  DECLARE @ToDateDT DATETIME = CAST(@todate AS DATETIME);

-- SELECT sb.paymentid,sb.date,sb.third_partyid,cm.party_name,sbb.bill_no,sb.amount_mode,
-- sb.payment_type,sbnn.si_code,sbnn.ref_code,sbn.* From thirdparty_payment sb
-- inner join thirdparty_payment_nested sbn on sbn.paymentid=sb.paymentid
---- inner join third_party_gst_purchase_nested sbnn on sbnn.purchaseid=sbn.purchaseid 
-- --left join third_party_gst_purchase sbb on sbb.purchaseid=sbnn.purchaseid
-- left join third_party_master cm on cm.third_partyid=sb.third_partyid
--   WHERE CAST(sb.date AS DATETIME) >= @FromDateDT
--      AND CAST(sb.date AS DATETIME) <= @ToDateDT AND sb.companyid=@companyid AND sb.isactive=1 AND 
--	  sbn.gst=1;

	WITH SIMPLE_CET as (
	select tp.bill_no,STRING_AGG(tpn.si_code,', ') as si_code,
	STRING_AGG(tpn.ref_code,', ') as ref_code,tp.purchaseid
	from third_party_gst_purchase tp
	inner join third_party_gst_purchase_nested tpn on tp.purchaseid=tpn.purchaseid
	group by tp.bill_no,tp.purchaseid
	)

	  select tp.*,tpm.party_name,sm.bill_no,sm.si_code,sm.ref_code,tpn.total_amount,tpn.deduction_amount
	  from thirdparty_payment tp
	  inner join thirdparty_payment_nested tpn on tpn.paymentid=tp.paymentid and CAST(tpn.deduction_amount as float)>0
	  left join SIMPLE_CET sm on sm.purchaseid=tpn.purchaseid
	  inner join third_party_master tpm on tpm.third_partyid=tp.third_partyid
	  WHERE CAST(tp.date AS DATETIME) >= CAST(@fromdate AS DATETIME)
      AND CAST(tp.date AS DATETIME) <= CAST(@todate AS DATETIME) AND tp.companyid=@companyid AND tp.isactive=1 AND tpn.gst=1;
END
GO
/****** Object:  StoredProcedure [dbo].[get_thirdparty_purchase_bythirdpartyid]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_thirdparty_purchase_bythirdpartyid]
@third_partyid int,
@companyid int
AS
BEGIN
	WITH GETPURCHASEAMOUNT AS (
	select tp.purchaseid,sum(cast(ISNULL(tpn.net_total,0) as float)) as nettot from third_party_gst_purchase tp
	inner join third_party_gst_purchase_nested tpn on tpn.purchaseid=tp.purchaseid
	group by tp.purchaseid
	)

		select tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,
		CAST(SUM(ISNULL(CAST(rmn.nettot AS float), 0))as nvarchar(255)) as total,tp.companyid
		,tpm.party_name,tpm.gst_in,tpm.address,tpm.state,tpm.state_code 
		from third_party_gst_purchase tp
		inner join third_party_master tpm on tpm.third_partyid=tp.third_partyid
		left join GETPURCHASEAMOUNT rmn on rmn.purchaseid=tp.purchaseid
		where tp.companyid=@companyid and tp.third_partyid=@third_partyid

		group by tp.purchaseid,tp.third_partyid,tp.date,tp.invoice_no,tp.bill_no,tp.c_balance,tp.credit_days,tp.companyid,
		tpm.party_name,tpm.gst_in,tpm.address,tpm.state,tpm.state_code
END
GO
/****** Object:  StoredProcedure [dbo].[get_thirdPartygst_Purchase_report_bill]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- get_multiple_sales_report 1

create procedure [dbo].[get_thirdPartygst_Purchase_report_bill]
@purchaseid int
AS
BEGIN
select sb.*,cm.party_name,cm.gst_in,cm.state,cm.state_code
,sbn.hsn_number,sbn.gst_percentage,
cast(sum(CAST(sbn.qty as float))as nvarchar(255)) as qty,
sbn.price,
sbn.discount,
cm.address as cust_ship_address,
CAST(sum(CAST(sbn.total as float)) as nvarchar(255)) as n_total,
STRING_AGG(sbn.si_code,'-')as si_code,
CAST(sum(CAST(sbn.cgst_amount as float))as nvarchar(255)) as cgst_amount,
CAST(sum(CAST(sbn.sgst_amount as float))as nvarchar(255)) as sgst_amount,
CAST(sum(CAST(sbn.igst_amount as float))as nvarchar(255)) as igst_amount,
CAST(sum(CAST(sbn.net_total as float))as nvarchar(255)) as net_total
from third_party_gst_purchase sb 
left join third_party_master cm on cm.third_partyid=sb.third_partyid
left join third_party_gst_purchase_nested sbn on sbn.purchaseid=sb.purchaseid

where sb.purchaseid=@purchaseid

group by sb.purchaseid,sb.third_partyid,sb.date,sb.bill_no,sb.credit_days,sb.c_balance,
sb.total,sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate,
cm.party_name,cm.gst_in,cm.state,cm.state_code,sbn.hsn_number,sbn.gst_percentage,
sbn.discount,sbn.price,sbn.discount,cm.address,sb.invoice_no
END
GO
/****** Object:  StoredProcedure [dbo].[get_thirdPartygst_purchase_return_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_thirdPartygst_purchase_return_from_to_date]
@companyid int,
@fromdate nvarchar(255),
@todate nvarchar(255),
@third_partyid int
AS
BEGIN
	IF(@third_partyid>0)
		BEGIN
			select tpr.thirdPartyDebitid,tpr.purchaseid,tpr.third_partyid,tpr.purchase_date,tp.invoice_no,tpr.invoice_date,tpr.return_no,
			tpr.return_date,tpr.total,tpr.return_total,tpr.isactive,tpr.companyid,tpr.cuid,tpr.cdate,tpr.muid,tpr.mdate,tm.party_name,
			cast(sum(TRY_CAST(tprn.return_qty as decimal(10,2)))as nvarchar(255)) as return_qty,
			cast(sum(TRY_CAST(tprn.return_net_total as decimal(10,2)))as nvarchar(255)) as return_net_total
			from third_partyPurchasegst_debit tpr
			inner join third_partyPurchasegst_debit_nested tprn on tprn.thirdPartyDebitid=tpr.thirdPartyDebitid
			inner join third_party_gst_purchase tp on tp.purchaseid=tpr.purchaseid
			inner join third_party_master tm on tm.third_partyid=tpr.third_partyid
				where CAST(tpr.return_date AS DATETIME) >= CAST(@fromdate AS DATETIME) and tpr.third_partyid=@third_partyid
			 AND CAST(tpr.return_date AS DATETIME) <= CAST(@todate AS DATETIME) AND tpr.companyid=@companyid AND tpr.isactive=1
			group by tpr.thirdPartyDebitid,tpr.purchaseid,tpr.third_partyid,tpr.purchase_date,tp.invoice_no,tpr.invoice_date,tpr.return_no,
			tpr.return_date,tpr.total,tpr.return_total,tpr.isactive,tpr.companyid,tpr.cuid,tpr.cdate,tpr.muid,tpr.mdate,tm.party_name
		END
	ELSE
		BEGIN
			select tpr.thirdPartyDebitid,tpr.purchaseid,tpr.third_partyid,tpr.purchase_date,tp.invoice_no,tpr.invoice_date,tpr.return_no,
			tpr.return_date,tpr.total,tpr.return_total,tpr.isactive,tpr.companyid,tpr.cuid,tpr.cdate,tpr.muid,tpr.mdate,tm.party_name,
			cast(sum(TRY_CAST(tprn.return_qty as decimal(10,2)))as nvarchar(255)) as return_qty,
			cast(sum(TRY_CAST(tprn.return_net_total as decimal(10,2)))as nvarchar(255)) as return_net_total
			from third_partyPurchasegst_debit tpr
			inner join third_partyPurchasegst_debit_nested tprn on tprn.thirdPartyDebitid=tpr.thirdPartyDebitid
			inner join third_party_gst_purchase tp on tp.purchaseid=tpr.purchaseid
			inner join third_party_master tm on tm.third_partyid=tpr.third_partyid
				where CAST(tpr.return_date AS DATETIME) >= CAST(@fromdate AS DATETIME)
			 AND CAST(tpr.return_date AS DATETIME) <= CAST(@todate AS DATETIME) AND tpr.companyid=@companyid AND tpr.isactive=1
			group by tpr.thirdPartyDebitid,tpr.purchaseid,tpr.third_partyid,tpr.purchase_date,tp.invoice_no,tpr.invoice_date,tpr.return_no,
			tpr.return_date,tpr.total,tpr.return_total,tpr.isactive,tpr.companyid,tpr.cuid,tpr.cdate,tpr.muid,tpr.mdate,tm.party_name
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_thirdPartyNongst_payment_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [get_thirdPartyNongst_payment_from_to_date] 3,'2024-05-28','2024-05-28'
CREATE procedure [dbo].[get_thirdPartyNongst_payment_from_to_date]
@companyid int,
@fromdate nvarchar(255),
@todate nvarchar(255)
AS
BEGIN

 -- DECLARE @FromDateDT DATETIME = CAST(@fromdate AS DATETIME);
 --   DECLARE @ToDateDT DATETIME = CAST(@todate AS DATETIME);

 --SELECT sb.paymentid,sb.date,sb.third_partyid,cm.party_name,sbb.bill_no,sb.amount_mode,
 --sb.payment_type,sbnn.si_code,sbnn.ref_code,sbn.* From thirdparty_payment sb
 --inner join thirdparty_payment_nested sbn on sbn.paymentid=sb.paymentid
 --inner join third_party_purchase_nested sbnn on sbnn.purchaseid=sbn.purchaseid 
 --left join third_party_purchase sbb on sbb.purchaseid=sbnn.purchaseid
 --left join third_party_master cm on cm.third_partyid=sb.third_partyid
 --  WHERE CAST(sb.date AS DATETIME) >= @FromDateDT
 --     AND CAST(sb.date AS DATETIME) <= @ToDateDT AND sb.companyid=@companyid AND sb.isactive=1 AND 
	--  sbn.non_gst=1 and CAST(sbn.deduction_amount as float) >0;


	WITH SIMPLE_CET as (
	select tp.bill_no,STRING_AGG(tpn.si_code,', ') as si_code,
	STRING_AGG(tpn.ref_code,', ') as ref_code,tp.purchaseid
	from third_party_purchase tp
	inner join third_party_purchase_nested tpn on tp.purchaseid=tpn.purchaseid
	group by tp.bill_no,tp.purchaseid
	)

	  select tp.*,tpm.party_name,sm.bill_no,sm.si_code,sm.ref_code,tpn.total_amount,tpn.deduction_amount
	  from thirdparty_payment tp
	  inner join thirdparty_payment_nested tpn on tpn.paymentid=tp.paymentid and CAST(tpn.deduction_amount as float)>0
	  left join SIMPLE_CET sm on sm.purchaseid=tpn.purchaseid
	  inner join third_party_master tpm on tpm.third_partyid=tp.third_partyid
	  WHERE CAST(tp.date AS DATETIME) >= CAST(@fromdate AS DATETIME)
      AND CAST(tp.date AS DATETIME) <= CAST(@todate AS DATETIME) AND tp.companyid=@companyid AND tp.isactive=1 AND tpn.non_gst=1;

END
GO
/****** Object:  StoredProcedure [dbo].[get_thirdPartyNongst_Purchase_report_bill]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- get_thirdPartygst_Purchase_report_bill 1

create procedure [dbo].[get_thirdPartyNongst_Purchase_report_bill]
@purchaseid int
AS
BEGIN
select sb.*,cm.party_name,cm.gst_in,cm.state,cm.state_code
,sbn.hsn_number,
cast(sum(CAST(sbn.qty as float))as nvarchar(255)) as qty,
sbn.price,
sbn.discount,
cm.address as cust_ship_address,
CAST(sum(CAST(sbn.total as float)) as nvarchar(255)) as n_total,
STRING_AGG(sbn.si_code,'-')as si_code
from third_party_purchase sb 
left join third_party_master cm on cm.third_partyid=sb.third_partyid
left join third_party_purchase_nested sbn on sbn.purchaseid=sb.purchaseid

where sb.purchaseid=@purchaseid

group by sb.purchaseid,sb.third_partyid,sb.date,sb.bill_no,sb.credit_days,sb.c_balance,
sb.total,sb.companyid,sb.isactive,sb.cuid,sb.cdate,sb.muid,sb.mdate,
cm.party_name,cm.gst_in,cm.state,cm.state_code,sbn.hsn_number,
sbn.discount,sbn.price,sbn.discount,cm.address,sb.invoice_no
END
GO
/****** Object:  StoredProcedure [dbo].[get_thirdPartyNongst_purchase_return_from_to_date]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_thirdPartyNongst_purchase_return_from_to_date]
@companyid int,
@fromdate nvarchar(255),
@todate nvarchar(255),
@third_partyid int
AS
BEGIN
IF(@third_partyid>0)
		BEGIN
			select tpr.thirdPartyDebitid,tpr.purchaseid,tpr.third_partyid,tpr.purchase_date,tp.invoice_no,tpr.invoice_date,tpr.return_no,
			tpr.return_date,tpr.total,tpr.return_total,tpr.isactive,tpr.companyid,tpr.cuid,tpr.cdate,tpr.muid,tpr.mdate,tm.party_name,
			cast(sum(TRY_CAST(tprn.return_qty as decimal(10,2)))as nvarchar(255)) as return_qty,
			cast(sum(TRY_CAST(tprn.return_total as decimal(10,2)))as nvarchar(255)) as return_total
			from third_partyPurchaseNongst_debit tpr
			inner join third_partyPurchaseNongst_debit_nested tprn on tprn.thirdPartyDebitid=tpr.thirdPartyDebitid
			inner join third_party_purchase tp on tp.purchaseid=tpr.purchaseid
			inner join third_party_master tm on tm.third_partyid=tpr.third_partyid
				where CAST(tpr.return_date AS DATETIME) >= CAST(@fromdate AS DATETIME) and tpr.third_partyid=@third_partyid
			 AND CAST(tpr.return_date AS DATETIME) <= CAST(@todate AS DATETIME) AND tpr.companyid=@companyid AND tpr.isactive=1
			group by tpr.thirdPartyDebitid,tpr.purchaseid,tpr.third_partyid,tpr.purchase_date,tp.invoice_no,tpr.invoice_date,tpr.return_no,
			tpr.return_date,tpr.total,tpr.return_total,tpr.isactive,tpr.companyid,tpr.cuid,tpr.cdate,tpr.muid,tpr.mdate,tm.party_name
		END
	ELSE
		BEGIN
			select tpr.thirdPartyDebitid,tpr.purchaseid,tpr.third_partyid,tpr.purchase_date,tp.invoice_no,tpr.invoice_date,tpr.return_no,
			tpr.return_date,tpr.total,tpr.return_total,tpr.isactive,tpr.companyid,tpr.cuid,tpr.cdate,tpr.muid,tpr.mdate,tm.party_name,
			cast(sum(TRY_CAST(tprn.return_qty as decimal(10,2)))as nvarchar(255)) as return_qty,
			cast(sum(TRY_CAST(tprn.return_total as decimal(10,2)))as nvarchar(255)) as return_total
			from third_partyPurchaseNongst_debit tpr
			inner join third_partyPurchaseNongst_debit_nested tprn on tprn.thirdPartyDebitid=tpr.thirdPartyDebitid
			inner join third_party_purchase tp on tp.purchaseid=tpr.purchaseid
			inner join third_party_master tm on tm.third_partyid=tpr.third_partyid
				where CAST(tpr.return_date AS DATETIME) >= CAST(@fromdate AS DATETIME)
			 AND CAST(tpr.return_date AS DATETIME) <= CAST(@todate AS DATETIME) AND tpr.companyid=@companyid AND tpr.isactive=1
			group by tpr.thirdPartyDebitid,tpr.purchaseid,tpr.third_partyid,tpr.purchase_date,tp.invoice_no,tpr.invoice_date,tpr.return_no,
			tpr.return_date,tpr.total,tpr.return_total,tpr.isactive,tpr.companyid,tpr.cuid,tpr.cdate,tpr.muid,tpr.mdate,tm.party_name
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Get_ThirdPartyPurchasegst_nestedBy_ref_code]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Get_salesBilling_sbnestedBy_ref_code 3,'KO1'
CREATE PROCEDURE [dbo].[Get_ThirdPartyPurchasegst_nestedBy_ref_code]
    @companyid INT,
    @ref_code NVARCHAR(255)
AS
BEGIN
    SELECT
        sbn.*,
		sb.purchaseid,
        sb.bill_no,
        sb.date as purchase_date,
        sb.third_partyid,
        sb.total as return_total,
		tpm.party_name
    FROM
        third_party_gst_purchase_nested sbn
    INNER JOIN
        third_party_gst_purchase sb ON sbn.purchaseid = sb.purchaseid
			INNER JOIN 
		third_party_master tpm ON tpm.third_partyid=sb.third_partyid
    WHERE
        sb.companyid = @companyid
        AND sbn.ref_code = @ref_code;
END
GO
/****** Object:  StoredProcedure [dbo].[Get_ThirdPartyPurchasegst_nestedBy_Si_code]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Get_salesBilling_sbnestedBy_si_code 3,'0002'
CREATE PROCEDURE [dbo].[Get_ThirdPartyPurchasegst_nestedBy_Si_code]
    @companyid INT,
    @si_code NVARCHAR(255)
AS
BEGIN
    SELECT
        sbn.*,
        sb.bill_no,
		sb.purchaseid,
        sb.date as purchase_date,
        sb.third_partyid,
        sb.total AS return_total,
		tpm.party_name
    FROM
        third_party_gst_purchase_nested sbn
    INNER JOIN
        third_party_gst_purchase sb ON sbn.purchaseid = sb.purchaseid
		INNER JOIN 
		third_party_master tpm ON tpm.third_partyid=sb.third_partyid
    WHERE
        sb.companyid = @companyid
        AND sbn.si_code = @si_code;
END
GO
/****** Object:  StoredProcedure [dbo].[Get_unit_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_unit_master] 
@companyid int
as
begin

select * from unit_master where isactive=1 and companyid=@companyid;
end
GO
/****** Object:  StoredProcedure [dbo].[Get_user_profile]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_user_profile]
@companyid int
AS
	Begin
		BEGIN
			select * from user_profile where isactive=1 and companyid=@companyid
			if(select count(*) from user_profile)<1
				BEGIN
					insert into user_profile(companyid,user_name,email,password,m_companyid,isactive,cuid)values(1,'SAVEDATA INFO TECH','savedata@gmail.com','Good@2023',1,1,0)
				END
		END
		
	End
GO
/****** Object:  StoredProcedure [dbo].[get_userbyid]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_userbyid]
@userid int
AS
BEGIN
select * from user_profile where userid=@userid
END
GO
/****** Object:  StoredProcedure [dbo].[get_weaver_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_weaver_master]
@companyid int
AS
BEGIN
	select * from weaver_master where companyid=@companyid and isactive=1
END
GO
/****** Object:  StoredProcedure [dbo].[get_weavers_given_received]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_weavers_given_received]
@companyid int,
@date nvarchar(255)
as
BEGIN
	IF(@date='All')
		BEGIN
			select wsp.*,weaver_name,wm.short_code,
			STRING_AGG(wpn.si_code,'-') as si_codes
			from weavers_purchase wsp
			inner join weaver_master wm on wm.weaverid=wsp.weaverid
			left join weavers_purchase_nested wpn on wpn.purchaseid=wsp.purchaseid
			where wsp.companyid=@companyid
			group by wsp.purchaseid ,wsp.weaverid,wsp.cdate,wsp.companyid,wsp.cuid
			,wsp.date,wsp.isactive,wsp.mdate,wsp.muid,wm.weaver_name,wm.short_code,wsp.mode

			union ALL

			select gw.*,wm.weaver_name,wm.short_code,''as si_codes from given_to_weavers gw
			--left join giventoweavers gwn on gwn.purchaseid=gw.purchaseid
			inner join weaver_master wm on wm.weaverid=gw.weaverid
			where gw.companyid=@companyid

			order by purchaseid desc
		END
	ELSE
		BEGIN
			select wsp.*,weaver_name,wm.short_code,
			STRING_AGG(wpn.si_code,'-') as si_codes
			from weavers_purchase wsp
			inner join weaver_master wm on wm.weaverid=wsp.weaverid
			left join weavers_purchase_nested wpn on wpn.purchaseid=wsp.purchaseid
			where wsp.companyid=@companyid AND date=@date
			group by wsp.purchaseid ,wsp.weaverid,wsp.cdate,wsp.companyid,wsp.cuid
			,wsp.date,wsp.isactive,wsp.mdate,wsp.muid,wm.weaver_name,wm.short_code,wsp.mode
			
			union ALL

			select gw.*,wm.weaver_name,wm.short_code,''as si_codes from given_to_weavers gw
			--left join giventoweavers gwn on gwn.purchaseid=gw.purchaseid
			inner join weaver_master wm on wm.weaverid=gw.weaverid
			where gw.companyid=@companyid and gw.date=@date

			order by purchaseid desc
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_weavers_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- get_raw_material_purchase 3,'2024-08-17'
CREATE procedure [dbo].[get_weavers_purchase]
@companyid int,
@date nvarchar(255)
as
BEGIN
	IF(@date='All')
		BEGIN
			select wsp.*,weaver_name,wm.short_code,
			STRING_AGG(wpn.si_code,'-') as si_codes
			from weavers_purchase wsp
			inner join weaver_master wm on wm.weaverid=wsp.weaverid
			left join weavers_purchase_nested wpn on wpn.purchaseid=wsp.purchaseid
			where wsp.companyid=@companyid
			group by wsp.purchaseid ,wsp.weaverid,wsp.cdate,wsp.companyid,wsp.cuid
			,wsp.date,wsp.isactive,wsp.mdate,wsp.muid,wm.weaver_name,wm.short_code,wsp.mode
			order by wsp.purchaseid desc
		END
	ELSE
		BEGIN
			select wsp.*,weaver_name,wm.short_code,
			STRING_AGG(wpn.si_code,'-') as si_codes
			from weavers_purchase wsp
			inner join weaver_master wm on wm.weaverid=wsp.weaverid
			left join weavers_purchase_nested wpn on wpn.purchaseid=wsp.purchaseid
			where wsp.companyid=@companyid AND date=@date
			group by wsp.purchaseid ,wsp.weaverid,wsp.cdate,wsp.companyid,wsp.cuid
			,wsp.date,wsp.isactive,wsp.mdate,wsp.muid,wm.weaver_name,wm.short_code,wsp.mode
			order by wsp.purchaseid desc
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Get_weavers_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_weavers_purchase_nested]
@purchaseid int
as
BEGIN
	select * from weavers_purchase_nested where purchaseid=@purchaseid
END
GO
/****** Object:  StoredProcedure [dbo].[get_weavers_wise_given_received]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_weavers_wise_given_received]
@companyid int,
@weaverid int
AS
BEGIN

select gtw.date,gtw.mode,wm.weaver_name,
'' as si_code,'' as qty,'' as r_gram,'' as r_advance,
gw.g_gram,gw.g_rate,gw.g_total,gw.g_advance,
bm.brand_name,im.item_name,
1 as orderr
from given_to_weavers gtw
left join giventoweavers gw on gw.purchaseid=gtw.purchaseid
inner join brand_master bm on bm.brandid=gw.brandid
inner join item_master im on im.itemid=gw.itemid
inner join weaver_master wm on wm.weaverid=gtw.weaverid
 where gtw.companyid=@companyid and gtw.weaverid=@weaverid

 union all

select wp.date,wp.mode,wm.weaver_name,
wpn.si_code,wpn.qty,wpn.r_gram,wpn.r_advance,
'' as g_gram,'' as g_rate,'' as g_total,'' as g_advance,
bm.brand_name,im.item_name,
2 as orderr
from weavers_purchase wp
left join weavers_purchase_nested wpn on wpn.purchaseid=wp.purchaseid
inner join brand_master bm on bm.brandid=wpn.brandid
inner join item_master im on im.itemid=wpn.itemid
inner join weaver_master wm on wm.weaverid=wp.weaverid
where wp.companyid=@companyid and wp.weaverid=@weaverid

order by date,orderr

END
GO
/****** Object:  StoredProcedure [dbo].[GetActive_financial_year]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetActive_financial_year]
@companyid int
as
begin
select * from financial_year where status=1 and isactive=1 AND companyid=@companyid;
end
GO
/****** Object:  StoredProcedure [dbo].[GetActiveStsCompany_company_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetActiveStsCompany_company_master] 
as
begin
select * from company_master where activestatus=1 and isactive=1;
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_brand_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_brand_master]
@brand_name nvarchar(255),
@companyid int,	
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
declare @count int;
set @count=(select count(*) from brand_master where companyid=@companyid and isactive=1 and brand_name=@brand_name);
	IF(@count<1)
		BEGIN
			insert into brand_master(
			brand_name,
			companyid,
			isactive,
			cuid,
			cdate
			)values(
			@brand_name,
			@companyid,
			1,
			@cuid,
			getdate()
			)
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Saved successfully'
		END
	ELSE
		BEGIN
			set @o_ErrorCode=-1;
			set @o_ErrorDescription='Alredy'
		END
end try
begin catch
set @o_ErrorCode=-1;
set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_company_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_company_master]
    @company_sdate nvarchar(255),
    @company_name nvarchar(255),
    @display_name nvarchar(255),
    @door_no nvarchar(255),
    @building_name nvarchar(255),
    @street_name nvarchar(255),
    @streent_name1 nvarchar(255),
    @email nvarchar(255),
    @c_location nvarchar(255),
    @pincode nvarchar(255),
    @post nvarchar(255),
    @taluk nvarchar(255),
    @district nvarchar(255),
    @website nvarchar(255),
    @owner_name nvarchar(255),
    @mobile nvarchar(255),
    @office_phno nvarchar(255),
    @logo nvarchar(max),
	@bank_name nvarchar(255),
	@ac_holder_name nvarchar(255),
	@ac_no nvarchar(255),
	@ifsc_code nvarchar(255),
	@gst_in nvarchar(255),
    @cuid int,
    @o_ErrorCode int Output,
    @o_ErrorDescription varchar(250) output

as
begin
    begin try      
        if not exists (select 1 from company_master where company_name = @company_name and isactive = 1)
        begin
            insert into company_master (
                company_sdate,
                company_name,
                display_name,
                door_no,
                building_name,
                street_name,
                streent_name1,
                email,
                c_location,
                pincode,
                post,
                taluk,
                district,
                website,
                owner_name,
                mobile,
                office_phno,
                logo,
                isactive,
                activestatus,
                cuid,
                cdate,
				bank_name,
				ac_holder_name,
				ac_no,
				ifsc_code,
				gst_in
            )
            values (
                @company_sdate,
                @company_name,
                @display_name,
                @door_no,
                @building_name,
                @street_name,
                @streent_name1,
                @email,
                @c_location,
                @pincode,
                @post,
                @taluk,
                @district,
                @website,
                @owner_name,
                @mobile,
                @office_phno,
                @logo,
                1,
                0,
                @cuid,
                GETDATE(),
				@bank_name,
				@ac_holder_name,
				@ac_no,
				@ifsc_code,
				@gst_in
            )
            set @o_ErrorCode = @@IDENTITY;
            set @o_ErrorDescription = 'Saved successfully';
        end
        else
        begin           
            set @o_ErrorCode = -1;
            set @o_ErrorDescription = 'Company Already Exists';
        end
    end try
    begin catch
        set @o_ErrorCode = -1;
        set @o_ErrorDescription = 'Error';
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[insert_customer_advance]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[insert_customer_advance]
@customerid int,
@date nvarchar(255),
@advance_amount nvarchar(255),
@description nvarchar(1255)
AS
BEGIN
	insert into customer_advance (customerid,date,advance_amount,description)values(@customerid,@date,@advance_amount,@description)
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_customer_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_customer_master]
@customer_name nvarchar(255),
@mobile_no nvarchar(255),
@state nvarchar(255),
@state_code nvarchar(255),
@gst_in nvarchar(255),
@balance nvarchar(255),
@address nvarchar(255),
@shipping_address nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
		declare @count int;
		set @count=(select count(*) from customer_master where companyid=@companyid and customer_name=@customer_name and isactive=1);
	IF(@count<1)
		BEGIN
				insert into customer_master(
					customer_name,
					mobile_no,
					state,
					state_code,
					gst_in,
					balance,
					address,
					shipping_address,
					companyid,
					isactive,
					cuid,
					cdate
				)values(
					@customer_name,
					@mobile_no,
					@state,
					@state_code,
					@gst_in,
					@balance,
					@address,
					@shipping_address,
					@companyid,
					1,
					@cuid,
					getdate()
				)
					set @o_ErrorCode=@@IDENTITY;
					set @o_ErrorDescription='Saved successfully'
		END
	ELSE
		BEGIN
					set @o_ErrorCode=-1;
					set @o_ErrorDescription='Alredy'
		END
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_customer_payment]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_customer_payment]
@customerid int,
@date nvarchar(255),
@balance nvarchar(255),
@amount_mode nvarchar(255),
@payment_type nvarchar(255),
@cheque_no nvarchar(255),
@c_date nvarchar(255),
@c_amount nvarchar(255),
@companyid int,
@cuid int,
@advanceid int,
@adnp_amount nvarchar(255),
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRY
            INSERT INTO customer_payment(
                customerid,
                date,
                balance,
                amount_mode,
                payment_type,
                cheque_no,
                c_date,
                c_amount,
				companyid,
                isactive,
                cuid,
                cdate,
				advanceid,
				adnp_amount
            )
            VALUES (
                @customerid,
                @date,
                @balance,
                @amount_mode,
                @payment_type,
                @cheque_no,
                @c_date,
                @c_amount,
				@companyid,
                1,
                @cuid,
                getdate(),
				@advanceid,
				@adnp_amount
            );
            SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
    END TRY
    BEGIN CATCH
        SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_customer_payment_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_customer_payment_nested]
 @paymentid int,
 @entryid int,
 @customerid int,
 @total_amount nvarchar(255),
 @deduction_amount nvarchar(255),
 @gst bit,
 @non_gst bit,
 @isbal bit
AS
BEGIN
            INSERT INTO customer_payment_nested(
			   paymentid,
			   entryid,
			   customerid,
			   total_amount,
			   deduction_amount,
			   gst,
			   non_gst,
			   isbal
            )
            VALUES (
               @paymentid,
			   @entryid,
			   @customerid,
			   @total_amount,
			   @deduction_amount,
			   @gst,
			   @non_gst,
			   @isbal
            );

			IF(@isbal=1)
				BEGIN
					update customer_master 
					set balance=CAST(TRY_CAST(ISNULL(balance,0) as decimal(10,2)) - CAST(@deduction_amount as decimal(10,2)) as nvarchar(255))
					where customerid=@customerid
				END
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_financial_year]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_financial_year]
@finyear nvarchar(255),
@companyid int,
@fromdate nvarchar(255),
@todate nvarchar(255),
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin 
begin try
insert into financial_year(
finyear,
companyid,
fromdate,
todate,
isactive,
status,
cuid,
cdate
)values(
@finyear,
@companyid,
@fromdate,
@todate,
1,
0,
@cuid,
GETDATE()
)
set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Saved successfully'
end try
begin catch 
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[insert_given_to_weavers]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insert_given_to_weavers]
@weaverid int,
@date nvarchar(255),
@mode nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
begin
begin try
insert into given_to_weavers 
(
weaverid,
date,
mode,
isactive,
companyid,
cuid,
cdate
)
values(
@weaverid,
@date,
@mode,
1,
@companyid,
@cuid,
GETDATE()
)
  SET @o_ErrorCode = @@IDENTITY;
  SET @o_ErrorDescription = 'Saved successfully';
end try
begin catch
    SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[insert_giventoweavers]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insert_giventoweavers]
@purchaseid int,
@brandid int,
@itemid int,
@g_gram nvarchar(255),
@g_rate nvarchar(255),
@g_total nvarchar(255),
@g_advance nvarchar(255),
@description nvarchar(1255)
AS
BEGIN
	insert into giventoweavers(purchaseid,brandid,itemid,g_gram,g_rate,g_total,g_advance,description)
	values(@purchaseid,@brandid,@itemid,@g_gram,@g_rate,@g_total,@g_advance,@description)
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_gst_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_gst_master]
    @companyid int,
    @gst_ID nvarchar(255),
    @gst_percentage nvarchar(255),
    @igst_percentage nvarchar(255),
    @c_gst nvarchar(255),
    @s_gst nvarchar(255),
    @cuid int,
    @o_ErrorCode int OUTPUT,
    @o_ErrorDescription varchar(250) OUTPUT
AS
BEGIN
    BEGIN TRY     
declare @count int;
set @count=(select count(*) from gst_master where companyid=@companyid and isactive=1 and gst_percentage=@gst_percentage);
	IF(@count<1)
		BEGIN
            INSERT INTO gst_master (
                companyid,
                gst_ID,
                gst_percentage,
                igst_percentage,
                c_gst,
                s_gst,
                isactive,
                cuid,
                cdate
				)
				VALUES (
                @companyid,
                @gst_ID,
                @gst_percentage,
                @igst_percentage,
                @c_gst,
                @s_gst,
                1,
                @cuid,
                GETDATE()
				);

            SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';    
		END
	ELSE
		BEGIN
			SET @o_ErrorCode = -1;
            SET @o_ErrorDescription = 'Alredy';  
		END
    END TRY
    BEGIN CATCH
        SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_hsn_group]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_hsn_group]
@companyid int,
@gstid int,
@hsn_number nvarchar(255),
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
AS
begin
begin try
declare @count int;
set @count=(select count(*) from hsn_group where companyid=@companyid and isactive=1 and hsn_number=@hsn_number)
if (@count<1)
	begin
			insert into hsn_group
		(
		companyid,
		gstid,
		hsn_number,
		isactive,
		cuid,
		cdate
		)
		values(
		@companyid,
		@gstid,
		@hsn_number,
		1,
		@cuid,
		GETDATE()
		)
		set @o_ErrorCode=@@IDENTITY;
		set @o_ErrorDescription='Saved successfully'
	end
	else
		begin
			set @o_ErrorCode=-1;
			set @o_ErrorDescription='Already'
		end
end try
begin catch

set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_item_group]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_item_group]
    @companyid INT,
    @item_group_name NVARCHAR(255),
    @hsnid INT,
    @cuid INT,
    @o_ErrorCode INT OUTPUT,
    @o_ErrorDescription VARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRY
declare @count int;
set @count=(select count(*) from item_group where companyid=@companyid and isactive=1 and item_group_name=@item_group_name);
	IF(@count<1)
		BEGIN
            INSERT INTO item_group (companyid, item_group_name, hsnid, isactive, cuid, cdate)
            VALUES (@companyid, @item_group_name, @hsnid, 1, @cuid, GETDATE());

            SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
		END
	ELSE
		BEGIN
			SET @o_ErrorCode = -1;
            SET @o_ErrorDescription = 'Alredy';
		END
    END TRY
    BEGIN CATCH
        SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_item_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_item_master]
@companyid int,
@unitid int,
@item_groupid int,
@item_code nvarchar(255),
@brandid int,
@item_name nvarchar(255),
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
AS
begin
begin try
declare @count int;
set @count=(select COUNT(*) from item_master where companyid=@companyid and isactive=1 and item_name=@item_name);
IF(@count<1)
	BEGIN
		insert into item_master(
		companyid,
		unitid,
		item_groupid,
		item_code,
		brandid,
		item_name,
		isactive,
		cuid,
		cdate
		) values(
		@companyid,
		@unitid,
		@item_groupid,
		@item_code,
		@brandid,
		@item_name,
		1,
		@cuid,
		GETDATE()
		)

		set @o_ErrorCode=@@IDENTITY;
		set @o_ErrorDescription='Saved successfully'
	END
ELSE
	BEGIN
		set @o_ErrorCode=-1;
		set @o_ErrorDescription='Alredy'
	END
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_raw_material_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_raw_material_purchase] 
    @companyid INT,
    @supplierid INT,
    @date NVARCHAR(255),
    @supplier_bill_no NVARCHAR(255),
    @bill_no NVARCHAR(255),
    @c_balance NVARCHAR(255),
    @credit_days NVARCHAR(255),
    @total NVARCHAR(255),
    @cuid INT,
    @o_ErrorCode INT OUTPUT,
    @o_ErrorDescription VARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRY
        DECLARE @existingCount INT;

        -- Check if the given bill_no already exists for the same companyid
        SELECT @existingCount = COUNT(*)
        FROM raw_material_purchase
        WHERE (bill_no = @bill_no 
		AND companyid = @companyid)
		OR( supplier_bill_no=@supplier_bill_no AND companyid = @companyid)
		;

        IF @existingCount > 0
        BEGIN
            -- If a record with the same bill_no and companyid exists, return error
            SET @o_ErrorCode = -1;
            SET @o_ErrorDescription = 'Alredy';
        END
        ELSE
        BEGIN
            -- Insert into raw_material_purchase table
            INSERT INTO raw_material_purchase (
                companyid,
                supplierid,
                date,
                supplier_bill_no,
                bill_no,
                c_balance,
                credit_days,
                total,
                isactive,
                cuid,
                cdate
            )
            VALUES (
                @companyid,
                @supplierid,
                @date,
                @supplier_bill_no,
                @bill_no,
                @c_balance,
                @credit_days,
                @total,
                1,
                @cuid,
                GETDATE()
            );

            SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
        END
    END TRY
    BEGIN CATCH
        SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_raw_material_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_raw_material_purchase_nested]
    @purchaseid INT,
    @brandid INT,
    @itemid INT,
    @hsn_number NVARCHAR(255),
    @gst_percentage NVARCHAR(255),
    @price NVARCHAR(255),
    @discount NVARCHAR(255),
    @qty NVARCHAR(255),
    @total NVARCHAR(255),
    @cgst_amount NVARCHAR(255),
    @sgst_amount NVARCHAR(255),
    @igst_amount NVARCHAR(255),
    @net_total NVARCHAR(255)
AS
BEGIN 
    INSERT INTO raw_material_purchase_nested (
        purchaseid,
        brandid,
        itemid,
        hsn_number,
        gst_percentage,
        price,
        discount,
        qty,
        total,
        cgst_amount,
        sgst_amount,
        igst_amount,
        net_total
    )
    VALUES (
        @purchaseid,
        @brandid,
        @itemid,
        @hsn_number,
        @gst_percentage,
        @price,
        @discount,
        @qty,
        @total,
        @cgst_amount,
        @sgst_amount,
        @igst_amount,
        @net_total
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_sales_billing]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_sales_billing]
@customerid int,
@date nvarchar(255),
@bill_no nvarchar(255),
@credit_days nvarchar(255),
@balance nvarchar(255),
@billing_address nvarchar(255),
@shipping_address nvarchar(255),
@total nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
begin
begin try
  DECLARE @existingCount INT;
        -- Check if the given bill_no already exists for the same companyid
        SELECT @existingCount = COUNT(*)
        FROM sales_billing
        WHERE (bill_no = @bill_no
        AND companyid = @companyid);
        IF @existingCount > 0
        BEGIN
            -- If a record with the same bill_no and companyid exists, return error
            SET @o_ErrorCode = -1;
            SET @o_ErrorDescription = 'Alredy';
        END
        ELSE
        BEGIN
			insert into sales_billing 
			(
			customerid,
			date,
			bill_no,
			credit_days,
			balance,
			billing_address,
			shipping_address,
			total,
			isactive,
			companyid,
			cuid,
			cdate
			)
			values(
			@customerid,
			@date,
			@bill_no,
			@credit_days,
			@balance,
			@billing_address,
			@shipping_address,
			@total,
			1,
			@companyid,
			@cuid,
			getdate()
			)
  SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
			end
end try
begin catch
    SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

end catch

end
GO
/****** Object:  StoredProcedure [dbo].[Insert_sales_billing_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Insert_sales_billing_nested]
@entryid int,
@stockid int,
@ref_code nvarchar(255),
@si_code nvarchar(255),
@brandid int,
@itemid int,
@hsn_number nvarchar(255),
@gst_percentage nvarchar(255),
@price nvarchar(255),
@discount nvarchar(255),
@qty nvarchar(255),
@total nvarchar(255),
@cgst_amount nvarchar(255),
@sgst_amount nvarchar(255),
@igst_amount nvarchar(255),
@net_total nvarchar(255)
AS
begin
begin try
insert into sales_billing_nested 
		(
		entryid,
		stockid,
		ref_code,
		si_code,
		brandid,
		itemid,
		hsn_number,
		gst_percentage,
		price,
		discount,
		qty,
		total,
		cgst_amount,
		sgst_amount,
		igst_amount,
		net_total
		)
		values(
		@entryid,
		@stockid,
		@ref_code,
		@si_code,
		@brandid,
		@itemid,
		@hsn_number,
		@gst_percentage,
		@price,
		@discount,
		@qty,
		@total,
		@cgst_amount,
		@sgst_amount,
		@igst_amount,
		@net_total
		);
end try
 BEGIN CATCH
        -- Handle the error if necessary
    END CATCH;	
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_sales_billing_nested_nongst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Insert_sales_billing_nested_nongst]
@entryid int,
@stockid int,
@ref_code nvarchar(255),
@si_code nvarchar(255),
@brandid int,
@itemid int,
@hsn_number nvarchar(255),
@price nvarchar(255),
@discount nvarchar(255),
@qty nvarchar(255),
@total nvarchar(255)
AS
begin
begin try
insert into sales_billing_nested_nongst
		(
		entryid,
		stockid,
		ref_code,
		si_code,
		brandid,
		itemid,
		hsn_number,
		price,
		discount,
		qty,
		total
		)
		values(
		@entryid,
		@stockid,
		@ref_code,
		@si_code,
		@brandid,
		@itemid,
		@hsn_number,
		@price,
		@discount,
		@qty,
		@total
		);
end try
 BEGIN CATCH
        -- Handle the error if necessary
    END CATCH;	
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_sales_billing_nongst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_sales_billing_nongst]
@customerid int,
@date nvarchar(255),
@bill_no nvarchar(255),
@credit_days nvarchar(255),
@balance nvarchar(255),
@billing_address nvarchar(255),
@shipping_address nvarchar(255),
@total nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
begin
begin try
  DECLARE @existingCount INT;
        -- Check if the given bill_no already exists for the same companyid
        SELECT @existingCount = COUNT(*)
        FROM sales_billing_nongst
        WHERE (bill_no = @bill_no
        AND companyid = @companyid);
        IF @existingCount > 0
        BEGIN
            -- If a record with the same bill_no and companyid exists, return error
            SET @o_ErrorCode = -1;
            SET @o_ErrorDescription = 'Alredy';
        END
        ELSE
        BEGIN
			insert into sales_billing_nongst 
			(
			customerid,
			date,
			bill_no,
			credit_days,
			balance,
			billing_address,
			shipping_address,
			total,
			isactive,
			companyid,
			cuid,
			cdate
			)
			values(
			@customerid,
			@date,
			@bill_no,
			@credit_days,
			@balance,
			@billing_address,
			@shipping_address,
			@total,
			1,
			@companyid,
			@cuid,
			getdate()
			)
  SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
			end
end try
begin catch
    SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

end catch

end
GO
/****** Object:  StoredProcedure [dbo].[Insert_sales_billing_returnDebit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[Insert_sales_billing_returnDebit]
@entryid int,
@customerid int,
@bill_date nvarchar(255),
@invoice_no nvarchar(255),
@invoice_date nvarchar(255),
@return_no nvarchar(255),
@return_date nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRY
IF(select count(*) from sales_billing_returnDebit where (invoice_no=@invoice_no and companyid=@companyid)or(return_no=@return_no and companyid=@companyid))<1
	BEGIN
		insert into sales_billing_returnDebit(
		 entryid,
		 customerid,
		 bill_date,
		 invoice_no,
		 invoice_date,
		 return_no,
		 return_date,
		 total,
		 return_total,
		 isactive,
		 companyid,
		 cuid,
		 cdate

		)Values(
		 @entryid,
		 @customerid,
		 @bill_date,
		 @invoice_no,
		 @invoice_date,
		 @return_no,
		 @return_date,
		 @total,
		 @return_total,
		 1,
		 @companyid,
		 @cuid,
		 GETDATE()
		);

		--Update sales_billing set total=CAST(CAST(@total as float )-CAST(@return_total as float) as nvarchar(255))
		-- where entryid=@entryid;

       SET @o_ErrorCode = @@IDENTITY;
       SET @o_ErrorDescription = 'Saved successfully';
	END
ELSE
	BEGIN
		SET @o_ErrorCode = -1;
       SET @o_ErrorDescription = 'Alredy';
	END
END TRY
BEGIN CATCH
    SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_sales_billing_returnDebit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[Insert_sales_billing_returnDebit_nested]
@returndebit_id int,
@entry_n_id int,
@entryid int,
@ref_code nvarchar(255),
@si_code nvarchar(255),
@brandid nvarchar(255),
@itemid nvarchar(255),
@hsn_number nvarchar(255),
@gst_percentage nvarchar(255),
@price nvarchar(255),
@discount nvarchar(255),
@qty nvarchar(255),
@return_qty nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@cgst_amount nvarchar(255),
@return_cgst_amount nvarchar(255),
@sgst_amount nvarchar(255),
@return_sgst_amount nvarchar(255),
@igst_amount nvarchar(255),
@return_igst_amount nvarchar(255),
@net_total nvarchar(255),
@return_net_total nvarchar(255)

AS
BEGIN

INSERT INTO sales_billing_returnDebit_nested(
returndebit_id,
entry_n_id,
entryid,
ref_code,
si_code,
brandid,
itemid,
hsn_number,
gst_percentage,
price,
discount,
qty,
return_qty,
total,
return_total,
cgst_amount,
return_cgst_amount,
sgst_amount,
return_sgst_amount,
igst_amount,
return_igst_amount,
net_total,
return_net_total
)
Values(
@returndebit_id,
@entry_n_id ,
@entryid ,
@ref_code,
@si_code ,
@brandid ,
@itemid ,
@hsn_number,
@gst_percentage,
@price,
@discount,
@qty,
@return_qty,
@total,
@return_total,
@cgst_amount,
@return_cgst_amount,
@sgst_amount,
@return_sgst_amount,
@igst_amount,
@return_igst_amount,
@net_total,
@return_net_total
)


--   UPDATE sales_billing_nested
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255)),
--    cgst_amount = CAST((CAST(@cgst_amount AS float) - CAST(@return_cgst_amount AS float)) AS nvarchar(255)),
--    sgst_amount = CAST((CAST(@sgst_amount AS float) - CAST(@return_sgst_amount AS float)) AS nvarchar(255)),
--    igst_amount = CAST((CAST(@igst_amount AS float) - CAST(@return_igst_amount AS float)) AS nvarchar(255)),
--    net_total = CAST((CAST(@net_total AS float) - CAST(@return_net_total AS float)) AS nvarchar(255))
--WHERE entry_n_id = @entry_n_id;

END

GO
/****** Object:  StoredProcedure [dbo].[Insert_sales_billingNongst_returnDebit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[Insert_sales_billingNongst_returnDebit]
@entryid int,
@customerid int,
@bill_date nvarchar(255),
@invoice_no nvarchar(255),
@invoice_date nvarchar(255),
@return_no nvarchar(255),
@return_date nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRY
	IF(select count(*) from sales_billingNongst_returnDebit where (invoice_no=@invoice_no and companyid=@companyid)or(return_no=@return_no and companyid=@companyid))<1
		BEGIN
			insert into sales_billingNongst_returnDebit(
			 entryid,
			 customerid,
			 bill_date,
			 invoice_no,
			 invoice_date,
			 return_no,
			 return_date,
			 total,
			 return_total,
			 isactive,
			 companyid,
			 cuid,
			 cdate

			)Values(
			 @entryid,
			 @customerid,
			 @bill_date,
			 @invoice_no,
			 @invoice_date,
			 @return_no,
			 @return_date,
			 @total,
			 @return_total,
			 1,
			 @companyid,
			 @cuid,
			 GETDATE()
			);
			--update sales_billing_nongst set total=CAST(CAST(@total as float)-CAST(@return_total as float) as nvarchar(255))
			--where entryid=@entryid;

			SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
		END
	ELSE
	BEGIN
		SET @o_ErrorCode = -1;
       SET @o_ErrorDescription = 'Alredy';
	END
END TRY
BEGIN CATCH
    SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_sales_billingNongst_returnDebit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[Insert_sales_billingNongst_returnDebit_nested]
@returndebit_id int,
@entry_n_id int,
@entryid int,
@ref_code nvarchar(255),
@si_code nvarchar(255),
@brandid nvarchar(255),
@itemid nvarchar(255),
@hsn_number nvarchar(255),
@price nvarchar(255),
@discount nvarchar(255),
@qty nvarchar(255),
@return_qty nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255)

AS
BEGIN

INSERT INTO sales_billingNongst_returnDebit_nested(
returndebit_id,
entry_n_id,
entryid,
ref_code,
si_code,
brandid,
itemid,
hsn_number,
price,
discount,
qty,
return_qty,
total,
return_total
)
Values(
@returndebit_id,
@entry_n_id ,
@entryid ,
@ref_code,
@si_code ,
@brandid ,
@itemid ,
@hsn_number,
@price,
@discount,
@qty,
@return_qty,
@total,
@return_total
)


--   UPDATE sales_billing_nested_nongst
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255))
--WHERE entry_n_id = @entry_n_id;

END

GO
/****** Object:  StoredProcedure [dbo].[insert_supplier_advance]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[insert_supplier_advance]
@supplierid int,
@date nvarchar(255),
@advance_amount nvarchar(255),
@description nvarchar(1255)
AS
BEGIN
	insert into supplier_advance (supplierid,date,advance_amount,description)values(@supplierid,@date,@advance_amount,@description)
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_supplier_debit_note]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_supplier_debit_note]
@purchaseid int,
@supplierid int,
@supplier_bill_no nvarchar(255),
@date nvarchar(255),
@return_no nvarchar(255),
@return_date nvarchar(255),
@gst_in nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
Begin
begin try
	IF(select count(*) from supplier_debit_note where (companyid=@companyid and return_no=@return_no)or (companyid=@companyid and supplier_bill_no=@supplier_bill_no))<1
		BEGIN
			insert into supplier_debit_note(
				 purchaseid ,
				 supplierid,
				 supplier_bill_no,
				 date ,
				 return_no,
				 return_date,
				 gst_in,
				 total,
				 return_total,
				 isactive,
				 companyid,
				 cuid,
				 cdate
				 )
				 Values(
				 @purchaseid,
				@supplierid ,
				@supplier_bill_no ,
				@date ,
				@return_no,
				@return_date,
				@gst_in,
				@total,
				@return_total,
				1,
				@companyid,
				@cuid,
				GETDATE()
				 )
				SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
		END
	ELSE
		BEGIN
			SET @o_ErrorCode = -1;
            SET @o_ErrorDescription = 'Alredy';
		END
end try
begin catch
 SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

end catch
End
GO
/****** Object:  StoredProcedure [dbo].[Insert_supplier_debit_note_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_supplier_debit_note_nested]
@purchase_n_id int,
@s_debitid int,
@brandid int,
@itemid int,
@hsn_number nvarchar(255),
@gst_percentage nvarchar(255),
@price nvarchar(255),
@discount nvarchar(255),
@qty nvarchar(255),
@return_qty nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@cgst_amount nvarchar(255),
@return_cgst_amount nvarchar(255),
@sgst_amount nvarchar(255),
@return_sgst_amount nvarchar(255),
@igst_amount nvarchar(255),
@return_igst_amount nvarchar(255),
@net_total nvarchar(255),
@return_net_total nvarchar(255)
AS
BEGin
insert into supplier_debit_note_nested (
purchase_n_id,
s_debitid,
brandid,
itemid,
hsn_number,
gst_percentage,
price,
discount,
qty,
return_qty,
total,
return_total,
cgst_amount,
return_cgst_amount,
sgst_amount,
return_sgst_amount,
igst_amount,
return_igst_amount,
net_total,
return_net_total

)Values(
@purchase_n_id,
@s_debitid ,
@brandid ,
@itemid ,
@hsn_number ,
@gst_percentage ,
@price ,
@discount,
@qty,
@return_qty,
@total,  
@return_total,
@cgst_amount,
@return_cgst_amount,
@sgst_amount,
@return_sgst_amount,
@igst_amount,
@return_igst_amount,
@net_total,
@return_net_total
)

 
--   UPDATE raw_material_purchase_nested
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255)),
--    cgst_amount = CAST((CAST(@cgst_amount AS float) - CAST(@return_cgst_amount AS float)) AS nvarchar(255)),
--    sgst_amount = CAST((CAST(@sgst_amount AS float) - CAST(@return_sgst_amount AS float)) AS nvarchar(255)),
--    igst_amount = CAST((CAST(@igst_amount AS float) - CAST(@return_igst_amount AS float)) AS nvarchar(255)),
--    net_total = CAST((CAST(@net_total AS float) - CAST(@return_net_total AS float)) AS nvarchar(255))
--WHERE purchase_n_id = @purchase_n_id;

END
GO
/****** Object:  StoredProcedure [dbo].[Insert_supplier_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_supplier_master]
@supplier_name nvarchar(255),
@mobile_no nvarchar(255),
@state nvarchar(255),
@state_code nvarchar(255),
@gst_in nvarchar(255),
@balance nvarchar(255),
@address nvarchar(255),
@shipping_address nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin 
begin try
declare @count int;
set @count=(select count(*) from supplier_master where companyid=@companyid and isactive=1 and supplier_name=@supplier_name)
	IF(@count<1)
		BEGIN
		insert into supplier_master(
			supplier_name,
			mobile_no,
			state,
			state_code,
			gst_in,
			balance,			
			address,
			shipping_address,
			companyid,
			isactive,
			cuid,
			cdate
		)values(
			@supplier_name,
			@mobile_no,
			@state,
			@state_code,
			@gst_in,
			@balance,			
			@address,
			@shipping_address,
			@companyid,
			1,
			@cuid,
			getdate()
		)
		set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Saved successfully'
			END
			ELSE
				BEGIN
				set @o_ErrorCode=-1;
				set @o_ErrorDescription='Alredy'
				END
end try
begin catch 
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_supplier_payment]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_supplier_payment]
@supplierid int,
@date nvarchar(255),
@balance nvarchar(255),
@advanceid nvarchar(255),
@amount_mode nvarchar(255),
@payment_type nvarchar(255),
@cheque_no nvarchar(255),
@c_date nvarchar(255),
@c_amount nvarchar(255),
@adnp_amount nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRY
            INSERT INTO supplier_payment(
                supplierid,
                date,
                balance,
				advanceid,
                amount_mode,
                payment_type,
                cheque_no,
                c_date,
                c_amount,
				adnp_amount,
				companyid,
                isactive,
                cuid,
                cdate
            )
            VALUES (
                @supplierid,
                @date,
                @balance,
				@advanceid,
                @amount_mode,
                @payment_type,
                @cheque_no,
                @c_date,
                @c_amount,
				@adnp_amount,
				@companyid,
                1,
                @cuid,
                getdate()
            );
            SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
    END TRY
    BEGIN CATCH
        SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
    END CATCH	
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_supplier_payment_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_supplier_payment_nested]
 @paymentid int,
 @supplierid int,
 @purchaseid int,
 @total_amount nvarchar(255),
 @deduction_amount nvarchar(255),
 @isbill bit,
 @isbal bit
AS
BEGIN
            INSERT INTO supplier_payment_nested(
			   paymentid,
			   supplierid,
			   purchaseid,
			   total_amount,
			   deduction_amount,
			   isbill,
			   isbal
            )
            VALUES (
               @paymentid,
			   @supplierid,
			   @purchaseid,
			   @total_amount,
			   @deduction_amount,
			   @isbill,
			   @isbal
            );


			IF(@isbal=1)
				BEGIN
					update supplier_master 
					set balance=CAST(CAST(ISNULL(balance,0) as decimal(10,2)) - CAST(@deduction_amount as decimal(10,2)) as nvarchar(255))
					where supplierid=@supplierid
				END
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_third_party_gst_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_third_party_gst_purchase] 
    @third_partyid int,              
    @date nvarchar(255),
    @invoice_no nvarchar(255),
    @bill_no nvarchar(255),
    @c_balance nvarchar(255),
    @credit_days nvarchar(255),
    @total nvarchar(255),
	@companyid int,
    @cuid int,               
    @o_ErrorCode INT OUTPUT,
    @o_ErrorDescription VARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRY
        DECLARE @existingCount INT;

        -- Check if the given bill_no already exists for the same companyid
        SELECT @existingCount = COUNT(*)
        FROM third_party_gst_purchase
        WHERE (bill_no = @bill_no
        AND companyid = @companyid)OR
		(invoice_no=@invoice_no AND
		companyid=@companyid);

        IF @existingCount > 0
        BEGIN
            -- If a record with the same bill_no and companyid exists, return error
            SET @o_ErrorCode = -1;
            SET @o_ErrorDescription = 'Alredy';
        END
        ELSE
        BEGIN           
            INSERT INTO third_party_gst_purchase(
                third_partyid,              
                date,
                invoice_no,
                bill_no,
                c_balance,
                credit_days,
                total,
                isactive,
				companyid,
                cuid,
                cdate
            )
            VALUES (
                 @third_partyid,              
                @date,
                @invoice_no,
                @bill_no,
                @c_balance,
                @credit_days,
                @total,
                1,
				@companyid,
                @cuid,
                getdate()
            );

            SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
        END
    END TRY
    BEGIN CATCH
        SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_third_party_gst_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_third_party_gst_purchase_nested]
@purchaseid int,
@date nvarchar(255),
@si_code nvarchar(255),
@ref_code nvarchar(255),
@brandid int,
@itemid int,
@hsn_number nvarchar(255),
@gst_percentage nvarchar(255),
@price nvarchar(255),
@discount nvarchar(255),
@qty nvarchar(255),
@total nvarchar(255),
@cgst_amount nvarchar(255),
@sgst_amount nvarchar(255),
@igst_amount nvarchar(255),
@net_total nvarchar(255),
@companyid int
AS
BEGIN 
declare @id int;
declare @description nvarchar(255);
declare @fromdate nvarchar(255);
declare @todate nvarchar(255);
declare @count int;
begin try
	set @fromdate = (select fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
	set @todate = (select todate from financial_year where isactive=1 and status=1 and companyid=@companyid);

	set @count=(select count(wpn.si_code) from third_party_gst_purchase wp
	inner join third_party_gst_purchase_nested wpn on wpn.purchaseid=wp.purchaseid
	where wpn.si_code=@si_code and wp.date >= @fromdate and wp.date <=@todate and wp.companyid=@companyid)+(
	select count(si_code) from stock_table where si_code=@si_code and date >= @fromdate and date <=@todate and companyid=@companyid);

	IF(@count<1)
		BEGIN
			INSERT INTO third_party_gst_purchase_nested(
				purchaseid,
				si_code,
				ref_code,
				brandid,
				itemid,
				hsn_number,
				gst_percentage,
				price,
				discount,
				qty,
				total,
				cgst_amount,
				sgst_amount,
				igst_amount,
				net_total
			)
			VALUES (
				@purchaseid,
				@si_code,
				@ref_code,
				@brandid,
				@itemid,
				@hsn_number,
				@gst_percentage,
				@price,
				@discount,
				@qty,
				@total,
				@cgst_amount,
				@sgst_amount,
				@igst_amount,
				@net_total
			);
			set @id=@@IDENTITY;
			set @description='Success';
		END
end try 
begin catch
		-- error
end catch
	IF (@description='Success' and @id>0)
			BEGIN
				 INSERT INTO stock_table(  
					purchase_n_id,
					purchaseid,
					date,
					si_code,
					ref_code,
					brandid,
					itemid,
					hsn_number,
					gst_percentage,
					price,
					discount,
					qty,
					total,
					cgst_amount,
					sgst_amount,
					igst_amount,
					net_total,
					third_party_gst,
					third_party_nongst,
					weavers,
					companyid,
					isactive,
					activestatus
				)
				VALUES (    
					@id,
					@purchaseid,
					@date,
					@si_code,
					@ref_code,
					@brandid,
					@itemid,
					@hsn_number,
					@gst_percentage,
					@price,
					@discount,
					@qty,
					@total,
					@cgst_amount,
					@sgst_amount,
					@igst_amount,
					@net_total,
					1,
					0,
					0,
					@companyid,
					1,
					1
				);
			END
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_third_party_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_third_party_master]
@party_name nvarchar(255),
@short_code nvarchar(255),
@mobile nvarchar(255),
@state nvarchar(255),
@state_code nvarchar(255),
@address nvarchar(max),
@balance nvarchar(255),
@gst_in nvarchar(255),
@companyid nvarchar(255),
@cuid int,			
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
declare @count int;
set @count=(select count(*) from third_party_master where companyid=@companyid and isactive=1 and party_name=@party_name)
	IF(@count<1)
		BEGIN
				insert into third_party_master(
					party_name,
					short_code,
					mobile,
					state,
					state_code,
					address,
					balance,
					gst_in,
					isactive,
					companyid,
					cuid,
					cdate
				)values(
					@party_name,
					@short_code,
					@mobile,
					@state,
					@state_code,
					@address,
					@balance,
					@gst_in,
					1,
					@companyid,
					@cuid,
					getdate()
				)
					set @o_ErrorCode=@@IDENTITY;
					set @o_ErrorDescription='Saved successfully'
		END
	ELSE
		BEGIN
			set @o_ErrorCode=-1;
			set @o_ErrorDescription='Alredy'
		END
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_third_party_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_third_party_purchase]
    @third_partyid int,
    @date nvarchar(255),
    @invoice_no nvarchar(255),
    @bill_no nvarchar(255),
	@c_balance nvarchar(255), 
    @credit_days nvarchar(255),
    @total nvarchar(255),
	@companyid int,
    @cuid int,
    @o_ErrorCode INT OUTPUT,
    @o_ErrorDescription VARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRY
        DECLARE @existingCount INT;
        -- Check if the given bill_no already exists for the same companyid
        SELECT @existingCount = COUNT(*)
        FROM third_party_purchase
        WHERE (bill_no = @bill_no
        AND companyid = @companyid)
        IF @existingCount > 0
        BEGIN
            -- If a record with the same bill_no and companyid exists, return error
            SET @o_ErrorCode = -1;
            SET @o_ErrorDescription = 'Alredy';
        END
        ELSE
        BEGIN
            INSERT INTO third_party_purchase (
                third_partyid,
                date,
                invoice_no,
                bill_no,
                c_balance,
                credit_days,
                total,
                isactive,
				companyid,
                cuid,
                cdate
            )
            VALUES (
                 @third_partyid,
                @date,
                @invoice_no,
                @bill_no,
               @c_balance,
                @credit_days,
                @total,
                1,
				@companyid,
                @cuid,
                getdate()
            );
            SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
        END
    END TRY
    BEGIN CATCH
        SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_third_partyPurchasegst_debit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[Insert_third_partyPurchasegst_debit]
@purchaseid int,
@third_partyid int,
@purchase_date nvarchar(255),
@invoice_no nvarchar(255),
@invoice_date nvarchar(255),
@return_no nvarchar(255),
@return_date nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRY
	IF(select count(*) from third_partyPurchasegst_debit where return_no=@return_no or purchaseid=@purchaseid)<1
		BEGIN
				insert into third_partyPurchasegst_debit(
					 purchaseid,
					 third_partyid,
					 purchase_date,
					 invoice_no,
					 invoice_date,
					 return_no,
					 return_date,
					 total,
					 return_total,
					 isactive,
					 companyid,
					 cuid,
					 cdate

					)Values(
					 @purchaseid,
					 @third_partyid,
					 @purchase_date,
					 @invoice_no,
					 @invoice_date,
					 @return_no,
					 @return_date,
					 @total,
					 @return_total,
					 1,
					 @companyid,
					 @cuid,
					 GETDATE()
					);
					SET @o_ErrorCode = @@IDENTITY;
					SET @o_ErrorDescription = 'Saved successfully';
		END
	ELSE
		BEGIN
			SET @o_ErrorCode = -1;
			SET @o_ErrorDescription = 'Alredy';
		END
       
END TRY
BEGIN CATCH
    SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_third_partyPurchasegst_debit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[Insert_third_partyPurchasegst_debit_nested]
@thirdPartyDebitid int,
@purchase_n_id int,
@purchaseid int,
@ref_code nvarchar(255),
@si_code nvarchar(255),
@brandid nvarchar(255),
@itemid nvarchar(255),
@hsn_number nvarchar(255),
@gst_percentage nvarchar(255),
@price nvarchar(255),
@discount nvarchar(255),
@qty nvarchar(255),
@return_qty nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@cgst_amount nvarchar(255),
@return_cgst_amount nvarchar(255),
@sgst_amount nvarchar(255),
@return_sgst_amount nvarchar(255),
@igst_amount nvarchar(255),
@return_igst_amount nvarchar(255),
@net_total nvarchar(255),
@return_net_total nvarchar(255)

AS
BEGIN

INSERT INTO third_partyPurchasegst_debit_nested(
thirdPartyDebitid,
purchase_n_id,
purchaseid,
ref_code,
si_code,
brandid,
itemid,
hsn_number,
gst_percentage,
price,
discount,
qty,
return_qty,
total,
return_total,
cgst_amount,
return_cgst_amount,
sgst_amount,
return_sgst_amount,
igst_amount,
return_igst_amount,
net_total,
return_net_total
)
Values(
@thirdPartyDebitid,
@purchase_n_id ,
@purchaseid ,
@ref_code,
@si_code ,
@brandid ,
@itemid ,
@hsn_number,
@gst_percentage,
@price,
@discount,
@qty,
@return_qty,
@total,
@return_total,
@cgst_amount,
@return_cgst_amount,
@sgst_amount,
@return_sgst_amount,
@igst_amount,
@return_igst_amount,
@net_total,
@return_net_total
)


--   UPDATE third_party_gst_purchase_nested
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255)),
--    cgst_amount = CAST((CAST(@cgst_amount AS float) - CAST(@return_cgst_amount AS float)) AS nvarchar(255)),
--    sgst_amount = CAST((CAST(@sgst_amount AS float) - CAST(@return_sgst_amount AS float)) AS nvarchar(255)),
--    igst_amount = CAST((CAST(@igst_amount AS float) - CAST(@return_igst_amount AS float)) AS nvarchar(255)),
--    net_total = CAST((CAST(@net_total AS float) - CAST(@return_net_total AS float)) AS nvarchar(255))
--WHERE purchase_n_id = @purchase_n_id;

-- UPDATE stock_table
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255)),
--    cgst_amount = CAST((CAST(@cgst_amount AS float) - CAST(@return_cgst_amount AS float)) AS nvarchar(255)),
--    sgst_amount = CAST((CAST(@sgst_amount AS float) - CAST(@return_sgst_amount AS float)) AS nvarchar(255)),
--    igst_amount = CAST((CAST(@igst_amount AS float) - CAST(@return_igst_amount AS float)) AS nvarchar(255)),
--    net_total = CAST((CAST(@net_total AS float) - CAST(@return_net_total AS float)) AS nvarchar(255))
--WHERE purchase_n_id = @purchase_n_id AND third_party_gst=1;

END

GO
/****** Object:  StoredProcedure [dbo].[Insert_third_partyPurchaseNongst_debit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[Insert_third_partyPurchaseNongst_debit]
@purchaseid int,
@third_partyid int,
@purchase_date nvarchar(255),
@invoice_no nvarchar(255),
@invoice_date nvarchar(255),
@return_no nvarchar(255),
@return_date nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
BEGIN
BEGIN TRY
		IF(select count(*) from third_partyPurchaseNongst_debit where return_no=@return_no or purchaseid=@purchaseid)<1
			BEGIN
				insert into third_partyPurchaseNongst_debit(
				 purchaseid,
				 third_partyid,
				 purchase_date,
				 invoice_no,
				 invoice_date,
				 return_no,
				 return_date,
				 total,
				 return_total,
				 isactive,
				 companyid,
				 cuid,
				 cdate

				)Values(
				@purchaseid ,
				@third_partyid,
				@purchase_date,
				 @invoice_no,
				 @invoice_date,
				 @return_no,
				 @return_date,
				 @total,
				 @return_total,
				 1,
				 @companyid,
				 @cuid,
				 GETDATE()
				);
				SET @o_ErrorCode = @@IDENTITY;
				SET @o_ErrorDescription = 'Saved successfully';
			END
		ELSE
		BEGIN
			SET @o_ErrorCode = -1;
			SET @o_ErrorDescription = 'Alredy';
		END

--update third_party_purchase set total=CAST(CAST(@total as float)-CAST(@return_total as float) as nvarchar(255))
--where purchaseid=@purchaseid;

       
END TRY
BEGIN CATCH
    SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_third_partyPurchaseNongst_debit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[Insert_third_partyPurchaseNongst_debit_nested]
@thirdPartyDebitid int,
@purchase_n_id int,
@purchaseid int,
@ref_code nvarchar(255),
@si_code nvarchar(255),
@brandid nvarchar(255),
@itemid nvarchar(255),
@hsn_number nvarchar(255),
@price nvarchar(255),
@discount nvarchar(255),
@qty nvarchar(255),
@return_qty nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255)

AS
BEGIN

INSERT INTO third_partyPurchaseNongst_debit_nested(
thirdPartyDebitid,
purchase_n_id,
purchaseid,
ref_code,
si_code,
brandid,
itemid,
hsn_number,
price,
discount,
qty,
return_qty,
total,
return_total
)
Values(
@thirdPartyDebitid,
@purchase_n_id,
@purchaseid,
@ref_code,
@si_code ,
@brandid ,
@itemid ,
@hsn_number,
@price,
@discount,
@qty,
@return_qty,
@total,
@return_total
)


--   UPDATE third_party_purchase_nested
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255))
--WHERE purchase_n_id = @purchase_n_id;


--   UPDATE stock_table
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255))
--WHERE purchase_n_id = @purchase_n_id AND third_party_nongst=1;

END

GO
/****** Object:  StoredProcedure [dbo].[insert_thirdparty_advance]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insert_thirdparty_advance]
@third_partyid int,
@date nvarchar(255),
@advance_amount nvarchar(255),
@description nvarchar(1255)
AS
BEGIN
	insert into thirdparty_advance(third_partyid,date,advance_amount,description)values(@third_partyid,@date,@advance_amount,@description)
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_thirdparty_payment]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_thirdparty_payment]
@third_partyid int,
@date nvarchar(255),
@balance nvarchar(255),
@amount_mode nvarchar(255),
@payment_type nvarchar(255),
@cheque_no nvarchar(255),
@c_date nvarchar(255),
@c_amount nvarchar(255),
@companyid int,
@cuid int,
@advanceid int,
@adnp_amount nvarchar(255),
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
BEGIN
    BEGIN TRY
            INSERT INTO thirdparty_payment(
                third_partyid,
                date,
                balance,
                amount_mode,
                payment_type,
                cheque_no,
                c_date,
                c_amount,
				companyid,
                isactive,
                cuid,
                cdate,
				advanceid,
				adnp_amount
            )
            VALUES (
                @third_partyid,
                @date,
                @balance,
                @amount_mode,
                @payment_type,
                @cheque_no,
                @c_date,
                @c_amount,
				@companyid,
                1,
                @cuid,
                getdate(),
				@advanceid,
				@adnp_amount
            );
            SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
    END TRY
    BEGIN CATCH
        SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_thirdparty_payment_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_thirdparty_payment_nested]
 @paymentid int,
 @purchaseid int,
 @third_partyid int,
 @total_amount nvarchar(255),
 @deduction_amount nvarchar(255),
 @gst bit,
 @non_gst bit,
 @isbal bit
AS
BEGIN
            INSERT INTO thirdparty_payment_nested(
			   paymentid,
			   purchaseid,
			   third_partyid,
			   total_amount,
			   deduction_amount,
			   gst,
			   non_gst,
			   isbal
            )
            VALUES (
               @paymentid,
			   @purchaseid,
			   @third_partyid,
			   @total_amount,
			   @deduction_amount,
			   @gst,
			   @non_gst,
			   @isbal
            );

			IF(@isbal=1)
				BEGIN
					update third_party_master 
					set balance=CAST(TRY_CAST(ISNULL(balance,0) as decimal(10,2)) - CAST(@deduction_amount as decimal(10,2)) as nvarchar(255))
					where third_partyid=@third_partyid
				END
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_thirthird_party_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_thirthird_party_purchase_nested]
@purchaseid int,
@date nvarchar(255),
@si_code nvarchar(255),
@ref_code nvarchar(255),
@brandid int,
@itemid int,
@hsn_number nvarchar(255),
@price nvarchar(255),
@discount nvarchar(255),
@qty nvarchar(255),
@total nvarchar(255),
@companyid int
AS
BEGIN
declare @id int;
declare @description nvarchar(255);
declare @fromdate nvarchar(255);
declare @todate nvarchar(255);
declare @count int;
begin try
	set @fromdate = (select fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
	set @todate = (select todate from financial_year where isactive=1 and status=1 and companyid=@companyid);

	set @count=(select count(wpn.si_code) from third_party_purchase wp
	inner join third_party_purchase_nested wpn on wpn.purchaseid=wp.purchaseid
	where wpn.si_code=@si_code and wp.date >= @fromdate and wp.date <=@todate and wp.companyid=@companyid)+(
	select count(si_code) from stock_table where si_code=@si_code and date >= @fromdate and date <=@todate and companyid=@companyid);

	IF(@count<1)
		BEGIN
			INSERT INTO third_party_purchase_nested(
				purchaseid,
				si_code,
				ref_code,
				brandid,
				itemid,
				hsn_number,
				price,
				discount,
				qty,
				total
			)
			VALUES (
				@purchaseid,
				@si_code,
				@ref_code,
				@brandid,
				@itemid,
				@hsn_number,
				@price,
				@discount,
				@qty,
				@total
			);
			set @id=@@IDENTITY;
			set @description='Success';
		END
end try 

begin catch
	-- 
end catch
	IF (@description='Success' and @id>0)
			BEGIN
			 INSERT INTO stock_table(    
				purchase_n_id,
				purchaseid,
				date,
				si_code,
				ref_code,
				brandid,
				itemid,
				hsn_number,
				price,
				discount,
				qty,
				total,
				third_party_gst,
				third_party_nongst,
				weavers,
				companyid,
				isactive,
				activestatus
			)
			VALUES (   
				@id,
				@purchaseid,
				@date,
				@si_code,
				@ref_code,
				@brandid,
				@itemid,
				@hsn_number,
				@price,
				@discount,
				@qty,
				@total,
				0,
				1,
				0,
				@companyid,
				1,
				1
			);
		END
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_unit_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_unit_master]
@companyid int,
@unit_name nvarchar(255),
@unit_code nvarchar(255),
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
declare @count int;
set @count=(select count(*) from unit_master where companyid=@companyid and isactive=1 and unit_code=@unit_code)
IF(@count<1)
	BEGIN
		insert into unit_master(
		companyid,
		unit_name,
		unit_code,
		isactive,
		cuid,
		cdate
		) values(
		@companyid,
		@unit_name,
		@unit_code,
		1,
		@cuid,
		GETDATE()
		)
		set @o_ErrorCode=@@IDENTITY;
		set @o_ErrorDescription='Saved successfully'
	END
ELSE
	BEGIN
		set @o_ErrorCode=-1;
		set @o_ErrorDescription='Alredy'
	END
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_user_profile]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_user_profile]
    @user_name nvarchar(255),
    @companyid int,
    @phone nvarchar(255),
    @email nvarchar(255),
    @password nvarchar(255),
    @m_companyid nvarchar(255),
    @s_companyid nvarchar(255),
    @img nvarchar(max),
    @cuid int,
	@sub_menus nvarchar(max),
	@main_menus nvarchar(max),
    @o_ErrorCode int OUTPUT,
    @o_ErrorDescription varchar(250) OUTPUT
AS
BEGIN
    BEGIN TRY
        -- Check if username already exists and is active
        IF EXISTS (SELECT 1 FROM user_profile WHERE email = @email AND isactive = 1)
        BEGIN
            SET @o_ErrorCode = -1;
            SET @o_ErrorDescription = 'User Already exists';
        END
        ELSE
        BEGIN
            -- Insert the user profile if username doesn't exist or is not active
            INSERT INTO user_profile (
                companyid,
                user_name,
                phone,
                email,
                password,
                m_companyid,
                s_companyid,
                img,
                isactive,
                cuid,
                cdate,
				sub_menus,
				main_menus
            )
            VALUES (
                @companyid,
                @user_name,
                @phone,
                @email,
                @password,
                @m_companyid,
                @s_companyid,
                @img,
                1, -- Assuming 1 indicates active status
                @cuid,
                GETDATE(),
				@sub_menus,
				@main_menus
            );

            SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
        END
    END TRY
    BEGIN CATCH
        SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[Insert_weaver_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_weaver_master]
@weaver_name nvarchar(255),
@short_code nvarchar(255),
@mobile nvarchar(255),
@address nvarchar(max),
@state nvarchar(255),
@state_code nvarchar(255),
@balance nvarchar(255),
@companyid nvarchar(255),
@cuid int,			
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
declare @count int;
set @count=(select count(*) from weaver_master where companyid=@companyid and isactive=1 and weaver_name=@weaver_name)
	IF(@count<1)
		BEGIN
			insert into weaver_master(
				weaver_name,
				short_code,
				mobile,
				address,
				state,
				state_code,
				balance,
				companyid,
				isactive,
				cuid,
				cdate
			)values(
				@weaver_name,
				@short_code,
				@mobile,
				@address,
				@state,
				@state_code,
				@balance,
				@companyid,
				1,
				@cuid,
				getdate()
			)
				set @o_ErrorCode=@@IDENTITY;
				set @o_ErrorDescription='Saved successfully'
		END
	ELSE
		BEGIN
			set @o_ErrorCode=-1;
				set @o_ErrorDescription='Alredy'
		END
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[insert_weavers_nested_received]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insert_weavers_nested_received]
@purchaseid int,
@date nvarchar(255),
@si_code nvarchar(255),
@ref_code nvarchar(255),
@brandid int,
@itemid int,
@qty nvarchar(255),
@companyid int,
@r_gram nvarchar(255),
@r_advance nvarchar(255),
@description nvarchar(1255)
AS
begin
declare @id int;
declare @descriptionstatus nvarchar(255);
declare @fromdate nvarchar(255);
declare @todate nvarchar(255);
declare @count int;
begin try

	set @fromdate = (select fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
	set @todate = (select todate from financial_year where isactive=1 and status=1 and companyid=@companyid);

	set @count=(select count(wpn.si_code) from weavers_purchase wp
	inner join weavers_purchase_nested wpn on wpn.purchaseid=wp.purchaseid
	where wpn.si_code=@si_code and wp.date >= @fromdate and wp.date <=@todate and wp.companyid=@companyid)+(
	select count(si_code) from stock_table where si_code=@si_code and date >= @fromdate and date <=@todate and companyid=@companyid);

	IF(@count<1)
		BEGIN
			insert into weavers_purchase_nested 
			(
			purchaseid,
			si_code,
			ref_code,
			brandid,
			itemid,
			qty,			
			r_gram,
			r_advance,
			description
			)
			values(
			@purchaseid,
			@si_code,
			@ref_code,
			@brandid,
			@itemid,
			@qty,			
			@r_gram,
			@r_advance,
			@description
			);
			set @id=@@IDENTITY;
			set @descriptionstatus='Success'
		END
end try
BEGIN CATCH
  -- Handle the error if necessary
END CATCH;
		IF (@descriptionstatus='Success' and @id>0)
			BEGIN
				insert into stock_table 
				(
				purchase_n_id,
				purchaseid,
				date,
				si_code,
				ref_code,
				brandid,
				itemid,		
				qty,
				third_party_gst,
				third_party_nongst,
				weavers,
				companyid,
				isactive,
				activestatus
				)
				values(
				@id,
				@purchaseid,
				@date,
				@si_code,
				@ref_code,
				@brandid,
				@itemid,		
				@qty,
				0,
				0,
				1,
				@companyid,
				1,
				1
				);
			END		
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_weavers_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_weavers_purchase]
@weaverid int,
@date nvarchar(255),
@companyid int,
@cuid int,
  @o_ErrorCode INT OUTPUT,
    @o_ErrorDescription VARCHAR(250) OUTPUT
AS
begin
begin try
insert into weavers_purchase 
(
weaverid,
date,
isactive,
companyid,
cuid,
cdate
)
values(
@weaverid,
@date,
1,
@companyid,
@cuid,
GETDATE()

)
  SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';

end try
begin catch
    SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

end catch

end
GO
/****** Object:  StoredProcedure [dbo].[Insert_weavers_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insert_weavers_purchase_nested]
@purchaseid int,
@date nvarchar(255),
@si_code nvarchar(255),
@ref_code nvarchar(255),
@brandid int,
@itemid int,
@qty nvarchar(255),
@companyid int
AS
begin
declare @id int;
declare @description nvarchar(255);
declare @fromdate nvarchar(255);
declare @todate nvarchar(255);
declare @count int;
begin try

	set @fromdate = (select fromdate from financial_year where isactive=1 and status=1 and companyid=@companyid);
	set @todate = (select todate from financial_year where isactive=1 and status=1 and companyid=@companyid);

	set @count=(select count(wpn.si_code) from weavers_purchase wp
	inner join weavers_purchase_nested wpn on wpn.purchaseid=wp.purchaseid
	where wpn.si_code=@si_code and wp.date >= @fromdate and wp.date <=@todate and wp.companyid=@companyid)+(
	select count(si_code) from stock_table where si_code=@si_code and date >= @fromdate and date <=@todate and companyid=@companyid);

	IF(@count<1)
		BEGIN
			insert into weavers_purchase_nested 
			(
			purchaseid,
			si_code,
			ref_code,
			brandid,
			itemid,
			qty
			)
			values(
			@purchaseid,
			@si_code,
			@ref_code,
			@brandid,
			@itemid,
			@qty
			);
			set @id=@@IDENTITY;
			set @description='Success'
		END
end try
BEGIN CATCH
  -- Handle the error if necessary
END CATCH;
		IF (@description='Success' and @id>0)
			BEGIN
				insert into stock_table 
				(
				purchase_n_id,
				purchaseid,
				date,
				si_code,
				ref_code,
				brandid,
				itemid,		
				qty,
				third_party_gst,
				third_party_nongst,
				weavers,
				companyid,
				isactive,
				activestatus
				)
				values(
				@id,
				@purchaseid,
				@date,
				@si_code,
				@ref_code,
				@brandid,
				@itemid,		
				@qty,
				0,
				0,
				1,
				@companyid,
				1,
				1
				);
			END		
end
GO
/****** Object:  StoredProcedure [dbo].[insert_weavers_purchase_received]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insert_weavers_purchase_received]
@weaverid int,
@date nvarchar(255),
@mode nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
begin
begin try
insert into weavers_purchase 
(
weaverid,
date,
mode,
isactive,
companyid,
cuid,
cdate
)
values(
@weaverid,
@date,
@mode,
1,
@companyid,
@cuid,
GETDATE()

)
  SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';

end try
begin catch
    SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

end catch

end
GO
/****** Object:  StoredProcedure [dbo].[Update_brand_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_brand_master]
@brandid int,
@companyid int,
@brand_name nvarchar(255),
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
declare @count int;
set @count=(select count(*) from brand_master where companyid=@companyid and isactive=1 and brand_name=@brand_name and brandid !=@brandid);
	IF(@count<1)
		BEGIN
			update brand_master set
			brand_name=@brand_name,
			companyid=@companyid,
			muid=@cuid,
			mdate=GETDATE()
			where brandid=@brandid;
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Saved successfully'
	END
	ELSE
		BEGIN
			set @o_ErrorCode=-1;
			set @o_ErrorDescription='Alredy'
		END
end try
begin catch
set @o_ErrorCode=-1;
set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Update_company_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_company_master]
@companyid int,
@company_sdate nvarchar(255),
@company_name nvarchar(255),
@display_name nvarchar(255),
@door_no nvarchar(255),
@building_name nvarchar(255),
@street_name nvarchar(255),
@streent_name1 nvarchar(255),
@email nvarchar(255),
@c_location nvarchar(255),
@pincode nvarchar(255),
@post nvarchar(255),
@taluk nvarchar(255),
@district nvarchar(255),
@website nvarchar(255),
@owner_name nvarchar(255),
@mobile nvarchar(255),
@office_phno nvarchar(255),
@bank_name nvarchar(255),
@ac_holder_name nvarchar(255),
@ac_no nvarchar(255),
@ifsc_code nvarchar(255),
@gst_in nvarchar(255),
@logo nvarchar (max),
@cuid int,


@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
AS
Begin
begin try
update company_master set company_sdate=@company_sdate,
company_name=@company_name,display_name=@display_name,door_no=@door_no,
building_name=@building_name,street_name=@street_name,streent_name1=@streent_name1,email=@email,c_location=@c_location,
pincode=@pincode,post=@post,taluk=@taluk,district=@district,website=@website,owner_name=@owner_name,mobile=@mobile,office_phno=@office_phno,
bank_name=@bank_name,ac_holder_name=@ac_holder_name,ac_no=@ac_no,ifsc_code=@ifsc_code,gst_in=@gst_in,
logo=@logo,muid=@cuid,mdate=GETDATE() where companyid=@companyid;

set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Saved successfully'
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[update_customer_advance]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[update_customer_advance]
@advanceid int,
@customerid int,
@date nvarchar(255),
@advance_amount nvarchar(255),
@description nvarchar(1255)
AS
BEGIN

update customer_advance set 
						customerid=@customerid,
						date=@date,advance_amount=@advance_amount,description=@description where advanceid=@advanceid;	
END
GO
/****** Object:  StoredProcedure [dbo].[update_customer_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_customer_master]
@customerid int,
@customer_name nvarchar(255),
@mobile_no nvarchar(255),
@state nvarchar(255),
@state_code nvarchar(255),
@gst_in nvarchar(255),
@balance nvarchar(255),
@address nvarchar(255),
@shipping_address nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
declare @count int;
set @count=(select count(*) from customer_master where companyid=@companyid and customer_name=@customer_name and isactive=1 and customerid !=@customerid);
	IF(@count<1)
		BEGIN
				update customer_master set
					customer_name=@customer_name,
					mobile_no=@mobile_no,
					state=@state,
					state_code=@state_code,
					gst_in=@gst_in,
					balance=@balance,
					address=@address,
					shipping_address=@shipping_address,
					companyid=@companyid,			
					muid=@cuid,
					mdate=getdate() where customerid=@customerid
					set @o_ErrorCode=@@IDENTITY;
					set @o_ErrorDescription='Saved successfully'
		END
	ELSE
		BEGIN
			set @o_ErrorCode=-1;
			set @o_ErrorDescription='Alredy'
		END
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Update_financial_year]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_financial_year]
@finyearid int,
@companyid int,
@finyear nvarchar(255),
@fromdate nvarchar(255),
@todate nvarchar(255),
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
update financial_year set
finyear=@finyear,
companyid=@companyid,
fromdate=@fromdate,
todate=@todate,
muid=@cuid,
mdate=GETDATE()
where finyearid=@finyearid;
set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Saved successfully'
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[update_given_to_weavers]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_given_to_weavers]
@purchaseid int,
@weaverid int,
@date nvarchar(255),
@mode nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
AS
begin
begin try
update given_to_weavers set
weaverid=@weaverid,date=@date,companyid=@companyid,
mode=@mode,
muid=@cuid,mdate=GETDATE()

where purchaseid=@purchaseid;
  SET @o_ErrorCode = @@IDENTITY;
  SET @o_ErrorDescription = 'Saved successfully';

end try
begin catch
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[update_giventoweavers]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[update_giventoweavers]
@givenid int,
@purchaseid int,
@brandid int,
@itemid int,
@g_gram nvarchar(255),
@g_rate nvarchar(255),
@g_total nvarchar(255),
@g_advance nvarchar(255),
@description nvarchar(1255)
AS
BEGIN
	update giventoweavers set 
	purchaseid=@purchaseid,brandid=@brandid,itemid=@itemid,g_gram=@g_gram,g_rate=@g_rate,g_total=@g_total,g_advance=@g_advance,
	description=@description
	where givenid=@givenid
END
GO
/****** Object:  StoredProcedure [dbo].[Update_gst_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_gst_master]
@gstid int,
@companyid int,
@gst_ID nvarchar(255),
@gst_percentage nvarchar(255),
@igst_percentage nvarchar(255),
@c_gst nvarchar(255),
@s_gst nvarchar(255),
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
declare @count int;
set @count=(select count(*) from gst_master where companyid=@companyid and isactive=1 and gst_percentage=@gst_percentage and gstid !=@gstid);
	IF(@count<1)
		BEGIN
			update gst_master set
			companyid=@companyid,
			gst_ID=@gst_ID,
			gst_percentage=@gst_percentage,
			igst_percentage=@igst_percentage,
			c_gst=@c_gst,
			s_gst=@s_gst,
			muid=@cuid,
			mdate=GETDATE()
			where gstid=@gstid;

			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Saved successfully'
			END
	ELSE
		BEGIN
			SET @o_ErrorCode = -1;
            SET @o_ErrorDescription = 'Alredy';  
		END
end try
begin catch 
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
end catch
end

GO
/****** Object:  StoredProcedure [dbo].[Update_hsn_group]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_hsn_group]
@hsnid int,
@companyid int,
@gstid int,
@hsn_number nvarchar(255),
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
AS
Begin
begin try
declare @count int;
set @count=(select count(*) from hsn_group where companyid=@companyid and isactive=1 and hsn_number=@hsn_number and hsnid !=@hsnid)
if (@count<1)
	begin
		update hsn_group set companyid=@companyid,
		gstid=@gstid,hsn_number=@hsn_number,muid=@cuid,mdate=GETDATE()
		where hsnid=@hsnid
		set @o_ErrorCode=@@IDENTITY;
		set @o_ErrorDescription='Saved successfully'
	end
	else
		begin
			set @o_ErrorCode=-1;
			set @o_ErrorDescription='Already'
		end
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Update_item_group]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_item_group]
@item_groupid int,
@companyid int,
@item_group_name nvarchar(255),
@hsnid int,
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
AS
begin
begin try
declare @count int;
set @count=(select count(*) from item_group where companyid=@companyid and isactive=1 and item_group_name=@item_group_name and item_groupid !=@item_groupid);
	IF(@count<1)
		BEGIN
			update item_group 
			set companyid=@companyid,
			item_group_name=@item_group_name,
			hsnid=@hsnid,
			muid=@cuid,mdate=GETDATE()

			where item_groupid=@item_groupid;
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Saved successfully'
		END
	ELSE
		BEGIN
			SET @o_ErrorCode = -1;
            SET @o_ErrorDescription = 'Alredy';
		END
end try
begin catch
			set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end

GO
/****** Object:  StoredProcedure [dbo].[Update_item_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_item_master]
@itemid int,
@companyid int,
@unitid int,
@brandid int,
@item_groupid int,
@item_code nvarchar(255),
@item_name nvarchar(255),
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
declare @count int;
set @count=(select COUNT(*) from item_master where companyid=@companyid and isactive=1 and item_name=@item_name and itemid != @itemid);
IF(@count<1)
	BEGIN
		update item_master set companyid=@companyid,unitid=@unitid,brandid=@brandid,item_groupid=@item_groupid,
		item_code=@item_code,item_name=@item_name,
		muid=@cuid,mdate=GETDATE() where itemid=@itemid;
		set @o_ErrorCode=@@IDENTITY;
		set @o_ErrorDescription='Saved successfully'
	END
ELSE
	BEGIN
		set @o_ErrorCode=-1;
		set @o_ErrorDescription='Alredy'
	END
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Update_raw_material_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_raw_material_purchase]
@purchaseid int,
@supplierid int,
@date nvarchar(255),
@supplier_bill_no nvarchar(255),
@bill_no nvarchar(255),
@c_balance nvarchar(255),
@credit_days nvarchar(255),
@total nvarchar(255),
@cuid int,
 @o_ErrorCode int OUTPUT,
    @o_ErrorDescription varchar(250) OUTPUT
AS
BEGIN
BEGIN TRY
update raw_material_purchase set
supplierid=@supplierid,
date=@date,
supplier_bill_no=@supplier_bill_no,c_balance=@c_balance,credit_days=@credit_days,
total=@total,muid=@cuid,mdate=GETDATE()

where purchaseid=@purchaseid;

SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';

END TRY
BEGIN CATCH
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Update_raw_material_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_raw_material_purchase_nested]
    @purchase_n_id int,
    @purchaseid INT,
    @brandid INT,
    @itemid INT,
    @hsn_number NVARCHAR(255),
    @gst_percentage NVARCHAR(255),
    @price NVARCHAR(255),
    @discount NVARCHAR(255),
    @qty NVARCHAR(255),
    @total NVARCHAR(255),
    @cgst_amount NVARCHAR(255),
    @sgst_amount NVARCHAR(255),
    @igst_amount NVARCHAR(255),
    @net_total NVARCHAR(255)
	AS
	BEGIN
	UPDATE raw_material_purchase_nested set
	purchaseid=@purchaseid,brandid=@brandid,
	itemid=@itemid,hsn_number=@hsn_number,gst_percentage=@gst_percentage,
	price=@price,discount=@discount,qty=@qty,total=@total,
	cgst_amount=@cgst_amount,sgst_amount=@sgst_amount,net_total=@net_total
   where purchase_n_id=@purchase_n_id;
	END
GO
/****** Object:  StoredProcedure [dbo].[Update_sales_billing]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_sales_billing]
@entryid int,
@customerid int,
@date nvarchar(255),
@credit_days nvarchar(255),
@balance nvarchar(255),
@billing_address nvarchar(255),
@shipping_address nvarchar(255),
@total nvarchar(255),
@companyid int,
@cuid int,
  @o_ErrorCode INT OUTPUT,
    @o_ErrorDescription VARCHAR(250) OUTPUT
	AS
begin
begin try
update sales_billing set
customerid=@customerid,
date=@date,
credit_days=@credit_days,
balance=@balance,
billing_address=@billing_address,
shipping_address=@shipping_address,
total=@total,
companyid=@companyid,
muid=@cuid,mdate=GETDATE()

where entryid=@entryid;
  SET @o_ErrorCode = @@IDENTITY;
  SET @o_ErrorDescription = 'Saved successfully';

  if(@o_ErrorDescription = 'Saved successfully')
	BEGIN
		delete sales_billing_nested where entryid=@entryid;
	END

end try
begin catch
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[update_sales_billing_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_sales_billing_nested]
@entry_n_id int,
@entryid int,
@stockid int,
@ref_code nvarchar(255),
@si_code nvarchar(255),
@brandid int,
@itemid int,
@hsn_number nvarchar(255),
@gst_percentage nvarchar(255),
@price nvarchar(255),
@discount nvarchar(255),
@qty nvarchar(255),
@total nvarchar(255),
@cgst_amount nvarchar(255),
@sgst_amount nvarchar(255),
@igst_amount nvarchar(255),
@net_total nvarchar(255)
AS
begin
begin try
update sales_billing_nested set
	
		entryid=@entryid,
		stockid=@stockid,
		ref_code=@ref_code,
		si_code=@si_code,
		brandid=@brandid,
		itemid=@itemid,
		hsn_number=@hsn_number,
		gst_percentage=@gst_percentage,
		price=@price,
		discount=@discount,		
		qty=@qty,
		total=@total,
		cgst_amount=@cgst_amount,
		sgst_amount=@sgst_amount,
		igst_amount=@igst_amount,
		net_total=@net_total where entry_n_id=@entry_n_id
		
end try
 BEGIN CATCH
        -- Handle the error if necessary
    END CATCH;	
end
GO
/****** Object:  StoredProcedure [dbo].[update_sales_billing_nested_nongst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_sales_billing_nested_nongst]
@entry_n_id int,
@entryid int,
@stockid int,
@ref_code nvarchar(255),
@si_code nvarchar(255),
@brandid int,
@itemid int,
@hsn_number nvarchar(255),
@price nvarchar(255),
@discount nvarchar(255),
@qty nvarchar(255),
@total nvarchar(255)
AS
begin
begin try
update sales_billing_nested_nongst set
	
		entryid=@entryid,
		stockid=@stockid,
		ref_code=@ref_code,
		si_code=@si_code,
		brandid=@brandid,
		itemid=@itemid,
		hsn_number=@hsn_number,
		price=@price,
		discount=@discount,		
		qty=@qty,
		total=@total
	 where entry_n_id=@entry_n_id
		
end try
 BEGIN CATCH
        -- Handle the error if necessary
    END CATCH;	
end
GO
/****** Object:  StoredProcedure [dbo].[Update_sales_billing_nongst]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_sales_billing_nongst]
@entryid int,
@customerid int,
@date nvarchar(255),
@credit_days nvarchar(255),
@balance nvarchar(255),
@billing_address nvarchar(255),
@shipping_address nvarchar(255),
@total nvarchar(255),
@companyid int,
@cuid int,
  @o_ErrorCode INT OUTPUT,
    @o_ErrorDescription VARCHAR(250) OUTPUT
	AS
begin
begin try
update sales_billing_nongst set
customerid=@customerid,
date=@date,
credit_days=@credit_days,
balance=@balance,
billing_address=@billing_address,
shipping_address=@shipping_address,
total=@total,
companyid=@companyid,
muid=@cuid,mdate=GETDATE()

where entryid=@entryid;
  SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';

			if(@o_ErrorDescription = 'Saved successfully')
				BEGIN
					delete sales_billing_nested_nongst where entryid=@entryid;
				END

end try
begin catch
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Update_sales_billing_returnDebit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_sales_billing_returnDebit]
@entryid int,
@returndebit_id int,
@customerid int,
@bill_date nvarchar(255),
@invoice_no nvarchar(255),
@invoice_date nvarchar(255),
@return_no nvarchar(255),
@return_date nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@companyid int,
@cuid int,

 @o_ErrorCode INT OUTPUT,
    @o_ErrorDescription VARCHAR(250) OUTPUT

As
begin
begin try
update sales_billing_returnDebit set 
customerid=@customerid,bill_date=@bill_date,
invoice_no=@invoice_no,invoice_date=@invoice_date,
return_date=@return_date,total=@total,
return_total=@return_total,
muid=@cuid,mdate=GETDATE()
where returndebit_id=@returndebit_id;

--Update sales_billing set total=CAST(CAST(@total as float )-CAST(@return_total as float) as nvarchar(255)) where entryid=@entryid;
  SET @o_ErrorCode = @@IDENTITY;
  SET @o_ErrorDescription = 'Saved successfully';
end try
begin catch
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[update_sales_billing_returnDebit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_sales_billing_returnDebit_nested]
@returndebit_n_id int,
@entry_n_id int,
@qty nvarchar(255),
@return_qty nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@cgst_amount nvarchar(255),
@return_cgst_amount nvarchar(255),
@sgst_amount nvarchar(255),
@return_sgst_amount nvarchar(255),
@igst_amount nvarchar(255),
@return_igst_amount nvarchar(255),
@net_total nvarchar(255),
@return_net_total nvarchar(255)

AS
begin
begin try

	UPDATE sales_billing_returnDebit_nested set return_qty=@return_qty,
return_total=@return_total,return_cgst_amount=@return_cgst_amount,
return_sgst_amount=@return_sgst_amount,return_net_total=@return_net_total

where returndebit_n_id=@returndebit_n_id;
		
--   UPDATE sales_billing_nested
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255)),
--    cgst_amount = CAST((CAST(@cgst_amount AS float) - CAST(@return_cgst_amount AS float)) AS nvarchar(255)),
--    sgst_amount = CAST((CAST(@sgst_amount AS float) - CAST(@return_sgst_amount AS float)) AS nvarchar(255)),
--    igst_amount = CAST((CAST(@igst_amount AS float) - CAST(@return_igst_amount AS float)) AS nvarchar(255)),
--    net_total = CAST((CAST(@net_total AS float) - CAST(@return_net_total AS float)) AS nvarchar(255))
--WHERE entry_n_id = @entry_n_id;
end try
 BEGIN CATCH
        -- Handle the error if necessary
    END CATCH;	
end


GO
/****** Object:  StoredProcedure [dbo].[Update_sales_billingNongst_returnDebit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_sales_billingNongst_returnDebit]
@returndebit_id int,
@entryid int,
@customerid int,
@bill_date nvarchar(255),
@invoice_no nvarchar(255),
@invoice_date nvarchar(255),
@return_no nvarchar(255),
@return_date nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@companyid int,
@cuid int,

 @o_ErrorCode INT OUTPUT,
    @o_ErrorDescription VARCHAR(250) OUTPUT

As
begin
begin try
update sales_billingNongst_returnDebit set 
customerid=@customerid,bill_date=@bill_date,
invoice_no=@invoice_no,invoice_date=@invoice_date,
return_date=@return_date,
total=@total,
return_total=@return_total,
muid=@cuid,mdate=GETDATE()

where returndebit_id=@returndebit_id AND companyid=@companyid;


--update sales_billing_nongst set total=CAST(CAST(@total as float)-CAST(@return_total as float) As nvarchar(255))
--where entryid=@entryid;
  SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
end try
begin catch
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[update_sales_billingNongst_returnDebit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_sales_billingNongst_returnDebit_nested]
@returndebit_n_id int,
@entry_n_id int,
@qty nvarchar(255),
@return_qty nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255)

AS
begin
begin try

	UPDATE sales_billingNongst_returnDebit_nested set return_qty=@return_qty,
return_total=@return_total

where returndebit_n_id=@returndebit_n_id;
		
--   UPDATE sales_billing_nested_nongst
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255))

--WHERE entry_n_id = @entry_n_id;
end try
 BEGIN CATCH
        -- Handle the error if necessary
    END CATCH;	
end


GO
/****** Object:  StoredProcedure [dbo].[update_supplier_advance]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[update_supplier_advance]
@advanceid int,
@supplierid int,
@date nvarchar(255),
@advance_amount nvarchar(255),
@description nvarchar(1255)
AS
BEGIN

update supplier_advance set 
						supplierid=@supplierid,
						date=@date,advance_amount=@advance_amount,description=@description where advanceid=@advanceid;	
END
GO
/****** Object:  StoredProcedure [dbo].[Update_supplier_debit_note]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_supplier_debit_note]
@s_debitid int,
@purchaseid int,
@supplierid int,
@supplier_bill_no nvarchar(255),
@date nvarchar(255),
@return_no nvarchar(255),
@return_date nvarchar(255),
@gst_in nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
AS
BEGIN
BEGIN TRY
update supplier_debit_note set purchaseid=@purchaseid,
supplierid=@supplierid,supplier_bill_no=@supplier_bill_no,
date=@date,return_date=@return_date,
gst_in=@gst_in,total=@total,return_total=@return_total,muid=cuid,mdate=GETDATE()

where s_debitid=@s_debitid 

 --Update raw_material_purchase set total=CAST(CAST(@total as float )-CAST(@return_total as float) as nvarchar(255))
 --where purchaseid=@purchaseid;

set @o_ErrorCode=@@IDENTITY;
					set @o_ErrorDescription='Saved successfully'
END TRY
BEGIN CATCH
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Update_supplier_debit_note_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_supplier_debit_note_nested]
@s_debitid_n_id int,
@purchase_n_id int,
@s_debitid int,
@qty nvarchar(255),
@return_qty nvarchar(255),
@return_total nvarchar(255),
@total nvarchar(255),
@cgst_amount nvarchar(255),
@return_cgst_amount nvarchar(255),
@return_sgst_amount nvarchar(255),
@sgst_amount nvarchar(255),
@return_igst_amount nvarchar(255),
@igst_amount nvarchar(255),
@net_total nvarchar(255),
@return_net_total nvarchar(255)

AS
BEGIN

UPDATE supplier_debit_note_nested set return_qty=@return_qty,
return_total=@return_total,return_cgst_amount=@return_cgst_amount,
return_sgst_amount=@return_sgst_amount,return_net_total=@return_net_total

where s_debitid_n_id=@s_debitid_n_id;

--  UPDATE raw_material_purchase_nested
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255)),
--    cgst_amount = CAST((CAST(@cgst_amount AS float) - CAST(@return_cgst_amount AS float)) AS nvarchar(255)),
--    sgst_amount = CAST((CAST(@sgst_amount AS float) - CAST(@return_sgst_amount AS float)) AS nvarchar(255)),
--    igst_amount = CAST((CAST(@igst_amount AS float) - CAST(@return_igst_amount AS float)) AS nvarchar(255)),
--    net_total = CAST((CAST(@net_total AS float) - CAST(@return_net_total AS float)) AS nvarchar(255))
--WHERE purchase_n_id = @purchase_n_id;


END
GO
/****** Object:  StoredProcedure [dbo].[update_supplier_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_supplier_master]
@supplierid int,
@supplier_name nvarchar(255),
@mobile_no nvarchar(255),
@state nvarchar(255),
@state_code nvarchar(255),
@gst_in nvarchar(255),
@balance nvarchar(255),

@address nvarchar(255),
@shipping_address nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin 
begin try
declare @count int;
set @count=(select count(*) from supplier_master where companyid=@companyid and isactive=1 and supplier_name=@supplier_name and supplierid !=@supplierid)
	IF(@count<1)
		BEGIN
		update supplier_master set
			supplier_name=@supplier_name,
			mobile_no=@mobile_no,
			state=@state,
			state_code=@state_code,
			gst_in=@gst_in,
			balance=@balance,		
			address=@address,
			shipping_address=@shipping_address,
			companyid=@companyid,			
			muid=@cuid,
			mdate=getdate() where supplierid=@supplierid
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Saved successfully'
		END
	ELSE
		BEGIN
			set @o_ErrorCode=-1;
			set @o_ErrorDescription='Alredy'
		END
end try
begin catch 
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Update_third_party_gst_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_third_party_gst_purchase]
@purchaseid int,
@third_partyid int,
@date nvarchar(255),
@invoice_no nvarchar(255),
@bill_no nvarchar(255),
@c_balance nvarchar(255),
@credit_days nvarchar(255),
@total nvarchar(255),
@cuid int,
 @o_ErrorCode int OUTPUT,
    @o_ErrorDescription varchar(250) OUTPUT
AS
BEGIN
BEGIN TRY
update third_party_gst_purchase set
third_partyid=@third_partyid,
date=@date,
invoice_no=@invoice_no,
--bill_no=@bill_no,
c_balance=@c_balance,
credit_days=@credit_days,
total=@total,
muid=@cuid,
mdate=GETDATE()
where purchaseid=@purchaseid;

SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';

END TRY
BEGIN CATCH
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Update_third_party_gst_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_third_party_gst_purchase_nested]
    @purchase_n_id int,
    @purchaseid INT,
	@date nvarchar(255),
	@si_code nvarchar(255),
	@ref_code nvarchar(255),
    @brandid INT,
    @itemid INT,
    @hsn_number NVARCHAR(255),   
	@gst_percentage nvarchar(255),
    @price NVARCHAR(255),
    @discount NVARCHAR(255),
    @qty NVARCHAR(255),
    @total nvarchar(255),
	@cgst_amount nvarchar(255),
	@sgst_amount nvarchar(255),
	@igst_amount nvarchar(255),
	@net_total nvarchar(255),
	@companyid int
	AS
	BEGIN
						UPDATE third_party_gst_purchase_nested set
						purchaseid=@purchaseid,
						si_code=@si_code,
						ref_code=@ref_code,
						brandid=@brandid,
						itemid=@itemid,
						hsn_number=@hsn_number,	
						gst_percentage=@gst_percentage,
						price=@price,
						discount=@discount,
						qty=@qty,
						total=@total,	
						cgst_amount=@cgst_amount,
						sgst_amount=@sgst_amount,
						igst_amount=@igst_amount,
						net_total=@net_total where purchase_n_id=@purchase_n_id;

						UPDATE stock_table set	
						date=@date,
						brandid=@brandid,
						itemid=@itemid,
						hsn_number=@hsn_number,	
						gst_percentage=@gst_percentage,
						price=@price,
						discount=@discount,
						qty=@qty,
						total=@total,	
						cgst_amount=@cgst_amount,
						sgst_amount=@sgst_amount,
						igst_amount=@igst_amount,
						net_total=@net_total,
						si_code=@si_code,
						ref_code=@ref_code
					   where purchase_n_id=@purchase_n_id and third_party_gst=1
	END
GO
/****** Object:  StoredProcedure [dbo].[update_third_party_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_third_party_master]
@third_partyid int,
@party_name nvarchar(255),
@short_code nvarchar(255),
@mobile nvarchar(255),
@state nvarchar(255),
@state_code nvarchar(255),
@address nvarchar(255),
@balance nvarchar(255),
@gst_in nvarchar(255),
@companyid nvarchar(255),
@cuid int,			
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
declare @count int;
set @count=(select count(*) from third_party_master where companyid=@companyid and isactive=1 and party_name=@party_name and third_partyid !=@third_partyid)
	IF(@count<1)
		BEGIN
			update third_party_master set
			party_name=@party_name,
			short_code=@short_code,
			mobile=@mobile,
			state=@state,
			state_code=@state_code,
			address=@address,
			balance=@balance,
			gst_in=@gst_in,		
			companyid=@companyid,
			muid=@cuid,
			mdate=getdate()
			where third_partyid=@third_partyid
			set @o_ErrorCode=@@IDENTITY;
			set @o_ErrorDescription='Saved successfully'
		END
	ELSE
		BEGIN
			set @o_ErrorCode=-1;
			set @o_ErrorDescription='Alredy'
		END
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Update_third_party_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_third_party_purchase]
@purchaseid int,
@third_partyid int,
@date nvarchar(255),
@invoice_no nvarchar(255),
@bill_no nvarchar(255),
@c_balance nvarchar(255),
@credit_days nvarchar(255),
@total nvarchar(255),
@cuid int,
 @o_ErrorCode int OUTPUT,
    @o_ErrorDescription varchar(250) OUTPUT
AS
BEGIN  
BEGIN TRY
update third_party_purchase set
third_partyid=@third_partyid,
date=@date,
invoice_no=@invoice_no,
--bill_no=@bill_no,
c_balance=@c_balance,
credit_days=@credit_days,
total=@total,
muid=@cuid,
mdate=GETDATE()
where purchaseid=@purchaseid;
SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
END TRY
BEGIN CATCH
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Update_third_party_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_third_party_purchase_nested]
    @purchase_n_id int,
    @purchaseid INT,
	@date nvarchar(255),
	@si_code nvarchar(255),
	@ref_code nvarchar(255),
    @brandid INT,
    @itemid INT,
    @hsn_number NVARCHAR(255),
    @price NVARCHAR(255),
    @discount NVARCHAR(255),
    @qty NVARCHAR(255),
    @total NVARCHAR(255),
	@companyid int
	AS
	BEGIN
			UPDATE third_party_purchase_nested set
			purchaseid=@purchaseid,
			si_code=@si_code,
			ref_code=@ref_code,
			brandid=@brandid,
			itemid=@itemid,
			hsn_number=@hsn_number,	
			price=@price,
			discount=@discount,
			qty=@qty,
			total=@total
		   where purchase_n_id=@purchase_n_id;

		   UPDATE stock_table set	
		   date=@date,
			brandid=@brandid,
			itemid=@itemid,
			hsn_number=@hsn_number,	
			price=@price,
			discount=@discount,
			qty=@qty,
			total=@total,
			si_code=@si_code,
			ref_code=@ref_code
		   where purchase_n_id=@purchase_n_id and third_party_nongst=1
	END
GO
/****** Object:  StoredProcedure [dbo].[Update_third_partyPurchasegst_debit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_third_partyPurchasegst_debit]
@thirdPartyDebitid int,
@third_partyid int,
@purchaseid int,
@purchase_date nvarchar(255),
@invoice_no nvarchar(255),
@invoice_date nvarchar(255),
@return_no nvarchar(255),
@total nvarchar(255),
@return_date nvarchar(255),
@return_total nvarchar(255),
@companyid int,
@cuid int,

 @o_ErrorCode INT OUTPUT,
    @o_ErrorDescription VARCHAR(250) OUTPUT

As
begin
begin try
update third_partyPurchasegst_debit set 
third_partyid=@third_partyid,purchase_date=@purchase_date,
invoice_no=@invoice_no,invoice_date=@invoice_date,
return_date=@return_date,total=@total,
return_total=@return_total,
muid=@cuid,mdate=GETDATE()
where thirdPartyDebitid=thirdPartyDebitid AND companyid=@companyid;

--update third_party_gst_purchase set total=CAST(CAST(@total as float)-CAST(@return_total as float) as nvarchar(255))
--where purchaseid=@purchaseid;

  SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
end try
begin catch 
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[update_third_partyPurchasegst_debit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_third_partyPurchasegst_debit_nested]
@thirdPartyDebit_n_id int,
@purchase_n_id int,
@purchaseid int,
@qty nvarchar(255),
@return_qty nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@cgst_amount nvarchar(255),
@return_cgst_amount nvarchar(255),
@sgst_amount nvarchar(255),
@return_sgst_amount nvarchar(255),
@igst_amount nvarchar(255),
@return_igst_amount nvarchar(255),
@net_total nvarchar(255),
@return_net_total nvarchar(255)

AS
begin
begin try

	UPDATE third_partyPurchasegst_debit_nested set return_qty=@return_qty,
return_total=@return_total,return_cgst_amount=@return_cgst_amount,purchaseid=@purchaseid,purchase_n_id=@purchase_n_id,
return_sgst_amount=@return_sgst_amount,return_net_total=@return_net_total

where thirdPartyDebit_n_id=@thirdPartyDebit_n_id;
		
--   UPDATE third_party_gst_purchase_nested
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255)),
--    cgst_amount = CAST((CAST(@cgst_amount AS float) - CAST(@return_cgst_amount AS float)) AS nvarchar(255)),
--    sgst_amount = CAST((CAST(@sgst_amount AS float) - CAST(@return_sgst_amount AS float)) AS nvarchar(255)),
--    igst_amount = CAST((CAST(@igst_amount AS float) - CAST(@return_igst_amount AS float)) AS nvarchar(255)),
--    net_total = CAST((CAST(@net_total AS float) - CAST(@return_net_total AS float)) AS nvarchar(255))
--WHERE purchase_n_id = @purchase_n_id;

-- UPDATE stock_table
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255)),
--    cgst_amount = CAST((CAST(@cgst_amount AS float) - CAST(@return_cgst_amount AS float)) AS nvarchar(255)),
--    sgst_amount = CAST((CAST(@sgst_amount AS float) - CAST(@return_sgst_amount AS float)) AS nvarchar(255)),
--    igst_amount = CAST((CAST(@igst_amount AS float) - CAST(@return_igst_amount AS float)) AS nvarchar(255)),
--    net_total = CAST((CAST(@net_total AS float) - CAST(@return_net_total AS float)) AS nvarchar(255))
--WHERE purchase_n_id = @purchase_n_id AND third_party_gst=1;
end try
 BEGIN CATCH
        -- Handle the error if necessary
    END CATCH;	
end


GO
/****** Object:  StoredProcedure [dbo].[Update_third_partyPurchaseNongst_debit]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_third_partyPurchaseNongst_debit]
@thirdPartyDebitid int,
@third_partyid int,
@purchaseid int,
@purchase_date nvarchar(255),
@invoice_no nvarchar(255),
@invoice_date nvarchar(255),
@return_no nvarchar(255),
@return_date nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255),
@companyid int,
@cuid int,

 @o_ErrorCode INT OUTPUT,
    @o_ErrorDescription VARCHAR(250) OUTPUT

As
begin
begin try
update third_partyPurchaseNongst_debit set 
third_partyid=@third_partyid,purchase_date=@purchase_date,
invoice_no=@invoice_no,invoice_date=@invoice_date,
return_date=@return_date,
total=@total,
return_total=@return_total,
muid=@cuid,mdate=GETDATE()

where thirdPartyDebitid=@thirdPartyDebitid AND companyid=@companyid;

--update third_party_purchase set total=CAST(CAST(@total as float)-CAST(@return_total as float) as nvarchar(255))
--where purchaseid=@purchaseid
  SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';
end try
begin catch
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[update_third_partyPurchaseNongst_debit_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_third_partyPurchaseNongst_debit_nested]
@thirdPartyDebit_n_id int,
@purchaseid int,
@purchase_n_id int,
@qty nvarchar(255),
@return_qty nvarchar(255),
@total nvarchar(255),
@return_total nvarchar(255)

AS
begin
begin try

	UPDATE third_partyPurchaseNongst_debit_nested set return_qty=@return_qty,
return_total=@return_total,purchaseid=@purchaseid

where thirdPartyDebit_n_id=@thirdPartyDebit_n_id;
		
--   UPDATE third_party_purchase_nested
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255))

--WHERE purchase_n_id = @purchase_n_id;

--  UPDATE stock_table
--SET 
--    qty = CAST((CAST(@qty AS float) - CAST(@return_qty AS float)) AS nvarchar(255)),
--    total = CAST((CAST(@total AS float) - CAST(@return_total AS float)) AS nvarchar(255))
--WHERE purchase_n_id = @purchase_n_id AND third_party_nongst=1;
end try
 BEGIN CATCH
        -- Handle the error if necessary
    END CATCH;	
end


GO
/****** Object:  StoredProcedure [dbo].[update_thirdparty_advance]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_thirdparty_advance]
@advanceid int,
@third_partyid int,
@date nvarchar(255),
@advance_amount nvarchar(255),
@description nvarchar(1255)
AS
BEGIN

update thirdparty_advance set 
						third_partyid=@third_partyid,
						date=@date,advance_amount=@advance_amount,description=@description where advanceid=@advanceid;	
END
GO
/****** Object:  StoredProcedure [dbo].[Update_unit_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_unit_master]
@unitid int,
@companyid int,
@unit_name nvarchar(255),
@unit_code nvarchar(255),
@cuid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
declare @count int;
set @count=(select count(*) from unit_master where companyid=@companyid and isactive=1 and unit_code=@unit_code and unitid !=@unitid);
IF(@count<1)
	BEGIN
		update unit_master set
		companyid=@companyid,
		unit_name=@unit_name,
		unit_code=@unit_code,
		muid=@cuid,
		mdate=GETDATE()

		where unitid=@unitid

		set @o_ErrorCode=@@IDENTITY;
		set @o_ErrorDescription='Saved successfully'
	END
ELSE
	BEGIN
		set @o_ErrorCode=-1;
		set @o_ErrorDescription='Alredy'
	END
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'

end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Update_user_profile]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_user_profile]
@userid int,
@user_name nvarchar(255),
@companyid int,
@phone nvarchar(255),
@email nvarchar(255),
@password nvarchar(255),
@m_companyid nvarchar(255),
@s_companyid nvarchar(255),
@img nvarchar(max),
@cuid int,
@sub_menus nvarchar(max),
@main_menus nvarchar(max),
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
as
begin
begin try
update user_profile set user_name=@user_name,
companyid=@companyid,phone=@phone,
email=@email,password=@password,
m_companyid=@m_companyid,
s_companyid=@s_companyid,img=@img,muid=@cuid,mdate=GETDATE(),
sub_menus=@sub_menus,
main_menus=@main_menus
where userid=@userid;

set @o_ErrorCode=@@IDENTITY;
set @o_ErrorDescription='Saved successfully'

end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[update_weaver_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_weaver_master]
@weaverid int,
@weaver_name nvarchar(255),
@short_code nvarchar(255),
@mobile nvarchar(255),
@address nvarchar(255),
@state nvarchar(255),
@state_code nvarchar(255),
@balance nvarchar(255),
@companyid nvarchar(255),
@cuid int,			
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
As
begin
begin try
declare @count int;
set @count=(select count(*) from weaver_master where companyid=@companyid and isactive=1 and weaver_name=@weaver_name and weaverid !=@weaverid)
	IF(@count<1)
		BEGIN
			update weaver_master set
				weaver_name=@weaver_name,
				short_code=@short_code,
				mobile=@mobile,
				address=@address,
				state=@state,
				state_code=@state_code,
				balance=@balance,					
				companyid=@companyid,
				muid=@cuid,
				mdate=getdate()
			where weaverid=@weaverid
				set @o_ErrorCode=@@IDENTITY;
				set @o_ErrorDescription='Saved successfully'
		END
	ELSE
		BEGIN
			set @o_ErrorCode=-1;
				set @o_ErrorDescription='Alredy'
		END
end try
begin catch
set @o_ErrorCode=-1;
			set @o_ErrorDescription='Error'
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[update_weavers_nested_received]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_weavers_nested_received]
@purchase_n_id int,
@purchaseid int,
@date nvarchar(255),
@si_code nvarchar(255),
@ref_code nvarchar(255),
@brandid int,
@itemid int,
@qty nvarchar(255),
@companyid int,
@r_gram nvarchar(255),
@r_advance nvarchar(255),
@description nvarchar(1255)
AS
BEGIN
			update weavers_purchase_nested set
			purchaseid=@purchaseid,
			si_code=@si_code,
			ref_code=@ref_code,
			brandid=@brandid,
			itemid=@itemid,
			qty=@qty,		
			r_gram=@r_gram,
			r_advance=@r_advance,
			description=@description
			where purchase_n_id=@purchase_n_id;

			update stock_table set
			date=@date,
			brandid=@brandid,
			itemid=@itemid,
			qty=@qty,
			si_code=@si_code,
			ref_code=@ref_code
			where purchase_n_id=@purchase_n_id and weavers=1
END
GO
/****** Object:  StoredProcedure [dbo].[Update_weavers_purchase]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_weavers_purchase]
@purchaseid int,
@weaverid int,
@date nvarchar(255),
@companyid int,
@cuid int,
  @o_ErrorCode INT OUTPUT,
    @o_ErrorDescription VARCHAR(250) OUTPUT
	AS
begin
begin try
update weavers_purchase set
weaverid=@weaverid,date=@date,companyid=@companyid,
muid=@cuid,mdate=GETDATE()

where purchaseid=@purchaseid;
  SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';

end try
begin catch
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Update_weavers_purchase_nested]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Update_weavers_purchase_nested]
@purchase_n_id int,
@purchaseid int,
@date nvarchar(255),
@si_code nvarchar(255),
@ref_code nvarchar(255),
@brandid int,
@itemid int,
@qty nvarchar(255),
@companyid int
AS
BEGIN
			update weavers_purchase_nested set
			purchaseid=@purchaseid,
			si_code=@si_code,
			ref_code=@ref_code,
			brandid=@brandid,
			itemid=@itemid,
			qty=@qty
			where purchase_n_id=@purchase_n_id;

			update stock_table set
			date=@date,
			brandid=@brandid,
			itemid=@itemid,
			qty=@qty,
			si_code=@si_code,
			ref_code=@ref_code
			where purchase_n_id=@purchase_n_id and weavers=1
END
GO
/****** Object:  StoredProcedure [dbo].[update_weavers_purchase_received]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_weavers_purchase_received]
@purchaseid int,
@weaverid int,
@date nvarchar(255),
@mode nvarchar(255),
@companyid int,
@cuid int,
@o_ErrorCode INT OUTPUT,
@o_ErrorDescription VARCHAR(250) OUTPUT
	AS
begin
begin try
update weavers_purchase set
weaverid=@weaverid,date=@date,companyid=@companyid,
mode=@mode,
muid=@cuid,mdate=GETDATE()

where purchaseid=@purchaseid;
  SET @o_ErrorCode = @@IDENTITY;
            SET @o_ErrorDescription = 'Saved successfully';

end try
begin catch
SET @o_ErrorCode = -1;
        SET @o_ErrorDescription = 'Error';
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateActiveStatus_company_master]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateActiveStatus_company_master]
@companyid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
AS
begin
begin try

update company_master set activestatus=0
update company_master set activestatus=1 where companyid=@companyid;
  SET @o_ErrorCode = 0;
        SET @o_ErrorDescription = 'Success';
end try
begin catch
 SET @o_ErrorCode = ERROR_NUMBER();
        SET @o_ErrorDescription = ERROR_MESSAGE();
end catch
end


GO
/****** Object:  StoredProcedure [dbo].[UpdateActiveStatus_financial_year]    Script Date: 22-08-2024 18:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateActiveStatus_financial_year]
@companyid int,
@finyearid int,
@o_ErrorCode int Output,
@o_ErrorDescription varchar(250) output
AS
begin
begin try
update financial_year set status=0 where companyid=@companyid;
update financial_year set status=1 where finyearid=@finyearid and companyid=@companyid;;

SET @o_ErrorCode = 0;
        SET @o_ErrorDescription = 'Success';
end try
begin catch
 SET @o_ErrorCode = ERROR_NUMBER();
        SET @o_ErrorDescription = ERROR_MESSAGE();

end catch

end
GO

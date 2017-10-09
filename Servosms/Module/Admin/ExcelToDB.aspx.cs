using System;
using System.Collections.Generic;
using System.Data.OleDb;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using Excel = Microsoft.Office.Interop.Excel;
using System.Runtime.InteropServices;
using Servosms.Sysitem.Classes;
using System.Globalization;
using RMG;

public partial class Module_Admin_ExcelToDB : System.Web.UI.Page
{
    OleDbConnection Econ;
    SqlConnection con;
    string Cust_name, Query, sqlconn;
    private string Text;
    InventoryClass obj1 = new InventoryClass();
    string sql, sql1, CurrBal, CurrBalType, CrDays, CustID, UnderSalesMan,CrLimit, Place;
    DateTime duedate;
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnRead_Click(object sender, EventArgs e)
    {
        //string CurrentFilePath = Path.GetFullPath(FileUpload1.PostedFile.FileName);
        //InsertExcelRecords(CurrentFilePath);
        if (FileUpload1.HasFile)
        {
            string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            string FolderPath = ConfigurationManager.AppSettings["E:\\"];

            string FilePath = Server.MapPath(FolderPath + FileName);
            FileUpload1.SaveAs(FilePath);
            Import_To_Grid(FilePath, Extension);
        }
    }
    private void Import_To_Grid(string FilePath, string Extension)
    {
        string conStr = "";
        switch (Extension)
        {
            case ".xls": //Excel 97-03
                conStr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 12.0 Xml;HDR=YES'", FilePath);
                break;
            case ".xlsx": //Excel 07
                conStr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 12.0 Xml;HDR=YES'", FilePath);
                break;
        }
        conStr = String.Format(conStr, FilePath);
        OleDbConnection connExcel = new OleDbConnection(conStr);
        OleDbCommand cmdExcel = new OleDbCommand();
        OleDbDataAdapter oda = new OleDbDataAdapter();

        cmdExcel.Connection = connExcel;

        //Get the name of First Sheet
        connExcel.Open();
        DataTable dtExcelSchema;
        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        string SheetName;
        connExcel.Close();

        try
        {
            for (int k = 0; k < dtExcelSchema.Rows.Count; k++)
            {
                SheetName = dtExcelSchema.Rows[k]["TABLE_NAME"].ToString();
                DataTable dt = new DataTable();
                //Read Data from First Sheet
                connExcel.Open();
                cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt);
                connExcel.Close();
                InventoryClass obj1 = new InventoryClass();                
                //Check For type of Invoice
                if (btnSalesInvoice.Checked == true) //Sales Invoice
                {
                    string str = "";
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        string CurrStr = dt.Rows[i][0].ToString();
                        if (str != CurrStr)
                        {
                            str = CurrStr;
                            obj1.Invoice_No = CurrStr;
                            obj1.Invoice_Date = System.Convert.ToDateTime(GenUtil.str2DDMMYYYYExcel(dt.Rows[i][1].ToString()));
                            obj1.SSA_OR_SSI_NAME = dt.Rows[i][2].ToString();
                            obj1.SALES_RETURN_NUMBER = dt.Rows[i][3].ToString();
                            obj1.SALES_RETURN_GR_DATE = GenUtil.str2DDMMYYYYExcel(dt.Rows[i][4].ToString());
                            obj1.SECONDARY_CUSTOMER_NUMBER = dt.Rows[i][5].ToString();
                            obj1.SEC_CUSTOMER_NAME = dt.Rows[i][6].ToString();
                            obj1.STOCKIST_GST_NUM = dt.Rows[i][7].ToString();
                            obj1.CUSTOMER_GST_NUM = dt.Rows[i][8].ToString();
                            obj1.SEC_CUSTOMER_HIERARCHY = dt.Rows[i][9].ToString();
                            obj1.SECONDARY_CUSTOMER_CITY = dt.Rows[i][10].ToString();
                            obj1.INVOICE_TYPE = dt.Rows[i][11].ToString();
                            obj1.SGST_AMOUNT = dt.Rows[i][24].ToString();
                            obj1.CGST_AMOUNT = dt.Rows[i][25].ToString();
                            obj1.IGST_AMOUNT = dt.Rows[i][26].ToString();
                            obj1.TOTAL_TAX_AMOUNT = dt.Rows[i][27].ToString();
                            obj1.NET_AMOUNT = dt.Rows[i][28].ToString();
                            obj1.ADHOC_DISCOUNT = dt.Rows[i][29].ToString();
                            obj1.HO_AI_DISC_JULY17 = dt.Rows[i][30].ToString();
                            obj1.HYUNDAI_DIS_17_18 = dt.Rows[i][31].ToString();
                            obj1.MGO_VC_DIS_16_17 = dt.Rows[i][32].ToString();
                            obj1.SALES_TYPE = dt.Rows[i][33].ToString();
                            obj1.CHALLAN_NO = Convert.ToInt32(dt.Rows[i][34]);
                            obj1.VEHICLE_NO = dt.Rows[i][35].ToString();
                            obj1.Grand_Total = dt.Rows[i][36].ToString();
                            obj1.Discount = dt.Rows[i][37].ToString();
                            obj1.Discount_Type = dt.Rows[i][38].ToString();
                            obj1.Promo_Scheme = dt.Rows[i][39].ToString();
                            obj1.Slip_No = dt.Rows[i][40].ToString();
                            obj1.Cash_Discount = dt.Rows[i][41].ToString();
                            obj1.Cash_Disc_Type = dt.Rows[i][42].ToString();
                            obj1.schdiscount = dt.Rows[i][43].ToString();
                            obj1.foediscount = dt.Rows[i][44].ToString();
                            obj1.foediscounttype = dt.Rows[i][45].ToString();
                            obj1.foediscountrs = dt.Rows[i][46].ToString();
                            obj1.SecSPDisc = dt.Rows[i][47].ToString();
                            obj1.SALEABLE_QTY_IN_LTR_OR_KG = dt.Rows[i][21].ToString();
                            obj1.InsertSalesTemp();  //Save invoice info
                        }
                        if (str == CurrStr)
                        {
                            obj1.Invoice_No = CurrStr;
                            obj1.PRODUCT_CODE = Convert.ToInt32(dt.Rows[i][12]);
                            obj1.PRODUCT_NAME = dt.Rows[i][13].ToString();
                            obj1.HSN_NO = Convert.ToInt32(dt.Rows[i][14]);
                            obj1.PACK_CODE = Convert.ToInt32(dt.Rows[i][15]);
                            obj1.PACK_NAME = dt.Rows[i][16].ToString();
                            obj1.SKU_CODE = Convert.ToInt32(dt.Rows[i][17]);
                            obj1.SALEABLE_QTY = dt.Rows[i][18].ToString();
                            obj1.FREE_QTY = dt.Rows[i][19].ToString();
                            obj1.SAMPLE_QTY = dt.Rows[i][20].ToString();
                            obj1.SALEABLE_QTY_IN_LTR_OR_KG = "";
                            obj1.FREE_QTY_IN_LTR_OR_KG = dt.Rows[i][22].ToString();
                            obj1.SAMPLE_QTY_IN_LTR_OR_KG = dt.Rows[i][23].ToString();
                            obj1.SecInvoiceNo = GetInvoiceNo();
                            int m = i;
                            obj1.sno = m += 1;
                            obj1.Invoice_Date = System.Convert.ToDateTime(GenUtil.str2DDMMYYYYExcel(dt.Rows[i][1].ToString()));
                            obj1.sch = dt.Rows[i][49].ToString();
                            obj1.foe = dt.Rows[i][48].ToString();
                            obj1.schtype = "";
                            obj1.SecSPDisc = "";
                            obj1.SecSPDiscType = "";
                            obj1.foediscounttype = "";
                            obj1.InsertSalesTempProd(); //Save Product Details
                        }
                    }
                    MessageBox.Show("Data Inserted for sheet " + SheetName + " Successfully") ;
                }
                #region Purchase Invoice
                else if (btnPurchaseInvoice.Checked == true)  //Purchase Invoice
                {
                    string str = "";
                    for (int i = 1; i < dt.Rows.Count; i++)
                    {

                        string CurrStr = dt.Rows[i][0].ToString();
                        if (str != CurrStr)
                        {
                            str = CurrStr;
                            obj1.Invoice_No = CurrStr;
                            obj1.Invoice_Date = System.Convert.ToDateTime(GenUtil.str2DDMMYYYY(dt.Rows[i][1].ToString()));
                            obj1.Challan_Id = Int32.Parse(dt.Rows[i][3].ToString());
                            obj1.City_Name = dt.Rows[i][7].ToString();
                            obj1.Geopgrophical_State = dt.Rows[i][8].ToString();
                            obj1.Stockist_SAP_Code = dt.Rows[i][9].ToString();
                            obj1.Stockist_Name = dt.Rows[i][10].ToString();
                            obj1.Source_Of_Supply = dt.Rows[i][11].ToString();
                            obj1.GSTIN = dt.Rows[i][12].ToString();
                            obj1.HSN_Code = dt.Rows[i][13].ToString();
                            obj1.Bill_Type = dt.Rows[i][24].ToString();

                            obj1.InsertPurchaseMasterTemp();  //Save Purchase invoice info
                        }
                        if (str == CurrStr)
                        {
                            obj1.Invoice_No = CurrStr;
                            obj1.Item_Qty = Int32.Parse(dt.Rows[i][2].ToString());
                            obj1.Qty_Ltr_Kg = dt.Rows[i][3].ToString();
                            obj1.SKU_Code = Int32.Parse(dt.Rows[i][5].ToString());
                            obj1.SKU_Name = dt.Rows[i][6].ToString();
                            obj1.RSP_CDP = dt.Rows[i][14].ToString();
                            obj1.SGST_Tax = dt.Rows[i][15].ToString();
                            obj1.CGST_Tax = dt.Rows[i][16].ToString();
                            obj1.IGST_Tax = dt.Rows[i][17].ToString();
                            obj1.Total_Tax = dt.Rows[i][18].ToString();
                            obj1.ZSSD = dt.Rows[i][19].ToString();
                            obj1.ZCON = dt.Rows[i][20].ToString();
                            obj1.ZDFI = dt.Rows[i][21].ToString();
                            obj1.ZDCB = dt.Rows[i][22].ToString();
                            obj1.NET_AMT_IN_PAISE = dt.Rows[i][23].ToString();
                            obj1.InsertPurchaseDetailsTemp(); //Save Purchase invoice Details
                        }
                    }
                    MessageBox.Show("Data Inserted for sheet " + SheetName + " Successfully");

                }
                #endregion
                else
                {
                    MessageBox.Show("Please Select Type Of Invoice");
                    return;
                }

            }

        }
        catch (Exception ex)
        {
            throw;
        }

    }




    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
        string FileName = GridView1.Caption;
        string Extension = Path.GetExtension(FileName);
        string FilePath = Server.MapPath(FolderPath + FileName);

        Import_To_Grid(FilePath, Extension);
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    public string GetInvoiceNo()
    {
        //int no = 0;
        string InNo = "";
        try
        {
            InventoryClass obj = new InventoryClass();
            SqlDataReader SqlDtr;
            string sql;
            sql = "select max(Invoice_No) from Sales_Master";
            SqlDtr = obj.GetRecordSet(sql);
            while (SqlDtr.Read())
            {
                InNo = SqlDtr.GetValue(0).ToString();
                //no = Int32.Parse(InNo);
                //no = no + 1;
            }
            SqlDtr.Close();
            //InNo = no.ToString();
            return InNo;
        }
        catch (Exception)
        {
            return InNo;
            throw;
        }

    }
    public string GetInvoiceNo1()
    {
        int no = 0;
        string InNo = "";
        try
        {
            InventoryClass obj = new InventoryClass();
            SqlDataReader SqlDtr;
            string sql;
            sql = "select max(Invoice_No) from Purchase_Master";
            SqlDtr = obj.GetRecordSet(sql);
            while (SqlDtr.Read())
            {
                InNo = SqlDtr.GetValue(0).ToString();
                no = Int32.Parse(InNo);
                no = no + 1;
            }
            SqlDtr.Close();
            InNo = no.ToString();
            return InNo;
        }
        catch (Exception)
        {
            return InNo;
            throw;
        }

    }
    public void GetCustomerInfo()
    {
        try
        {
            InventoryClass obj = new InventoryClass();
            SqlDataReader SqlDtr,SqlDtr1;          
            
            sql = "select c.City,CR_Days,Curr_Credit,Cust_ID,Cust_Name,Emp_Name from Customer c,Employee e, customertype ct where e.Emp_ID = c.SSR and Cust_Name = '" + Cust_name + "' and c.cust_type = ct.customertypename order by Cust_Name";
            SqlDtr = obj.GetRecordSet(sql);
            while (SqlDtr.Read())
            {                
                Place = SqlDtr.GetValue(0).ToString();

                CrDays = SqlDtr.GetValue(1).ToString();
                duedate= DateTime.Now.AddDays(System.Convert.ToDouble(SqlDtr["CR_Days"]));
                

                CrLimit = SqlDtr.GetValue(2).ToString();
                CustID = SqlDtr.GetValue(3).ToString();

                UnderSalesMan = SqlDtr.GetValue(5).ToString();
                SqlDtr.Close();

                sql1 = "select top 1 Balance,BalanceType from customerledgertable where CustID='" + CustID + "' order by EntryDate Desc";
                SqlDtr1 = obj.GetRecordSet(sql1);
                while (SqlDtr1.Read())
                {
                    CurrBal = SqlDtr1.GetValue(0).ToString() +" "+ SqlDtr1.GetValue(1).ToString();                    
                }
                SqlDtr1.Close();
                break;
            }
            
        }
        catch (Exception ex)
        {
            throw;
        }

    }
}
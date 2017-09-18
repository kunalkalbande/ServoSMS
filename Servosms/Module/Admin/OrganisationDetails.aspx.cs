/*
   Copyright (c) 2005 bbnisys Technologies. All Rights Reserved.
  
   No part of this software shall be reproduced, stored in a 
   retrieval system, or transmitted by any means, electronic 
   mechanical, photocopying, recording  or otherwise, or for
   any  purpose  without the express  written  permission of
   bbnisys Technologies.

*/
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Servosms.Sysitem.Classes;
using DBOperations;
using RMG;
using System.IO;
using System.Text;

namespace Servosms.Module.Admin
{
	/// <summary>
	/// Summary description for OrganisationDetails.
	/// </summary>
	public partial class OrganisationDetails : System.Web.UI.Page
	{
		DBUtil dbobj=new DBUtil(System.Configuration.ConfigurationSettings.AppSettings["Servosms"],true);
		protected System.Web.UI.WebControls.TextBox txtFileTitle;
		string uid;

		/// <summary>
		/// This method is used for setting the Session variable for userId and 
		/// after that filling the required dropdowns with database values 
		/// and also check accessing priviledges for particular user
		/// and generate the next ID also.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void Page_Load(object sender, System.EventArgs e)
		{
			try
			{
				TxtDealership.Visible=false;
				try
				{
					InventoryClass obj=new InventoryClass();
					SqlDataReader sqldtr;
					string sql;
					sql="select * from Sales_Master";
					sqldtr=obj.GetRecordSet(sql);
					if(sqldtr.Read())
						txtStartInvoiceNo.Enabled=false;
					else
						txtStartInvoiceNo.Enabled=true;
					sqldtr.Close();
					uid=(Session["User_Name"].ToString());
				}
				catch(Exception ex)
				{
					CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,Class:InventoryClass.cs ,Method:page_load"+ ex.Message+"  EXCEPTION" +"  "  +uid);
					Response.Redirect("../../Sysitem/ErrorPage.aspx",false);
					return;
				}	
				if(!IsPostBack)
				{
					try
					{
						#region Check Privileges
						// Checks the user id adminnistrator or not ?
						if(Session["User_ID"].ToString ()!="1001")
						{
							Response.Redirect("../../Sysitem/AccessDeny.aspx",false);
							return;
						}
						#endregion
						txtDateFrom.Text=DateTime.Now.Day+"/"+DateTime.Now.Month+"/"+DateTime.Now.Year;
						txtDateTo.Text=DateTime.Now.Day+"/"+DateTime.Now.Month+"/"+DateTime.Now.Year;
						LblCompanyID.Text = "1001";
						showdealer();
						getbeat();
						city();
                        nextid();
                        //GetNextCustomerID();

                    }
					catch(Exception ex)
					{
						CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,Class:InventoryClass.cs ,Method:page_load"+ ex.Message+"  EXCEPTION" +"  "  +uid);
					}
				}

                txtDateFrom.Text = Request.Form["txtDateFrom"] == null ? GenUtil.str2DDMMYYYY(System.DateTime.Now.ToShortDateString()) : Request.Form["txtDateFrom"].ToString().Trim();
                txtDateTo.Text = Request.Form["txtDateTo"] == null ? GenUtil.str2DDMMYYYY(System.DateTime.Now.ToShortDateString()) : Request.Form["txtDateTo"].ToString().Trim();
            }
			catch(Exception ex)
			{
				CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,Class:InventoryClass.cs ,Method:page_load"+ ex.Message+"  EXCEPTION " +"  "  +uid);
			}
		}

		/// <summary>
		/// This is used to concatenate city,state,country for javascripting.
		/// </summary>
		public void getbeat()
		{
			try
			{
				InventoryClass obj=new InventoryClass();
				SqlDataReader sqldtr;
				string sql;
				string str="";
				sql="select city,state,country from beat_master";
				sqldtr=obj.GetRecordSet(sql);
				while(sqldtr.Read())
				{
					str=str+sqldtr.GetValue(0).ToString()+":";
					str=str+sqldtr.GetValue(1).ToString()+":";
					str=str+sqldtr.GetValue(2).ToString()+"#";
				}
				txtbeatname.Text=str;
			}
			catch(Exception ex)
			{
				CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,class:Inventoryclass.cs,method:getbeat()"+"Exception"+ex.Message+uid);
			}
		}

		/// <summary>
		/// If the Dealer name is not present in combo box then add the dealer in combo box.	
		/// </summary>
		public void showdealer()
		{
			
		}

		/// <summary>
		/// This is used to generate next CompanyID auto.
		/// </summary>
		public void GetNextCustomerID()
		{
			PartiesClass obj=new PartiesClass();
			SqlDataReader SqlDtr;

			#region Fetch Next Customer ID
			SqlDtr =obj.GetNextCustomerID1();
			while(SqlDtr.Read())
			{
				LblCompanyID.Text =SqlDtr.GetSqlValue(0).ToString ();
				if (LblCompanyID.Text=="Null")
					LblCompanyID.Text ="1001";
			}	
			SqlDtr.Close();
			#endregion
		}

		/// <summary>
		/// This method is used to Fetch the Organisation ID from Organisation table.
		/// </summary>
		public void nextid()
		{
			PartiesClass obj=new PartiesClass();  
			SqlDataReader SqlDtr;

			#region Fetch the Next Company Number
		
			SqlDtr=obj.GetNextCustomerID1();
			while(SqlDtr.Read())
			{
				LblCompanyID.Text =SqlDtr.GetValue(0).ToString ();				
				if(LblCompanyID.Text=="")
					LblCompanyID.Text="1001";
			}
			SqlDtr.Close ();		
			#endregion
		}
		
		/// <summary>
		/// This is method is used to fetch city,state,country.
		/// </summary>
		public void city()
		{
			try
			{
				EmployeeClass obj=new EmployeeClass();
				SqlDataReader SqlDtr;
				string sql;
				
				#region Fetch Extra Cities from Database and add to the ComboBox
				sql="select distinct City from Beat_Master order by City asc";
				SqlDtr=obj.GetRecordSet(sql);
				while(SqlDtr.Read())
				{
					DropCity.Items.Add(SqlDtr.GetValue(0).ToString()); 
				
				}
				SqlDtr.Close();
				#endregion

				#region Fetch Extra Cities from Database and add to the ComboBox
				sql="select distinct state from Beat_Master order by state asc";
				SqlDtr=obj.GetRecordSet(sql);
				while(SqlDtr.Read())
				{
				
					DropState.Items.Add(SqlDtr.GetValue(0).ToString()); 
				
				}
				SqlDtr.Close();
				#endregion

				#region Fetch Extra Cities from Database and add to the ComboBox
				sql="select distinct country from Beat_Master order by country asc";
				SqlDtr=obj.GetRecordSet(sql);
				while(SqlDtr.Read())
				{
				
					DropCountry.Items.Add(SqlDtr.GetValue(0).ToString()); 
				}
				SqlDtr.Close();
				#endregion
			}
			catch(Exception ex)
			{
				CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,Class:InventoryClass.cs ,Method:btnupdate_click"+ ex.Message+"  EXCEPTION" +"  "  +uid);
			}
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

		/// <summary>
		/// This method used to check the date, date should not be blank and also check the 
		/// to date must be greter then from date. if not than show popup msg for user.
		/// </summary>
		/// <returns></returns>
		public bool checkValidity()
		{
            string ErrorMessage = "";
			bool flag = true;
			
			if(string.IsNullOrEmpty(Request.Form["txtDateFrom"].ToString()))
			{
				ErrorMessage = ErrorMessage + " - Please Select Accounts Period From Date\n";
				flag = false;
			}
			if(string.IsNullOrEmpty(Request.Form["txtDateTo"].ToString()))
			{
				ErrorMessage = ErrorMessage + " - Please Select Accounts Period To Date\n";
				flag = false;
			}
			if(flag == false)
			{
				MessageBox.Show(ErrorMessage);
				return false;
			}
			if(System.DateTime.Compare(ToMMddYYYY(Request.Form["txtDateFrom"].ToString().Trim()),ToMMddYYYY(Request.Form["txtDateTo"].ToString().Trim())) > 0)
			{
				MessageBox.Show("Date From Should be less than Date To");
				return false;
			}
			else
			{
				return true;
			}
		}

		/// <summary>
		/// This method is used to split the date.
		/// </summary>
		/// <param name="str"></param>
		/// <returns></returns>
		public DateTime ToMMddYYYY(string str)
		{
			int dd,mm,yy;
			string [] strarr = new string[3];			
			strarr=str.Split(new char[]{'/'},str.Length);
			dd=Int32.Parse(strarr[0]);
			mm=Int32.Parse(strarr[1]);
			yy=Int32.Parse(strarr[2]);
			DateTime dt=new DateTime(yy,mm,dd);			
			return(dt);
		}

		/// <summary>
		/// This method is used to update the informatoin in organiaztion table.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void btnUpdate_Click(object sender, System.EventArgs e)
		{
			try
			{
                StringBuilder errorMessage = new StringBuilder();
                if (TxtTinno.Text != string.Empty)
                {
                    string sPattern = "^[a-zA-Z0-9]+$";
                    if (!System.Text.RegularExpressions.Regex.IsMatch(TxtTinno.Text, sPattern))
                    {
                        errorMessage.Append("- Please Enter Tin No. in Alpha Numeric");
                        errorMessage.Append("\n");
                    }
                }
                if (errorMessage.Length > 0)
                {
                    MessageBox.Show(errorMessage.ToString());
                    return;
                }
                CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,Class:InventoryClass.cs ,Method:btnupdate_click"+ "  "  +uid);
				if(DropDealerShip.SelectedIndex == 0)
				{
					MessageBox.Show("Please select the Dealership");
					return;
				}
				if(!checkValidity())
				{
					return;
				}
				if(LblCompanyID.Visible==true)
				{
					if(LblCompanyID.Text=="")
					{
						MessageBox.Show("Organisation Details Already Stored ");
						return;
					}
					saveimage();
				}
				else if(Drop.Visible==true)
				{
					Label1.Visible=true;
					saveimage1();
					Label1.Visible=true;
					Drop.Visible = false; 
					Button1.Visible = true;
					LblCompanyID.Visible=true;
				}
			}
			catch(Exception ex)
			{
				CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,Class:InventoryClass.cs ,Method:btnupdate_click"+ ex.Message+"  EXCEPTION" +"  "  +uid);
				TextBox1.Text="j";
			}
		}

		/// <summary>
		/// This method is used to clear the form.
		/// </summary>
		public void clear()
		{
			txtDealerName.Text="";
			TxtDealership.Text="";
			TxtAddress .Text="";
			DropCity.SelectedIndex=0;
			DropState.SelectedIndex=0;
			DropCountry .SelectedIndex=0;
			txtPhoneOff.Text="";
			TxtFaxNo.Text="";
			txtEMail.Text="";
			TxtWebsite.Text="";
			TxtTinno.Text="";
			txtfood.Text="";
			TxtWMlic .Text="";
			DropDealerShip.SelectedIndex = 0; 
			Drop.Items.Clear();
			Drop.Items.Add("Select");  
			Drop.SelectedIndex=0;
			txtMsg.Text = "";
			txtVatRate.Text = "";
			txtDateFrom.Text = "";
			txtDateTo.Text = "";
			dropstateoffice.SelectedIndex=0;
			txtentry.Text="";
			txtStartInvoiceNo.Text="";
		}

		/// <summary>
		/// This method is used to Insert the Organisation details into organisation table.
		/// </summary>
		public void saveimage()
		{
			try
			{
				//This Code Is hide  20 feb 2006  , This code is used for image upload in data base.
				SqlConnection conMyData;
				string  strInsert;
				SqlCommand cmdInsert;
				if ( txtFileContents.PostedFile != null )
				{
					int fileLen = txtFileContents.PostedFile.FileName.Length;
					int Lastindex = txtFileContents.PostedFile.FileName.LastIndexOf("\\");
					string filename =  txtFileContents.PostedFile.FileName.Substring(Lastindex + 1);
					conMyData=new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["Servosms"]);
					conMyData.Open ();
				
					//strInsert = "Insert Organisation (CompanyID,DealerName,DealerShip,Address,City,State,Country ,PhoneNo ,FaxNo ,Email,Website,TinNo,ExplosiveNo ,FoodLicNO,WM,Logo,Div_Office,Message,VAT_Rate,Acc_Date_from,Acc_Date_to) " +      "Values (@CompanyID,@DealerName,@DealerShip,@Address,@City,@State,@Country ,@PhoneNo,@FaxNo ,@Email,@Website,@TinNo,@ExplosiveNo,@FoodLicNO,@WM,@Logo,@Div_Office,@Message,@VAT_Rate,@Acc_date_from,@Acc_date_To)";
					strInsert = "Insert Into Organisation (CompanyID,DealerName,DealerShip,Address,City,State,Country ,PhoneNo ,FaxNo ,Email,Website,TinNo,Entrytax ,FoodLicNO,WM,Logo,Div_Office,Message,VAT_Rate,Acc_Date_from,Acc_Date_to,startinvoice) " +      "Values (@CompanyID,@DealerName,@DealerShip,@Address,@City,@State,@Country ,@PhoneNo,@FaxNo ,@Email,@Website,@TinNo,@Entrytax,@FoodLicNO,@WM,@Logo,@Div_Office,@Message,@VAT_Rate,@Acc_date_from,@Acc_date_To,@StartInvoice)";
					cmdInsert = new SqlCommand( strInsert, conMyData );
				
					cmdInsert.Parameters.Add( "@StartInvoice", txtStartInvoiceNo.Text);
					cmdInsert.Parameters.Add( "@CompanyID", LblCompanyID.Text );
					cmdInsert.Parameters.Add( "@DealerName", txtDealerName.Text );
					if(!DropDealerShip.SelectedItem.Text.ToString().Equals("Other"))
					{
						cmdInsert.Parameters.Add("@DealerShip", DropDealerShip.SelectedItem.Value.ToString());
					}
					else
					{
						cmdInsert.Parameters.Add("@DealerShip", TxtDealership.Text );
						if(DropDealerShip.Items.IndexOf(DropDealerShip.Items.FindByValue(TxtDealership.Text)) == -1)      
							DropDealerShip.Items.Add( TxtDealership.Text);
					}
				
					cmdInsert.Parameters.Add( "@Address", TxtAddress .Text.ToString() );
					//		cmdInsert.Parameters.Add( "@Address", TxtAddress .Text.ToString()+" "+TxtAddress1.Text.ToString()+" "+TxtAddress2.Text.ToString() );
					cmdInsert.Parameters.Add( "@City", DropCity.SelectedItem.Value.ToString() );
					cmdInsert.Parameters.Add( "@State", DropState.SelectedItem.Value.ToString() );
					cmdInsert.Parameters.Add( "@Country", DropCountry .SelectedItem.Value.ToString() );
					cmdInsert.Parameters.Add( "@PhoneNo", txtPhoneOff.Text.ToString() );
					cmdInsert.Parameters.Add( "@FaxNo", TxtFaxNo.Text.ToString() );
					cmdInsert.Parameters.Add( "@Email", txtEMail.Text.ToString() );
					cmdInsert.Parameters.Add( "@Website", TxtWebsite .Text.ToString() );
					cmdInsert.Parameters.Add( "@TinNo", TxtTinno.Text.ToString() );
					//	cmdInsert.Parameters.Add( "@ExplosiveNo", txtExplosive.Text.ToString() );
					cmdInsert.Parameters.Add( "@Entrytax", txtentry.Text.Trim().ToString() );
					cmdInsert.Parameters.Add( "@FoodLicNO", txtfood.Text.ToString() );
					cmdInsert.Parameters.Add( "@WM", TxtWMlic .Text.ToString() );
					cmdInsert.Parameters.Add( "@Logo",txtFileContents.PostedFile.FileName.ToString());
					//	cmdInsert.Parameters.Add( "@Div_Office",txtDivOffice.Text.ToString() );
					cmdInsert.Parameters.Add( "@Div_Office",dropstateoffice.SelectedItem.Value.ToString() );
					cmdInsert.Parameters.Add( "@Message",txtMsg.Text.ToString() );
					cmdInsert.Parameters.Add("@VAT_Rate",txtVatRate.Text.Trim().ToString());    
					cmdInsert.Parameters.Add("@Acc_date_from",GenUtil.str2MMDDYYYY(txtDateFrom.Text.Trim()));    
					cmdInsert.Parameters.Add("@Acc_date_to",GenUtil.str2MMDDYYYY(txtDateTo.Text.Trim()));
					Session["Message"] = txtMsg.Text.ToString();
					Session["VAT_Rate"] = txtVatRate.Text.Trim(); 
					Session["Entrytax"] = txtentry.Text.Trim(); 
					cmdInsert.ExecuteNonQuery();
					//********************************
					object op = null;
					dbobj.ExecProc(OprType.Insert,"ProInsertLedger",ref op,"@Ledger_Name","Cash","@SubGrp_Name","Cash in hand","@Group_Name","Current Assets","@Grp_Nature","Assets","@Op_Bal","0","@Bal_Type","Dr");
					clear();
					MessageBox.Show("Organisation Details Saved");	
					conMyData.Close();
				
					CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,Class:EmployeeClass.cs ,Method:saveImage(). Organisation Details Saved. User_ID: "+uid);
				}
			}
			catch(Exception ex)
			{
				CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,Class:EmployeeClass.cs ,Method:image"+"  EXCEPTION "+ ex.Message+uid);
			}
		}
		
		/// <summary>
		/// This method is used to fatch the organization id from organization table and fill the 
		/// dropdownlist on edit time.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void Button1_Click(object sender, System.EventArgs e)
		{  
			CreateLogFiles Err = new CreateLogFiles();
			try
			{
				Label1.Visible=true;
				//txtFileTitle.Enabled=false;
				txtFileContents.EnableViewState =false;
				Button1.Visible=false;
				Drop.Visible=true;
				LblCompanyID.Visible=false;
				txtFileContents .Visible =false;
			
				InventoryClass obj=new InventoryClass ();
				SqlDataReader SqlDtr;
				string sql;
			
				sql="select max(CompanyID) from Organisation";
				SqlDtr=obj.GetRecordSet(sql);
				while(SqlDtr.Read())
				{
					Drop.Items.Add(SqlDtr.GetValue(0).ToString());
				}
				SqlDtr.Close ();	
				
			}
			catch(Exception ex)
			{
				CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,Class:InventoryClass.cs ,Method:saveButton   EXCEPTION: "+ ex.Message+"  User_ID: "+uid);
			}
		}

		/// <summary>
		/// This method is used to update the Organisation details.
		/// </summary>
		public void saveimage1()
		{
			try
			{
				SqlConnection conMyData;
				string  strInsert;
				SqlCommand cmdInsert;
				conMyData=new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["Servosms"]);
				conMyData.Open();
				//strInsert = "update Organisation set CompanyID=@CompanyID,DealerName=@DealerName,DealerShip=@DealerShip,Address=@Address,City=@City,State=@State,Country=@Country  ,PhoneNo=@PhoneNo ,FaxNo=@FaxNo ,Email=@Email,Website=@Website,TinNo=@TinNo,ExplosiveNo=@ExplosiveNo ,FoodLicNO=@FoodLicNO,WM=@WM ,Logo=@Logo,Div_Office=@Div_Office,Message=@Message,VAT_Rate = @VAT_Rate,Acc_Date_From = @Acc_date_From,Acc_Date_To = @Acc_date_to where CompanyID=@CompanyID";
				strInsert = "update Organisation set CompanyID=@CompanyID,DealerName=@DealerName,DealerShip=@DealerShip,Address=@Address,City=@City,State=@State,Country=@Country  ,PhoneNo=@PhoneNo ,FaxNo=@FaxNo ,Email=@Email,Website=@Website,TinNo=@TinNo,Entrytax=@Entrytax ,FoodLicNO=@FoodLicNO,WM=@WM ,Logo=@Logo,Div_Office=@Div_Office,Message=@Message,VAT_Rate = @VAT_Rate,Acc_Date_From = @Acc_date_From,Acc_Date_To = @Acc_date_to, StartInvoice=@StartInvoice where CompanyID=@CompanyID";
                cmdInsert = new SqlCommand( strInsert, conMyData );
				cmdInsert.Parameters.Add( "@StartInvoice", txtStartInvoiceNo.Text.ToString());
				cmdInsert.Parameters.Add( "@document", txtFileContents.Value.ToString());
				cmdInsert.Parameters.Add( "@CompanyID", Drop.SelectedItem.Value.ToString());
				cmdInsert.Parameters.Add( "@DealerName", txtDealerName.Text );
				if(!DropDealerShip.SelectedItem.Text.ToString().Equals("Other")  )
				{
					cmdInsert.Parameters.Add("@DealerShip", DropDealerShip.SelectedItem.Value.ToString());
				}
				else
				{
					cmdInsert.Parameters.Add("@DealerShip", TxtDealership.Text.Trim()  );
					if(DropDealerShip.Items.IndexOf(DropDealerShip.Items.FindByValue(TxtDealership.Text)) == -1)      
						DropDealerShip.Items.Add( TxtDealership.Text);
				}
				cmdInsert.Parameters.Add( "@Address", TxtAddress .Text.ToString() );
				//cmdInsert.Parameters.Add( "@Address", TxtAddress .Text.ToString()+" "+TxtAddress1.Text.ToString()+" "+TxtAddress2.Text.ToString() );
				cmdInsert.Parameters.Add( "@City", DropCity.SelectedItem.Value.ToString() );
				cmdInsert.Parameters.Add( "@State", DropState.SelectedItem.Value.ToString() );
				cmdInsert.Parameters.Add( "@Country", DropCountry .SelectedItem.Value.ToString() );
				cmdInsert.Parameters.Add( "@PhoneNo", txtPhoneOff.Text.ToString() );
				cmdInsert.Parameters.Add( "@FaxNo", TxtFaxNo.Text.ToString() );
				cmdInsert.Parameters.Add( "@Email", txtEMail.Text.ToString() );
				cmdInsert.Parameters.Add( "@Website", TxtWebsite .Text.ToString() );
				cmdInsert.Parameters.Add( "@TinNo", TxtTinno.Text.ToString() );
				//	cmdInsert.Parameters.Add( "@ExplosiveNo", txtExplosive.Text.ToString() );
				cmdInsert.Parameters.Add( "@Entrytax", txtentry.Text.ToString() );
				cmdInsert.Parameters.Add( "@FoodLicNO", txtfood.Text.ToString() );
				cmdInsert.Parameters.Add( "@WM", TxtWMlic .Text.ToString() );
				cmdInsert.Parameters.Add( "@Logo", txtFileContents.PostedFile.FileName.ToString() );
				//	cmdInsert.Parameters.Add( "@Div_Office", txtDivOffice.Text.ToString() );
				cmdInsert.Parameters.Add( "@Div_Office",dropstateoffice.SelectedItem.Value.ToString() );
				cmdInsert.Parameters.Add( "@Message", txtMsg.Text.ToString() );
				cmdInsert.Parameters.Add("@VAT_Rate", txtVatRate.Text.Trim().ToString());    
				cmdInsert.Parameters.Add("@Acc_date_from",GenUtil.str2MMDDYYYY(txtDateFrom.Text.Trim()));    
				cmdInsert.Parameters.Add("@Acc_date_to",GenUtil.str2MMDDYYYY(txtDateTo.Text.Trim()));
			
				Session["Message"] = txtMsg.Text.ToString();
				Session["VAT_Rate"] = txtVatRate.Text.Trim(); 
				Session["Entrytax"] = txtentry.Text.Trim(); 
				
				cmdInsert.ExecuteNonQuery();

				CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,Class:InventoryClass.cs ,Method:saveImage() Organisation Details Updated.  userid "+uid);

				clear();
				MessageBox.Show("Organisation Details Updated ");	
				showdealer();
				conMyData.Close();
			}
			catch(Exception ex)
			{
				CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,Class:InventoryClass.cs ,Method:saveImage(). EXCEPTION: "+ex.Message+".   userid "+uid);
			}
		}

		/// <summary>
		/// This method is used to set the image path in session variable.
		/// </summary>
		public void SaveimageinFolder()
		{
			string strpath =System.Configuration .ConfigurationSettings .AppSettings["FileUploadPath"];  
			string strExt=System.IO.Path .GetFileName (txtFileContents.PostedFile.FileName);
			string  filePath=strpath+"/"+strExt;
			txtFileContents.PostedFile.SaveAs(filePath);
			Session["rajImage"]=filePath; 
		}

		/// <summary>
		/// This method is used to Displays the Organisation details information on edit time.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void Drop_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			try
			{
				txtdumy.Text=Drop.SelectedItem.Value.ToString();
				if(txtdumy.Text=="Select")
				{
					MessageBox.Show("Please Select Company ID ");
				}
				else
				{
					InventoryClass  obj=new InventoryClass ();
					SqlDataReader SqlDtr;
					string sql;
			
					sql="select * from Organisation where CompanyID='"+ Drop.SelectedItem.Value +"'" ;
					SqlDtr=obj.GetRecordSet(sql); 
					while(SqlDtr.Read())
					{
						txtDealerName.Text=SqlDtr.GetValue(1).ToString();  
						DropDealerShip.SelectedIndex=(DropDealerShip.Items.IndexOf((DropDealerShip.Items.FindByValue (SqlDtr.GetValue(2).ToString()))));
						TxtAddress.Text=SqlDtr.GetValue(3).ToString();
						DropCity .SelectedIndex=(DropCity.Items.IndexOf((DropCity.Items.FindByValue(SqlDtr.GetValue(4).ToString()))));
						DropState .SelectedIndex=(DropState.Items.IndexOf((DropState.Items.FindByValue(SqlDtr.GetValue(5).ToString()))));
						DropCountry .SelectedIndex=(DropCountry .Items.IndexOf((DropCountry .Items.FindByValue(SqlDtr.GetValue(6).ToString()))));
						txtPhoneOff.Text=SqlDtr.GetValue(7).ToString();
						TxtFaxNo.Text=SqlDtr.GetValue(8).ToString(); 
						txtEMail .Text =SqlDtr.GetValue(9).ToString(); 
						TxtWebsite.Text= SqlDtr.GetValue(10).ToString(); 
						TxtTinno .Text=SqlDtr.GetValue(11).ToString();  
	  
						txtentry.Text=SqlDtr.GetValue(12).ToString(); 
						txtfood.Text= SqlDtr.GetValue(13).ToString();  
						TxtWMlic.Text= SqlDtr.GetValue(14).ToString();  
						dropstateoffice .SelectedIndex =  (dropstateoffice .Items.IndexOf((dropstateoffice  .Items.FindByValue(SqlDtr.GetValue(16).ToString()))));
						txtFileContents.Name = SqlDtr.GetValue(15).ToString(); 
						txtMsg.Text = SqlDtr.GetValue(17).ToString();
						txtVatRate.Text = GenUtil.strNumericFormat(SqlDtr.GetValue(18).ToString().Trim ());  
						txtDateFrom.Text = checkDate(GenUtil.str2DDMMYYYY(trimDate(SqlDtr.GetValue(19).ToString().Trim ()))); 
						txtDateTo.Text = checkDate(GenUtil.str2DDMMYYYY(trimDate(SqlDtr.GetValue(20).ToString().Trim ()))); 
						txtStartInvoiceNo.Text=SqlDtr.GetValue(21).ToString();
					}
					SqlDtr.Close();
				}
			}
			catch(Exception ex)
			{
				CreateLogFiles.ErrorLog("Form:OrganisationDetails.aspx,Class:InventoryClass.cs ,Method:Drop_SelectedIndexChanged(). EXCEPTION: "+ex.Message+".   userid "+uid);
			}
			
		}
		
		/// <summary>
		/// This is used to make blank if date is "1/1/1900".
		/// </summary>
		/// <param name="str"></param>
		/// <returns></returns>
		public string checkDate(string str)
		{
			if(!str.Trim().Equals(""))
			{
				if(str.Trim().Equals("1/1/1900"))
					str = "";
			}
			return str;
		}

		/// <summary>
		/// This method is used to seprate time from date and returns only date in mm/dd/yyyy
		/// </summary>
		/// <param name="strDate"></param>
		/// <returns></returns>
		public string trimDate(string strDate)
		{
			int pos = strDate.IndexOf(" ");
			if(pos != -1)
			{
				strDate = strDate.Substring(0,pos);
			}
			else
			{
				strDate = "";					
			}
			return strDate;
		}

		/// <summary>
		/// If the dealer name is other then visible the Text Box to enter the dealer name. 
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void DropDealerShip_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			txtdummy.Text=DropDealerShip.SelectedItem.Value.ToString();
			if(txtdummy.Text=="Other")
			{
				TxtDealership.Visible=true;
			}
			else
			{
				TxtDealership.Visible=false;
			}
		}

		/// <summary>
		/// This method is not used.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void DropCity_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			
		}

		protected void txtDealerName_TextChanged(object sender, System.EventArgs e)
		{
		
		}

		protected void txtdummy_TextChanged(object sender, System.EventArgs e)
		{
		
		}

        protected void txtDateFrom_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDateTo_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
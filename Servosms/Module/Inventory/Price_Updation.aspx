<!--
   Copyright (c) 2005 bbnisys Technologies. All Rights Reserved.
  
   No part of this software shall be reproduced, stored in a 
   retrieval system, or transmitted by any means, electronic 
   mechanical, photocopying, recording  or otherwise, or for
   any  purpose  without the express  written  permission of
   bbnisys Technologies.
-->
<%@ Page Language="c#" Inherits="Servosms.Module.Inventory.Price_Updation" CodeFile="Price_Updation.aspx.cs" %>
<%@ Import namespace="System.Data.SqlClient"%>
<%@ Import namespace="DBOperations" %>
<%@ Import namespace="Servosms.Sysitem.Classes"%>
<%@ Import namespace="RMG"%>
<%@ Register TagPrefix="uc1" TagName="Header" Src="../../HeaderFooter/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="../../HeaderFooter/Footer.ascx" %>

<HTML>
	<HEAD>
	<script language="javascript">
		function change(e)
		{
			if(window.event) 
			{
				key = e.keyCode;
				isCtrl = window.event.ctrlKey
				if(key==17)
					document.getElementById("STM0_0__0___").focus();		
			}
		}
		if(document.getElementById("STM0_0__0___")!=null)
			window.onload=change();
		</script>
	<script language=JavaScript>
	function makeRound(t)
	{

	var str = t;
	if(str != "")
	{
	str = eval(str)*100;

	str  = Math.round(str);

	str = eval(str)/100;

	t = str;
	return t;
	}
	
	}
		
		function check1(t,t1,t2,t3,t4)
		{
		
		var temp = t.value;
		var temp2=t1.value;
		var temp1 = t2.value;
		if(temp != "")
		{
		  if(temp1 == "Fuel")
		  {
		    temp2  = eval(temp2)/1000; 
		   if (temp2 >= temp)
		   {
		   alert("Sales Rate of Product "+t3.value+" should be greater than "+makeRound(temp2));
		   t4.checked = false;
		   t.disabled=true
	       t1.disabled=true
		   
		   return false;
		   }
		  }
		
		 }
		
		
		
		return true;
		}
	function enableText(t,t1,t2)
	{
	  if(t.checked)
	  {
	    t1.disabled=false
	    t2.disabled=false
	  }
	  else
	  {
	    t1.disabled=true
	    t2.disabled=true
	  }
	}	
	
	function selectAll()
	{
		var f=document.f1
		if(f.chkSelectAll.checked)
		{
		   for(var i=0;i<f.length;i++)
		   {	
		      if(f.elements[i].type=="text")
	          {    
	               f.elements[i].disabled=false
              }
			  f.elements[i].checked=true
		   }
		   
		}	
		else
		{
			for(var i=0;i<f.length;i++)
			{
			   if(f.elements[i].type=="text")
	           {    
	                f.elements[i].disabled=true
               }
				f.elements[i].checked=false
			}	
		}
	}
	
	
	function Validate()
	{
	  
	  var flag=0
	  var AnyChecked=0
	  var f=document.f1
	  // DO	NOT ADD/REMOVE ANY COMPONENT FROM THIS FORM
	  // OTHERWISE CHANGE THE INCREMANTATION  FACTOR APPROPRIATELY
	  for(var i=6;i<f.length;i=i+6)
	  { 
	   	if(f.elements[i].checked)
	 	{  
	       AnyChecked=1
	      if(f.elements[i-2].value=="" ||f.elements[i-1].value=="")
		 {
			alert("Please Fill Purchase and Sales Rates of Checked Product")
			return
		 }
		}
	  }

		
		 f.submit()
	
	}
	</script>
		<title>ServoSMS: Price Updation</title>
		<script id="Validations" language="javascript" src="../../Sysitem/JS/Validations.js"></script>
		<LINK rel="stylesheet" type="text/css" href="../../Sysitem/Styles.css">
	</HEAD>
	<body onkeydown="change(event)">
		<form name="f1" id="f1" method="post" runat=server>
			<uc1:Header id="Header1" runat="server"></uc1:Header>
			<table width=778 height=278 align=center>
				<TR>
					<TH align="center"><font color=#CE4848>Price Updation</font><hr>
					</TH>
				</TR>
				<tr>
					<td align="center">
						<table border=1 bordercolor="#DEBA84" cellpadding=0 cellspacing=0>
							<tr>
								<th align="center" bgcolor=#CE4848><font color=white>Product Code</font></th>
								<th align="center" bgcolor=#CE4848><font color=white>Product Name</font></th>
								<th align="center" bgcolor=#CE4848><font color=white>Pack Type</font></th>
								<th align="center" bgcolor=#CE4848><font color=white>Purchase Rate</font></th>
								<th align="center" bgcolor=#CE4848><font color=white>Sales Rate</font></th>
								<th align="center" bgcolor=#CE4848><font color=white>Select</font></th>
							</tr>
							<%
								DBUtil dbobj=new DBUtil(System.Configuration.ConfigurationSettings.AppSettings["Servosms"],true);
								InventoryClass obj=new InventoryClass ();
								SqlDataReader SqlDtr,rdr=null;
								string sql;
								int Prod_No=0;

								//sql="select distinct Category, Prod_Name, Pack_Type from Products order by Prod_Name";
								sql="select distinct Category, Prod_Name, Pack_Type, Prod_Code from Products order by Prod_Name";
								SqlDtr=obj.GetRecordSet(sql);
								while(SqlDtr.Read())
								{
								dbobj.SelectQuery("select top 1 Pur_Rate, Sal_Rate from Price_Updation where Prod_ID=(select Prod_ID from Products where Prod_Name='"+ SqlDtr.GetValue(1).ToString() +"' and Category='"+ SqlDtr.GetValue(0).ToString() +"' and Pack_Type='"+SqlDtr.GetValue(2).ToString()+"') order by Eff_Date desc",ref rdr);
							%>
							<tr>
								
								<td bgcolor="#FFF7E7">&nbsp;<font color="#8C4510"><%=SqlDtr.GetValue(3).ToString()%><input type=hidden name=lblCat<%=Prod_No%> value="<%=SqlDtr.GetValue(3).ToString()%>"></font></td>
								<td bgcolor="#FFF7E7">&nbsp;<font color="#8C4510"><%=SqlDtr.GetValue(1).ToString()%><input type=hidden name=lblProd_Name<%=Prod_No%> value="<%=SqlDtr.GetValue(1).ToString()%>"></font></td>
								<td bgcolor="#FFF7E7">&nbsp;<font color="#8C4510"><%=SqlDtr.GetValue(2).ToString()%><input type=hidden name=lblPack_Type<%=Prod_No%> value="<%=SqlDtr.GetValue(2).ToString()%>"></font></td>
								<% if(rdr.Read())
								   {
								%>
									<td bgcolor="#FFF7E7"><input  maxlength=8 value=<%=rdr["Pur_Rate"].ToString()%>  disabled type=text size=10 name=txtPurRate<%=Prod_No%> style="border-style:Groove; FONT-SIZE: 8pt;" onkeypress="return GetOnlyNumbers(this, event, false,true);"></td> 
									<td bgcolor="#FFF7E7"><input maxlength=8 value=<%=rdr["Sal_Rate"].ToString()%>   disabled type=text size=10 name=txtSaleRate<%=Prod_No%> style="border-style:Groove; FONT-SIZE: 8pt;" onkeypress="return GetOnlyNumbers(this, event, false,true);" onBlur ="check1(this,txtPurRate<%=Prod_No%>,lblCat<%=Prod_No%>,lblProd_Name<%=Prod_No%>,chk<%=Prod_No%> );"></td> 
								<% }
								%>
								<% else
								   {
								%>
									<td bgcolor="#FFF7E7"><input maxlength=8 disabled type=text size=10 name=txtPurRate<%=Prod_No%> style="border-style:Groove; FONT-SIZE: 8pt;" onkeypress="return GetOnlyNumbers(this, event, false,true);"></td> 
									<td bgcolor="#FFF7E7"><input maxlength=8 disabled type=text size=10 name=txtSaleRate<%=Prod_No%> style="border-style:Groove; FONT-SIZE: 8pt;" onkeypress="return GetOnlyNumbers(this, event, false,true);" onBlur ="check1(this,txtPurRate<%=Prod_No%>,lblCat<%=Prod_No%>,lblProd_Name<%=Prod_No%>,chk<%=Prod_No%> );"></td> 
								<% }
								%>
								<td align=center bgcolor="#FFF7E7"><input type=checkbox name=chk<%=Prod_No%> onclick="enableText(this,document.f1.txtPurRate<%=Prod_No%>,document.f1.txtSaleRate<%=Prod_No%>);"></td>
							</tr>
							<%	Prod_No++;
								}
							%>
							<tr><td bgcolor="#FFF7E7"><input type=hidden name=Total_Prod value=<%=Prod_No%>></td></tr>
							<tr><th colspan=5 align=right bgcolor="#CE4848"><font color=white>Select All</font></th><td align=center bgcolor="#CE4848"><input type=checkbox name=chkSelectAll onclick="selectAll();"></td></tr>
						</table>
					</td>
				</tr>
				<TR>
					<TD align="center"><asp:Button ID=Btnsubmit1 Text=submit Runat=server OnClick="update" Width=75></asp:Button></TD>
					
				</TR>
			</table><uc1:Footer id="Footer1" runat="server"></uc1:Footer>
		</form>
	</body>
</HTML>
<script language=C# runat =server >
		private void Page_Load(object sender, System.EventArgs e)
		{
			
		/*	try
			{
				string pass;
				pass=(Session["User_Name"].ToString());
			}
			catch
			{
				Response.Redirect("../../Sysitem/ErrorPage.aspx",false);
				return;
			}
			if(!IsPostBack)
			{
				DBOperations.DBUtil dbobj=new DBOperations.DBUtil(System.Configuration.ConfigurationSettings.AppSettings["Servosms"],true);
				#region Check Privileges
				int i;
				string View_flag="0", Add_Flag="0", Edit_Flag="0", Del_Flag="0";
				string Module="4";
				string SubModule="2";
				string[,] Priv=(string[,]) Session["Privileges"];
				for(i=0;i<Priv.GetLength(0);i++)
				{
					if(Priv[i,0]== Module &&  Priv[i,1]==SubModule)
					{						
						View_flag=Priv[i,2];
						Add_Flag=Priv[i,3];
						Edit_Flag=Priv[i,4];
						Del_Flag=Priv[i,5];
						break; 
					}
				}	
				if(View_flag=="0")
				{
					//string msg="UnAthourized Visit to Price Updation Page";
				//	dbobj.LogActivity(msg,Session["User_Name"].ToString());  
					Response.Redirect("../../Sysitem/AccessDeny.aspx",false);
				}
				if(Add_Flag =="0")
				  Btnsubmit1.Enabled = false; 
				if(Edit_Flag =="0")
				  Btnsubmit1.Enabled = false; 
				#endregion
			}*/
			 
		}
		
		
		public void update(Object sender, EventArgs e )
		{  
		 try
		 {
			InventoryClass obj=new InventoryClass(); 
			int Total_Product=0;
			string prod_cat="";
			int flag = 0;
			 

			Total_Product=System.Convert.ToInt32(Request.Params.Get("Total_Prod"));
			for(int i=0;i<Total_Product;i++)
			{ 
				if(Request.Params.Get("Chk"+i)!=null)
				{ 
					obj.Eff_Date=DateTime.Now.Date.ToShortDateString();
					
					obj.Product_Name=Request.Params.Get("lblProd_Name"+i); 
					obj.Package_Type=Request.Params.Get("lblPack_Type"+i); 
					//prod_cat = Request.Params.Get("lblCat"+i);
					obj.Pur_Rate=Request.Params.Get("txtPurRate"+i); 
					obj.Sal_Rate=Request.Params.Get("txtSaleRate"+i); 
					
					obj.InsertPriceUpdation(); 		
					CreateLogFiles.ErrorLog("Form:Price_Updation.aspx,Method:update().   Price Updated of product " +Request.Params.Get("lblProd_Name"+i)+" User_ID: "+Session["User_Name"].ToString());
							
				}
			}
				MessageBox.Show("Prices Updated");
		 }
		 catch(Exception ex)
		 {
		   CreateLogFiles.ErrorLog("Form:Price_Updation.aspx,Method:update().   EXCEPTION " +ex.Message +"  User_ID : "+ Session["User_Name"].ToString());
		 }
			
		}
</script>
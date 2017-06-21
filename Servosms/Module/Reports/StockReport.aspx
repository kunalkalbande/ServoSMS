<%@ Page language="c#" Inherits="Servosms.Module.Reports.StockReport" CodeFile="StockReport.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="../../HeaderFooter/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="../../HeaderFooter/Footer.ascx" %>
<%@ Import namespace="Servosms.Sysitem.Classes" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ServoSMS: Stock Report</title> <!--
   Copyright (c) 2005 bbnisys Technologies. All Rights Reserved.
  
   No part of this software shall be reproduced, stored in a 
   retrieval system, or transmitted by any means, electronic 
   mechanical, photocopying, recording  or otherwise, or for
   any  purpose  without the express  written  permission of
   bbnisys Technologies.
-->
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Sysitem/Styles.css" type="text/css" rel="stylesheet">
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
	</HEAD>
	<body onkeydown="change(event)">
		<form id="Form1" method="post" runat="server">
			<uc1:header id="Header1" runat="server"></uc1:header><asp:textbox id="TextBox1" style="Z-INDEX: 102; LEFT: 152px; POSITION: absolute; TOP: 16px" runat="server"
				Visible="False" Width="8px"></asp:textbox>
			<table height="290" cellSpacing="0" cellPadding="0" width="778" align="center">
				<TR>
					<TH style="HEIGHT: 4px">
						<font color="#ce4848">Stock Report</font>
						<hr>
					</TH>
				</TR>
				<TR>
					<TD style="HEIGHT: 61px" align="center">
						<TABLE cellSpacing="0" cellPadding="0">
							<TR>
								<TD>Date&nbsp;&nbsp;</TD>
								<TD><asp:textbox id="txtDateTo" runat="server" Width="80px" BorderStyle="Groove" CssClass="fontstyle"
										ReadOnly="True"></asp:textbox><A onclick="if(self.gfPop)gfPop.fPopCalendar(document.Form1.txtDateTo);return false;"><IMG class="PopcalTrigger" alt="" src="../../HeaderFooter/DTPicker/calender_icon.jpg"
											align="absMiddle" border="0"></A></TD>
								<TD>&nbsp;&nbsp;Stock Location&nbsp;&nbsp;</TD>
								<td><asp:dropdownlist id="drpstore" runat="server" Width="100px" CssClass="fontstyle"></asp:dropdownlist></td>
								<td>&nbsp;&nbsp;Pack Type&nbsp;&nbsp;</td>
								<td><asp:dropdownlist id="DropPackType" runat="server" Width="100px" CssClass="fontstyle"></asp:dropdownlist></td>
								<td>&nbsp;&nbsp;Product Group&nbsp;&nbsp;</td>
								<td><asp:dropdownlist id="DropProdGroup" runat="server" Width="150px" CssClass="fontstyle">
										<asp:ListItem Value="All" CssClass="fontstyle">All</asp:ListItem>
									</asp:dropdownlist></td>
							</TR>
							<tr>
								<td align="right" colSpan="8"><asp:radiobutton id="chkAll" GroupName="Stock" Runat="server" Text="All"></asp:radiobutton>&nbsp;&nbsp;&nbsp;
									<asp:radiobutton id="chkZeroStock" GroupName="Stock" Runat="server" Text="Zero Stock"></asp:radiobutton>&nbsp;&nbsp;&nbsp;
									<asp:radiobutton id="chkMRP" GroupName="Stock" Runat="server" Text="MRP"></asp:radiobutton>&nbsp;&nbsp;&nbsp;
									<asp:radiobutton id="chkAmount" GroupName="Stock" Runat="server" Text="Amount"></asp:radiobutton>&nbsp;&nbsp;&nbsp;
									<asp:button id="cmdrpt" runat="server" Width="70px" Text="View" BackColor="#CE4848" BorderColor="#CE4848"
										ForeColor="white" onclick="cmdrpt_Click"></asp:button>&nbsp;&nbsp;
									<asp:button id="btnPrint" Width="70px" Runat="server" Text="Print" BackColor="#CE4848" BorderColor="#CE4848"
										ForeColor="white" onclick="btnPrint_Click"></asp:button>&nbsp;&nbsp;
									<asp:button id="btnExcel" Width="70px" Runat="server" Text="Excel" BackColor="#CE4848" BorderColor="#CE4848"
										ForeColor="white" onclick="btnExcel_Click"></asp:button></td>
							</tr>
						</TABLE>
					</TD>
				</TR>
				<tr>
					<td align="center"><asp:datagrid id="grdLeg" runat="server" BorderStyle="None" BackColor="#DEBA84" BorderColor="#DEBA84"
							CellSpacing="1" AutoGenerateColumns="False" Height="8px" BorderWidth="0px" CellPadding="1" ShowFooter="True"
							AllowSorting="True" OnSortCommand="sortcommand_click" onselectedindexchanged="grdLeg_SelectedIndexChanged">
							<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#738A9C"></SelectedItemStyle>
							<ItemStyle ForeColor="#8C4510" BackColor="#FFF7E7"></ItemStyle>
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#CE4848" HorizontalAlign="Center"></HeaderStyle>
							<FooterStyle Font-Bold="True" ForeColor="#8C4510" BackColor="#F7DFB5"></FooterStyle>
							<Columns>
								<asp:BoundColumn DataField="Prod_Code" SortExpression="Prod_Code" HeaderText="Product Code" FooterText="Total">
									<ItemStyle Wrap="False"></ItemStyle>
									<FooterStyle Font-Bold="True" Wrap="False" HorizontalAlign="Center"></FooterStyle>
								</asp:BoundColumn>
								<asp:TemplateColumn SortExpression="Product" HeaderText="Product Name">
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<%#DataBinder.Eval(Container.DataItem,"Product")%>
									</ItemTemplate>
									<FooterStyle Font-Bold="True" HorizontalAlign="Center"></FooterStyle>
								</asp:TemplateColumn>
								<asp:TemplateColumn SortExpression="Store_in" HeaderText="Location">
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<%#IsTank(DataBinder.Eval(Container.DataItem,"Store_in").ToString())%>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="category" SortExpression="category" HeaderText="Product Group">
									<ItemStyle Wrap="False"></ItemStyle>
									<FooterStyle Font-Bold="True" Wrap="False" HorizontalAlign="Center"></FooterStyle>
								</asp:BoundColumn>
								<asp:TemplateColumn SortExpression="closing_stock" HeaderText="Closing Stock&lt;br&gt;Pkg &#160; &#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;Lt./Kg">
									<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<TABLE align="center" cellspacing="0" width="100%" border="0">
											<TR>
												<TD align="left" width="75"><font color="#8C4510"><%#Check(DataBinder.Eval(Container.DataItem,"closing_stock").ToString(),DataBinder.Eval(Container.DataItem,"Category").ToString(),DataBinder.Eval(Container.DataItem,"pack_type").ToString())%></font></TD>
												<TD align="right" width="75"><font color="#8C4510"><%#Multiply(DataBinder.Eval(Container.DataItem,"closing_stock").ToString()+"X" +DataBinder.Eval(Container.DataItem,"pack_type").ToString())%></font></TD>
											</TR>
										</TABLE>
									</ItemTemplate>
									<FooterTemplate>
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="100%"><font color="#8C4510"><b><%=Cache["csp"]%></b></font></td>
												<td align="right" width="100%"><font color="#8C4510"><b><%=Cache["cs"]%></b></font></td>
											</tr>
										</table>
									</FooterTemplate>
								</asp:TemplateColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Center" ForeColor="#8C4510" Mode="NumericPages"></PagerStyle>
						</asp:datagrid><asp:datagrid id="grdMRP" runat="server" BorderStyle="None" BackColor="#DEBA84" BorderColor="#DEBA84"
							CellSpacing="1" AutoGenerateColumns="False" Height="8px" BorderWidth="0px" CellPadding="1" ShowFooter="True"
							AllowSorting="True" OnSortCommand="sortcommand_click" onselectedindexchanged="grdMRP_SelectedIndexChanged">
							<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#738A9C"></SelectedItemStyle>
							<ItemStyle ForeColor="#8C4510" BackColor="#FFF7E7"></ItemStyle>
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#CE4848" HorizontalAlign="Center"></HeaderStyle>
							<FooterStyle Font-Bold="True" ForeColor="#8C4510" BackColor="#F7DFB5"></FooterStyle>
							<Columns>
								<asp:BoundColumn DataField="Prod_Code" SortExpression="Prod_Code" HeaderText="Product Code" FooterText="Total">
									<ItemStyle Wrap="False"></ItemStyle>
									<FooterStyle Font-Bold="True" Wrap="False" HorizontalAlign="Center"></FooterStyle>
								</asp:BoundColumn>
								<asp:TemplateColumn SortExpression="Product" HeaderText="Product Name">
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<%#DataBinder.Eval(Container.DataItem,"Product")%>
									</ItemTemplate>
									<FooterStyle Font-Bold="True" HorizontalAlign="Center"></FooterStyle>
								</asp:TemplateColumn>
								<asp:TemplateColumn SortExpression="Store_in" HeaderText="Location">
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<%#IsTank(DataBinder.Eval(Container.DataItem,"Store_in").ToString())%>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="category" SortExpression="category" HeaderText="Product Group">
									<ItemStyle Wrap="False"></ItemStyle>
									<FooterStyle Font-Bold="True" Wrap="False" HorizontalAlign="Center"></FooterStyle>
								</asp:BoundColumn>
								<asp:TemplateColumn SortExpression="closing_stock" HeaderText="Closing Stock&lt;br&gt;Pkg &#160; &#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;Lt./Kg">
									<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<TABLE align="center" cellspacing="0" width="100%" border="0">
											<TR>
												<TD align="left" width="75"><font color="#8C4510"><%#Check(DataBinder.Eval(Container.DataItem,"closing_stock").ToString(),DataBinder.Eval(Container.DataItem,"Category").ToString(),DataBinder.Eval(Container.DataItem,"pack_type").ToString())%></font></TD>
												<TD align="right" width="75"><font color="#8C4510"><%#Multiply(DataBinder.Eval(Container.DataItem,"closing_stock").ToString()+"X" +DataBinder.Eval(Container.DataItem,"pack_type").ToString())%></font></TD>
											</TR>
										</TABLE>
									</ItemTemplate>
									<FooterTemplate>
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="100%"><font color="#8C4510"><b><%=Cache["csp"]%></b></font></td>
												<td align="right" width="100%"><font color="#8C4510"><b><%=Cache["cs"]%></b></font></td>
											</tr>
										</table>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="MRP" SortExpression="MRP" HeaderText="MRP">
									<HeaderStyle HorizontalAlign="Center" Width="50px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Center" ForeColor="#8C4510" Mode="NumericPages"></PagerStyle>
						</asp:datagrid><asp:datagrid id="grdAmount" runat="server" BorderStyle="None" BackColor="#DEBA84" BorderColor="#DEBA84"
							CellSpacing="1" AutoGenerateColumns="False" Height="8px" BorderWidth="0px" CellPadding="1" ShowFooter="True"
							AllowSorting="True" OnSortCommand="sortcommand_click">
							<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#738A9C"></SelectedItemStyle>
							<ItemStyle ForeColor="#8C4510" BackColor="#FFF7E7"></ItemStyle>
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#CE4848" HorizontalAlign="Center"></HeaderStyle>
							<FooterStyle Font-Bold="True" ForeColor="#8C4510" BackColor="#F7DFB5"></FooterStyle>
							<Columns>
								<asp:BoundColumn DataField="Prod_Code" SortExpression="Prod_Code" HeaderText="Product Code" FooterText="Total">
									<ItemStyle Wrap="False"></ItemStyle>
									<FooterStyle Font-Bold="True" Wrap="False" HorizontalAlign="Center"></FooterStyle>
								</asp:BoundColumn>
								<asp:TemplateColumn SortExpression="Product" HeaderText="Product Name">
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<%#DataBinder.Eval(Container.DataItem,"Product")%>
									</ItemTemplate>
									<FooterStyle Font-Bold="True" HorizontalAlign="Center"></FooterStyle>
								</asp:TemplateColumn>
								<asp:TemplateColumn SortExpression="Store_in" HeaderText="Location">
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<%#IsTank(DataBinder.Eval(Container.DataItem,"Store_in").ToString())%>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="category" SortExpression="category" HeaderText="Product Group">
									<ItemStyle Wrap="False"></ItemStyle>
									<FooterStyle Font-Bold="True" Wrap="False" HorizontalAlign="Center"></FooterStyle>
								</asp:BoundColumn>
								<asp:TemplateColumn SortExpression="closing_stock" HeaderText="Closing Stock&lt;br&gt;Pkg &#160; &#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;Lt./Kg">
									<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<TABLE align="center" cellspacing="0" width="100%" border="0">
											<TR>
												<TD align="left" width="75"><font color="#8C4510"><%#Check(DataBinder.Eval(Container.DataItem,"closing_stock").ToString(),DataBinder.Eval(Container.DataItem,"Category").ToString(),DataBinder.Eval(Container.DataItem,"pack_type").ToString())%></font></TD>
												<TD align="right" width="75"><font color="#8C4510"><%#Multiply(DataBinder.Eval(Container.DataItem,"closing_stock").ToString()+"X" +DataBinder.Eval(Container.DataItem,"pack_type").ToString())%></font></TD>
											</TR>
										</TABLE>
									</ItemTemplate>
									<FooterTemplate>
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="100%"><font color="#8C4510"><b><%=Cache["csp"]%></b></font></td>
												<td align="right" width="100%"><font color="#8C4510"><b><%=Cache["cs"]%></b></font></td>
											</tr>
										</table>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Amount">
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
									<ItemTemplate>
										<%#GetAmount(DataBinder.Eval(Container.DataItem,"Prod_ID").ToString(),DataBinder.Eval(Container.DataItem,"closing_stock").ToString())%>
									</ItemTemplate>
									<FooterStyle Font-Bold="True" HorizontalAlign="Right"></FooterStyle>
									<FooterTemplate>
										<%=GenUtil.strNumericFormat(Cache["Amount"].ToString())%>
									</FooterTemplate>
								</asp:TemplateColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Center" ForeColor="#8C4510" Mode="NumericPages"></PagerStyle>
						</asp:datagrid><asp:datagrid id="grdMRPAmount" runat="server" BorderStyle="None" BackColor="#DEBA84" BorderColor="#DEBA84"
							CellSpacing="1" AutoGenerateColumns="False" Height="8px" BorderWidth="0px" CellPadding="1" ShowFooter="True"
							AllowSorting="True" OnSortCommand="sortcommand_click">
							<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#738A9C"></SelectedItemStyle>
							<ItemStyle ForeColor="#8C4510" BackColor="#FFF7E7"></ItemStyle>
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#CE4848" HorizontalAlign="Center"></HeaderStyle>
							<FooterStyle Font-Bold="True" ForeColor="#8C4510" BackColor="#F7DFB5"></FooterStyle>
							<Columns>
								<asp:BoundColumn DataField="Prod_Code" SortExpression="Prod_Code" HeaderText="Product Code" FooterText="Total">
									<ItemStyle Wrap="False"></ItemStyle>
									<FooterStyle Font-Bold="True" Wrap="False" HorizontalAlign="Center"></FooterStyle>
								</asp:BoundColumn>
								<asp:TemplateColumn SortExpression="Product" HeaderText="Product Name">
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<%#DataBinder.Eval(Container.DataItem,"Product")%>
									</ItemTemplate>
									<FooterStyle Font-Bold="True" HorizontalAlign="Center"></FooterStyle>
								</asp:TemplateColumn>
								<asp:TemplateColumn SortExpression="Store_in" HeaderText="Location">
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<%#IsTank(DataBinder.Eval(Container.DataItem,"Store_in").ToString())%>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="category" SortExpression="category" HeaderText="Product Group">
									<ItemStyle Wrap="False"></ItemStyle>
									<FooterStyle Font-Bold="True" Wrap="False" HorizontalAlign="Center"></FooterStyle>
								</asp:BoundColumn>
								<asp:TemplateColumn SortExpression="closing_stock" HeaderText="Closing Stock&lt;br&gt;Pkg &#160; &#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;Lt./Kg">
									<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
									<ItemTemplate>
										<TABLE align="center" cellspacing="0" width="100%" border="0">
											<TR>
												<TD align="left" width="75"><font color="#8C4510"><%#Check(DataBinder.Eval(Container.DataItem,"closing_stock").ToString(),DataBinder.Eval(Container.DataItem,"Category").ToString(),DataBinder.Eval(Container.DataItem,"pack_type").ToString())%></font></TD>
												<TD align="right" width="75"><font color="#8C4510"><%#Multiply(DataBinder.Eval(Container.DataItem,"closing_stock").ToString()+"X" +DataBinder.Eval(Container.DataItem,"pack_type").ToString())%></font></TD>
											</TR>
										</TABLE>
									</ItemTemplate>
									<FooterTemplate>
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="100%"><font color="#8C4510"><b><%=Cache["csp"]%></b></font></td>
												<td align="right" width="100%"><font color="#8C4510"><b><%=Cache["cs"]%></b></font></td>
											</tr>
										</table>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="MRP" SortExpression="MRP" HeaderText="MRP">
									<HeaderStyle HorizontalAlign="Center" Width="50px"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
								</asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Amount">
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
									<ItemTemplate>
										<%#GetAmount(DataBinder.Eval(Container.DataItem,"Prod_ID").ToString(),DataBinder.Eval(Container.DataItem,"closing_stock").ToString())%>
									</ItemTemplate>
									<FooterStyle Font-Bold="True" HorizontalAlign="Right"></FooterStyle>
									<FooterTemplate>
										<%=GenUtil.strNumericFormat(Cache["Amount"].ToString())%>
									</FooterTemplate>
								</asp:TemplateColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Center" ForeColor="#8C4510" Mode="NumericPages"></PagerStyle>
						</asp:datagrid><asp:validationsummary id="ValidationSummary1" runat="server" ShowSummary="False" ShowMessageBox="True"></asp:validationsummary></td>
				</tr>
				<tr>
					<td align="right"><A href="javascript:window.print()"></A></td>
				</tr>
			</table>
			<iframe id="gToday:contrast:agenda.js" style="Z-INDEX: 101; LEFT: -500px; VISIBILITY: visible; POSITION: absolute; TOP: 0px"
				name="gToday:contrast:agenda.js" src="../../HeaderFooter/DTPicker/ipopeng.htm" frameBorder="0"
				width="174" scrolling="no" height="189"></iframe>
			<uc1:footer id="Footer1" runat="server"></uc1:footer></form>
	</body>
</HTML>

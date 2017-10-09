<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExcelToDB.aspx.cs" Inherits="Module_Admin_ExcelToDB" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="../../HeaderFooter/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="../../HeaderFooter/Header.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Sysitem/Styles.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <uc1:header id="Header1" runat="server" DESIGNTIMEDRAGDROP="11"></uc1:header>
        <table height="260" cellSpacing="0" cellPadding="0" width="778" align="center" border="0">
				<tr>
					<TH align="center" height="20">
						<font color="#ce4848">Excel To Database</font><hr>
					</TH>
				</tr>
				<tr>
					<td>
						<p align="center"><br>
							<input type="button" NAME="lblPro" style="BORDER-RIGHT: palegoldenrod thin; TABLE-LAYOUT: auto; BORDER-TOP: palegoldenrod thin; DISPLAY: block; FONT-WEIGHT: bold; 
                            VISIBILITY: hidden; BORDER-LEFT: palegoldenrod thin; WIDTH: 200px; CURSOR: wait; COLOR: firebrick; DIRECTION: ltr; TEXT-INDENT: 25px; BORDER-BOTTOM: palegoldenrod thin; 
                            BORDER-COLLAPSE: collapse; HEIGHT: 30px; BACKGROUND-COLOR: palegoldenrod"
							value="Processing Please Wait..."></p>
						<P align="center"><br><br>

                            <asp:RadioButton ID="btnSalesInvoice" runat="server" GroupName="Page" Text="Sales Invoice"></asp:RadioButton>
                            <asp:RadioButton ID="btnPurchaseInvoice" runat="server" GroupName="Page" Text="Purchase Invoice"></asp:RadioButton><br><br>
								<asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:button id="btnRead" runat="server" Width="150px"  Text="Excel To Database" OnClick="btnRead_Click"></asp:button>&nbsp;
                          <asp:GridView ID="GridView1" runat="server" OnPageIndexChanging = "PageIndexChanging" AllowPaging = "false"></asp:GridView>
						<br>
						<br>
						
						</td>
				</tr>
			</table>
    
    <uc1:footer id="Footer1" runat="server"></uc1:footer></form>
   
</body>
</html>

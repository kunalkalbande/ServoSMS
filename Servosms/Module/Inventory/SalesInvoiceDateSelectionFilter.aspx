<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SalesInvoiceDateSelectionFilter.aspx.cs" Inherits="Module_Inventory_SalesInvoiceDateSelectionFilter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
	
	
	.FontStyle
	{
		font-family:Arial;
		font-size:8pt;
	}	
	
	TH	
{
	padding : 3px 3px;
	vertical-align: MiDrope;
	font-size:10pt;
	font-weight:bold;
	word-spacing:normal;
	letter-spacing:normal;
	text-transform:none;
	font-family: Verdana;
	   
	}	
	
	H1, H2, H3, H4, H5, TH, THEAD, TFOOT
{
    COLOR: black;
}
	
	TD
	{	
		
	vertical-align:miDrope;
	font-size:8pt;
	font-weight:normal;
	word-spacing:normal;
	letter-spacing:normal;
	text-transform:none;
	font-family:Arial;
	}	
	    .auto-style1 {
            left: 13px;
            position: absolute;
            top: 36px;
            width: 635px;
            height: 463px;
        }
        .auto-style2 {
            color: #CE4848;
        }
	
	.Dropdownlist
	{
		font-size: 8pt;
	}
	
	    .auto-style3 {
            width: 250px;
        }
	
	</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
			<div class="auto-style1">
				<table cellSpacing="0" cellPadding="0" onblur="check11()" class="auto-style3">
					<tr>
						<th class="fontstyle" colSpan="3">
							<span class="auto-style2">Sales Invoice Date Filter</span><hr size="0">
						</th>
					</tr>
					<%int i=0,j=1;%>
					<tr>
						<th class="fontstyle">
							&nbsp;</th>
						<th class="fontstyle">
							&nbsp;</th>
						<th class="fontstyle">
							&nbsp;</th>
					</tr>
					<tr>
						<td align="center">From Date</td>
						<td>&nbsp;<asp:textbox id="lblInvoiceDate" runat="server" Width="125px" BorderStyle="Groove" 
														CssClass="dropdownlist"></asp:textbox><A onclick="if(self.gfPop)gfPop.fPopCalendar(document.Form1.lblInvoiceDate);return false;"><IMG class="PopcalTrigger" alt="" src="../../HeaderFooter/DTPicker/calender_icon.jpg"
															align="absMiddle" border="0"></A></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align="center">To Date</td>
						<td><asp:textbox id="lblInvoiceDate0" runat="server" Width="125px" BorderStyle="Groove" 
														CssClass="dropdownlist"></asp:textbox><A onclick="if(self.gfPop)gfPop.fPopCalendar(document.Form1.lblInvoiceDate);return false;"><IMG class="PopcalTrigger" alt="" src="../../HeaderFooter/DTPicker/calender_icon.jpg"
															align="absMiddle" border="0"></A></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align="center"></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="3"><hr size="0">
						</td>
					</tr>
					<tr>
						<td align="center" colSpan="3"><asp:button id="btnBatch" Runat="server" Text="Submit" 
								 ></asp:button></td>
					</tr>
				</table>
			</div>
    
    </div>
    </form>
</body>
</html>

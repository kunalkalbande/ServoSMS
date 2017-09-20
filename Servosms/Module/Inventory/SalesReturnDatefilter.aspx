<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SalesReturnDatefilter.aspx.cs" Inherits="SalesReturnDatefilter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<LINK href="../../Sysitem/Styles.css" type="text/css" rel="stylesheet">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="javascript" id="Searchdrop" src="../../Sysitem/JS/Searchdrop.js"></script>
		<script language="javascript" id="Validations" src="../../Sysitem/JS/Validations.js"></script>

    <script type="text/javascript">
        function SetDates() {     
            
            var fromDate = document.getElementById("lblInvoiceFromDate").value;
            fromDate = new Date(fromDate.split('/')[2],fromDate.split('/')[1]-1,fromDate.split('/')[0]);
            var toDate = document.getElementById("lblInvoiceToDate").value;
            toDate = new Date(toDate.split('/')[2],toDate.split('/')[1]-1,toDate.split('/')[0]);
            var timeDiff = Math.abs(toDate.getTime() - fromDate.getTime());
            var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
            var days = 30;

            var diff = 0;
            if (fromDate > toDate) {
                alert("To Date should be greater than From Date.");
                return;
            }
            
            var greater = parseInt(diffDays) > parseInt(days);
            if (greater)
            {
                alert("Maximum Difference between From Date and To Date should be 30 days.");
                return;
            }
            
            if (window.opener != null && !window.opener.closed) {            
            
                var txtFromDate = window.opener.document.getElementById("hidInvoiceFromDate");
                txtFromDate.value = document.getElementById("lblInvoiceFromDate").value;

                var txtToDate = window.opener.document.getElementById("hidInvoiceToDate");
                txtToDate.value = document.getElementById("lblInvoiceToDate").value;
            }
            window.parent.opener.document.forms[0].submit();
            window.close();
        }
</script>

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
            width: 373px;
        }
	
	    .auto-style4 {
            width: 140px;
        }
	
	</style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
			<div class="auto-style1">
				<table cellSpacing="0" cellPadding="0" onblur="check11()" class="auto-style3">
					<tr>
						<th class="fontstyle" colSpan="5">
							<span class="auto-style2">Sales Return Date Filter</span><hr size="0">
						</th>
						
					</tr>
                    
					<tr>
						<th class="fontstyle">
							&nbsp;</th>
						<th class="auto-style4">
							&nbsp;</th>
						<th class="fontstyle">
							&nbsp;</th>
						<th class="fontstyle">
							&nbsp;</th>
					</tr>
					<tr>
						<td align="left">From Date</td>
						<td align="left" class="auto-style4">&nbsp;<asp:textbox id="lblInvoiceFromDate" runat="server" Width="80px" BorderStyle="Groove" 
														CssClass="dropdownlist"></asp:textbox><A onclick="if(self.gfPop)gfPop.fPopCalendar(document.all.lblInvoiceFromDate);return false;"><IMG class="PopcalTrigger" alt="" src="../../HeaderFooter/DTPicker/calender_icon.jpg"
															align="absMiddle" border="0"></A></td>
						<td>To Date</td>
						<td><asp:textbox id="lblInvoiceToDate" runat="server" Width="80px" BorderStyle="Groove" 
														CssClass="dropdownlist"></asp:textbox><A onclick="if(self.gfPop)gfPop.fPopCalendar(document.all.lblInvoiceToDate);return false;"><IMG class="PopcalTrigger" alt="" src="../../HeaderFooter/DTPicker/calender_icon.jpg"
															align="absMiddle" border="0"></A></td>
					</tr>
					<tr>
						<td align="center">&nbsp;</td>
						<td class="auto-style4">&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align="center" colSpan="4"><asp:button id="btnSubmit" Runat="server" Text="Submit" onClientClick="return SetDates()"
								 ></asp:button></td>
						<td align="center">&nbsp;</td>
					</tr>
				</table>
                	<IFRAME id="gToday:contrast:agenda.js" style="Z-INDEX: 101; LEFT: -500px; VISIBILITY: visible; POSITION: absolute; TOP: 0px"
				name="gToday:contrast:agenda.js" src="../../HeaderFooter/DTPicker/ipopeng.htm" frameBorder="0"
				width="174" scrolling="no" height="189"></IFRAME>
			</div>
    
    </div>
    </form>
</body>
</html>

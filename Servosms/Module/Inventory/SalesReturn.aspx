<%@ Page language="c#" Inherits="Servosms.Module.Inventory.SalesReturn" CodeFile="SalesReturn.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="../../HeaderFooter/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="../../HeaderFooter/Footer.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ServoSMS: Sales Return Credit Note</title> <!--
   Copyright (c) 2005 bbnisys Technologies. All Rights Reserved.
  
   No part of this software shall be reproduced, stored in a 
   retrieval system, or transmitted by any means, electronic 
   mechanical, photocopying, recording  or otherwise, or for
   any  purpose  without the express  written  permission of
   bbnisys Technologies.
-->
		<script language="javascript" id="Validations" src="../../Sysitem/JS/Validations.js"></script>
		<script language="javascript" id="sales" src="../../Sysitem/JS/Sales.js"></script>
		<script language="javascript" id="Fuel" src="../../Sysitem/JS/Fuel.js"></script>
		<meta content="False" name="vs_snapToGrid">
        <script type = "text/javascript">
        
            function getDateFilter(windowWidth,windowHeight)
            {	                                
                var centerLeft = parseInt((window.screen.availWidth - windowWidth) / 2);
                var centerTop = parseInt(((window.screen.availHeight - windowHeight) / 2) - 500);
                var misc_features = 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, copyhistory=no';

                var windowFeatures = 'width=' + windowWidth + ',height=' + windowHeight + ',left=' + centerLeft + ',top=' + centerTop + misc_features;
                                
                childWin = window.open("SalesReturnDatefilter.aspx", "ChildWin", windowFeatures);
                childWin.focus();
            }            
        </script>

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
		<script language="javascript">
	
	function makeRound(t)
	{
		var str = t.value;
		if(str != "")
		{
			str = eval(str)*100;
			str  = Math.round(str);
			str = eval(str)/100;
			t.value = str;
			//alert(str)
		}
	}
	
	function selectAll()
	{
		//alert("In");
		var CheckBox = new Array(document.Form1.Check1,document.Form1.Check2,document.Form1.Check3,document.Form1.Check4,document.Form1.Check5,document.Form1.Check6,document.Form1.Check7,document.Form1.Check8,document.Form1.Check9,document.Form1.Check10,document.Form1.Check11,document.Form1.Check12);
		var ProdName = new Array(document.Form1.txtProdName1,document.Form1.txtProdName2,document.Form1.txtProdName3,document.Form1.txtProdName4,document.Form1.txtProdName5,document.Form1.txtProdName6,document.Form1.txtProdName7,document.Form1.txtProdName8,document.Form1.txtProdName9,document.Form1.txtProdName10,document.Form1.txtProdName11,document.Form1.txtProdName12);
		//var Pack = new Array(document.Form1.txtPack1,document.Form1.txtPack2,document.Form1.txtPack3,document.Form1.txtPack4,document.Form1.txtPack5,document.Form1.txtPack6,document.Form1.txtPack7,document.Form1.txtPack8,document.Form1.txtPack9,document.Form1.txtPack10,document.Form1.txtPack11,document.Form1.txtPack12);
		var Qty = new Array(document.Form1.txtQty1,document.Form1.txtQty2,document.Form1.txtQty3,document.Form1.txtQty4,document.Form1.txtQty5,document.Form1.txtQty6,document.Form1.txtQty7,document.Form1.txtQty8,document.Form1.txtQty9,document.Form1.txtQty10,document.Form1.txtQty11,document.Form1.txtQty12);
		var Rate = new Array(document.Form1.txtRate1,document.Form1.txtRate2,document.Form1.txtRate3,document.Form1.txtRate4,document.Form1.txtRate5,document.Form1.txtRate6,document.Form1.txtRate7,document.Form1.txtRate8,document.Form1.txtRate9,document.Form1.txtRate10,document.Form1.txtRate11,document.Form1.txtRate12);
		var Amount = new Array(document.Form1.txtAmount1,document.Form1.txtAmount2,document.Form1.txtAmount3,document.Form1.txtAmount4,document.Form1.txtAmount5,document.Form1.txtAmount6,document.Form1.txtAmount7,document.Form1.txtAmount8,document.Form1.txtAmount9,document.Form1.txtAmount10,document.Form1.txtAmount11,document.Form1.txtAmount12);
		// var TempQty = new Array(document.Form1.txtTempQty1,document.Form1.txtTempQty2,document.Form1.txtTempQty3,document.Form1.txtTempQty4,document.Form1.txtTempQty5,document.Form1.txtTempQty6,document.Form1.txtTempQty7,document.Form1.txtTempQty8);
		var TempQty = new Array(document.Form1.tmpQty1,document.Form1.tmpQty2,document.Form1.tmpQty3,document.Form1.tmpQty4,document.Form1.tmpQty5,document.Form1.tmpQty6,document.Form1.tmpQty7,document.Form1.tmpQty8,document.Form1.tmpQty9,document.Form1.tmpQty10,document.Form1.tmpQty11,document.Form1.tmpQty12);
		var ProdSch = new Array(document.Form1.txtProdsch1,document.Form1.txtProdsch2,document.Form1.txtProdsch3,document.Form1.txtProdsch4,document.Form1.txtProdsch5,document.Form1.txtProdsch6,document.Form1.txtProdsch7,document.Form1.txtProdsch8,document.Form1.txtProdsch9,document.Form1.txtProdsch10,document.Form1.txtProdsch11,document.Form1.txtProdsch12);
		var QtySch = new Array(document.Form1.txtQtysch1,document.Form1.txtQtysch2,document.Form1.txtQtysch3,document.Form1.txtQtysch4,document.Form1.txtQtysch5,document.Form1.txtQtysch6,document.Form1.txtQtysch7,document.Form1.txtQtysch8,document.Form1.txtQtysch9,document.Form1.txtQtysch10,document.Form1.txtQtysch11,document.Form1.txtQtysch12);

		if(document.Form1.CheckAll.checked == true)
		{
			//alert("if")
			for(var i = 0; i < CheckBox.length ; i++)
			{
				if(ProdName[i].value != "")
				{
					CheckBox[i].checked = true;
					ProdName[i].disabled = false; 
					//Pack[i].disabled = false;
					Qty[i].disabled = false;
					Rate[i].disabled = false;
					Amount[i].disabled = false; 
					calc(Qty[i],Rate[i],TempQty[i])
				}
				else
					continue
			} 
		}
		else
		{
			for(var i = 0; i < CheckBox.length ; i++)
			{
				CheckBox[i].checked = false;
				ProdName[i].disabled = true; 
				//Pack[i].disabled = true;
				Qty[i].disabled = true;
				Rate[i].disabled = true;
				Amount[i].disabled = true;  
				Qty[i].value = TempQty[i].value;
            }
			calc1(Qty[i],Rate[i])
		}
		//GetGrandTotal()
		// GetNetAmount()
	}		
 
//function select1(check, product, pack, qty, rate, amount, tmpQty)
function select1(check, product, qty, rate, amount, tmpQty)
{
	if(check.checked == true)
    {
		if(product.value != "")
		{
			product.disabled = false;
			//pack.disabled = false;
			qty.disabled = false;
			rate.disabled = false;
			amount.disabled = false; 
			calc(qty,rate,tmpQty)   
		}
		else
		{
			alert("Please Select The Invoice No");
			check.checked = false
		}
    }
    else
    {
		product.disabled = true;
		//pack.disabled = true;
		qty.disabled = true;
		rate.disabled = true;
		amount.disabled = true; 
		qty.value = tmpQty.value
		if(allUnChecked())
		{
			calc1(qty,rate)
		}
		else
		{
			calc(qty,rate,tmpQty)
		}
    }
	//  GetGrandTotal()
	// GetNetAmount()
}
 
function allUnChecked()
{
	//var CheckBox = new Array(document.Form1.Check1,document.Form1.Check2,document.Form1.Check3,document.Form1.Check4,document.Form1.Check5,document.Form1.Check6,document.Form1.Check7,document.Form1.Check8,document.Form1.Check9,document.Form1.Check10,document.Form1.Check11,document.Form1.Check12);
	var CheckBox = new Array(document.Form1.Check1,document.Form1.Check2,document.Form1.Check3,document.Form1.Check4,document.Form1.Check5,document.Form1.Check6,document.Form1.Check7,document.Form1.Check8,document.Form1.Check9,document.Form1.Check10,document.Form1.Check11,document.Form1.Check12);
	var c = 0;
	for(var i= 0 ; i < CheckBox.length; i++)
	{
		if(CheckBox[i].checked == false)
		{
			c++
		}
	}
	//Mahesh if(c == 8)
	if(c == 12)
	{
		return true;
	}
	else
		return false;
}	

function calc1(txtQty,txtRate)
{	
	//alert("inside")
	var sarr = new Array()
	var temp ="";
	
	document.Form1.txtAmount1.value=document.Form1.txtQty1.value*document.Form1.txtRate1.value	
	if(document.Form1.txtAmount1.value==0)
		document.Form1.txtAmount1.value=""
	else
		makeRound(document.Form1.txtAmount1)
	document.Form1.txtAmount2.value= document.Form1.txtQty2.value*document.Form1.txtRate2.value	
 	if(document.Form1.txtAmount2.value==0)
		document.Form1.txtAmount2.value=""
	else
		makeRound(document.Form1.txtAmount2)
	document.Form1.txtAmount3.value= document.Form1.txtQty3.value*document.Form1.txtRate3.value	
	if(document.Form1.txtAmount3.value==0)
		document.Form1.txtAmount3.value=""
	else
		makeRound(document.Form1.txtAmount3)
	document.Form1.txtAmount4.value= document.Form1.txtQty4.value*document.Form1.txtRate4.value	
	if(document.Form1.txtAmount4.value==0)
		document.Form1.txtAmount4.value=""
	else
		makeRound(document.Form1.txtAmount4)
	document.Form1.txtAmount5.value= document.Form1.txtQty5.value*document.Form1.txtRate5.value	
	if(document.Form1.txtAmount5.value==0)
		document.Form1.txtAmount5.value=""
	else
		makeRound(document.Form1.txtAmount5)
	document.Form1.txtAmount6.value= document.Form1.txtQty6.value*document.Form1.txtRate6.value	
	if(document.Form1.txtAmount6.value==0)
		document.Form1.txtAmount6.value=""
	else
		makeRound(document.Form1.txtAmount6)
	document.Form1.txtAmount7.value= document.Form1.txtQty7.value*document.Form1.txtRate7.value	
	if(document.Form1.txtAmount7.value==0)
		document.Form1.txtAmount7.value=""
	else
		makeRound(document.Form1.txtAmount7)
	document.Form1.txtAmount8.value= document.Form1.txtQty8.value*document.Form1.txtRate8.value	
	if(document.Form1.txtAmount8.value==0)
		document.Form1.txtAmount8.value=""
	else
		makeRound(document.Form1.txtAmount8)
	document.Form1.txtAmount9.value= document.Form1.txtQty9.value*document.Form1.txtRate9.value	
	if(document.Form1.txtAmount9.value==0)
		document.Form1.txtAmount9.value=""
	else
		makeRound(document.Form1.txtAmount9)
	document.Form1.txtAmount10.value= document.Form1.txtQty10.value*document.Form1.txtRate10.value	
	if(document.Form1.txtAmount10.value==0)
		document.Form1.txtAmount10.value=""
	else
		makeRound(document.Form1.txtAmount10)
	document.Form1.txtAmount11.value= document.Form1.txtQty11.value*document.Form1.txtRate11.value	
	if(document.Form1.txtAmount11.value==0)
		document.Form1.txtAmount11.value=""
	else
		makeRound(document.Form1.txtAmount11)
	document.Form1.txtAmount12.value= document.Form1.txtQty12.value*document.Form1.txtRate12.value	
	if(document.Form1.txtAmount12.value==0)
		document.Form1.txtAmount12.value=""	
	else
		makeRound(document.Form1.txtAmount12)
		
	document.Form1.txtGrandTotal.value = document.Form1.tmpGrandTotal.value  
	makeRound(document.Form1.txtGrandTotal);
	document.Form1.txtDisc.value = document.Form1.tmpDisc.value  
	makeRound(document.Form1.txtDisc);
	document.Form1.txtNetAmount.value = document.Form1.tmpNetAmount.value  
	makeRound(document.Form1.txtNetAmount);
	document.Form1.txtCashDisc.value = document.Form1.tmpCashDisc.value  
	makeRound(document.Form1.txtCashDisc.value);
	document.Form1.txtVAT.value = document.Form1.tmpVatAmount.value  
	makeRound(document.Form1.txtVAT);
	changeqtyltrUnchecked();
}  

	function calc(txtQty,txtRate,txtTempQty,txtProdSch,txtQtySch,tempint)
	{	
		var sarr = new Array()
		var temp ="";
		// alert(txtQty.value + "  "+txtTempQty.value);
		if(eval(txtQty.value) > eval(txtTempQty.value))
		{
			alert("Return quantity should not be greater than "+txtTempQty.value)
			txtQty.value = "";
			txtProdSch.value="";
			txtQtySch.value="";
			return false;
		}
	
		document.Form1.txtAmount1.value=document.Form1.txtQty1.value*document.Form1.txtRate1.value	
		if(document.Form1.txtAmount1.value==0)
			document.Form1.txtAmount1.value=""
		else
			makeRound(document.Form1.txtAmount1)
		document.Form1.txtAmount2.value= document.Form1.txtQty2.value*document.Form1.txtRate2.value	
 		if(document.Form1.txtAmount2.value==0)
			document.Form1.txtAmount2.value=""
		else
			makeRound(document.Form1.txtAmount2)
		document.Form1.txtAmount3.value= document.Form1.txtQty3.value*document.Form1.txtRate3.value	
		if(document.Form1.txtAmount3.value==0)
			document.Form1.txtAmount3.value=""
		else
			makeRound(document.Form1.txtAmount3)
		document.Form1.txtAmount4.value= document.Form1.txtQty4.value*document.Form1.txtRate4.value	
		if(document.Form1.txtAmount4.value==0)
			document.Form1.txtAmount4.value=""
		else
			makeRound(document.Form1.txtAmount4)
		document.Form1.txtAmount5.value= document.Form1.txtQty5.value*document.Form1.txtRate5.value	
		if(document.Form1.txtAmount5.value==0)
			document.Form1.txtAmount5.value=""
		else
			makeRound(document.Form1.txtAmount5)
		document.Form1.txtAmount6.value= document.Form1.txtQty6.value*document.Form1.txtRate6.value	
		if(document.Form1.txtAmount6.value==0)
			document.Form1.txtAmount6.value=""
		else
			makeRound(document.Form1.txtAmount6)
		document.Form1.txtAmount7.value= document.Form1.txtQty7.value*document.Form1.txtRate7.value	
		if(document.Form1.txtAmount7.value==0)
			document.Form1.txtAmount7.value=""
		else
			makeRound(document.Form1.txtAmount7)
		document.Form1.txtAmount8.value= document.Form1.txtQty8.value*document.Form1.txtRate8.value	
		if(document.Form1.txtAmount8.value==0)
			document.Form1.txtAmount8.value=""
		else
			makeRound(document.Form1.txtAmount8)
		document.Form1.txtAmount9.value= document.Form1.txtQty9.value*document.Form1.txtRate9.value	
		if(document.Form1.txtAmount9.value==0)
			document.Form1.txtAmount9.value=""
		else
			makeRound(document.Form1.txtAmount9)
		document.Form1.txtAmount10.value= document.Form1.txtQty10.value*document.Form1.txtRate10.value	
		if(document.Form1.txtAmount10.value==0)
			document.Form1.txtAmount10.value=""
		else
			makeRound(document.Form1.txtAmount10)
		document.Form1.txtAmount11.value= document.Form1.txtQty11.value*document.Form1.txtRate11.value	
		if(document.Form1.txtAmount11.value==0)
			document.Form1.txtAmount11.value=""
		else
			makeRound(document.Form1.txtAmount11)
		document.Form1.txtAmount12.value= document.Form1.txtQty12.value*document.Form1.txtRate12.value	
		if(document.Form1.txtAmount12.value==0)
			document.Form1.txtAmount12.value=""
		else
			makeRound(document.Form1.txtAmount12)
		
		//*******************
		if(tempint==1)
			getschemeqty(document.Form1.txtProdName1,document.Form1.txtQty1,document.Form1.txtProdsch1,document.Form1.txtQtysch1,document.Form1.lblInvoiceDate)
		if(tempint==2)
			getschemeqty(document.Form1.txtProdName2,document.Form1.txtQty2,document.Form1.txtProdsch2,document.Form1.txtQtysch2,document.Form1.lblInvoiceDate)
		if(tempint==3)
			getschemeqty(document.Form1.txtProdName3,document.Form1.txtQty3,document.Form1.txtProdsch3,document.Form1.txtQtysch3,document.Form1.lblInvoiceDate)
		if(tempint==4)
			getschemeqty(document.Form1.txtProdName4,document.Form1.txtQty4,document.Form1.txtProdsch4,document.Form1.txtQtysch4,document.Form1.lblInvoiceDate)
		if(tempint==5)
			getschemeqty(document.Form1.txtProdName5,document.Form1.txtQty5,document.Form1.txtProdsch5,document.Form1.txtQtysch5,document.Form1.lblInvoiceDate)
		if(tempint==6)
			getschemeqty(document.Form1.txtProdName6,document.Form1.txtQty6,document.Form1.txtProdsch6,document.Form1.txtQtysch6,document.Form1.lblInvoiceDate)
		if(tempint==7)
			getschemeqty(document.Form1.txtProdName7,document.Form1.txtQty7,document.Form1.txtProdsch7,document.Form1.txtQtysch7,document.Form1.lblInvoiceDate)
		if(tempint==8)
			getschemeqty(document.Form1.txtProdName8,document.Form1.txtQty8,document.Form1.txtProdsch8,document.Form1.txtQtysch8,document.Form1.lblInvoiceDate)
		if(tempint==9)
			getschemeqty(document.Form1.txtProdName9,document.Form1.txtQty9,document.Form1.txtProdsch9,document.Form1.txtQtysch9,document.Form1.lblInvoiceDate)
		if(tempint==10)
			getschemeqty(document.Form1.txtProdName10,document.Form1.txtQty10,document.Form1.txtProdsch10,document.Form1.txtQtysch10,document.Form1.lblInvoiceDate)
		if(tempint==11)
			getschemeqty(document.Form1.txtProdName11,document.Form1.txtQty11,document.Form1.txtProdsch11,document.Form1.txtQtysch11,document.Form1.lblInvoiceDate)
		if(tempint==12)
			getschemeqty(document.Form1.txtProdName12,document.Form1.txtQty12,document.Form1.txtProdsch12,document.Form1.txtQtysch12,document.Form1.lblInvoiceDate)
		
	//*******************/
	 GetGrandTotal()
	 GetNetAmount()
	 changeqtyltr()
	}	
	function GetGrandTotal()
	{
	 var GTotal=0
	 if(document.Form1.txtAmount1.value!="" && document.Form1.Check1.checked == true)
	 	GTotal=GTotal+eval(document.Form1.txtAmount1.value)
	 if(document.Form1.txtAmount2.value!="" && document.Form1.Check2.checked == true)
	 	GTotal=GTotal+eval(document.Form1.txtAmount2.value)
	 if(document.Form1.txtAmount3.value!="" && document.Form1.Check3.checked == true)
	 	GTotal=GTotal+eval(document.Form1.txtAmount3.value)
	 if(document.Form1.txtAmount4.value!="" && document.Form1.Check4.checked == true)
	 	GTotal=GTotal+eval(document.Form1.txtAmount4.value)
	 if(document.Form1.txtAmount5.value!="" && document.Form1.Check5.checked == true)
	 	GTotal=GTotal+eval(document.Form1.txtAmount5.value)
	 if(document.Form1.txtAmount6.value!="" && document.Form1.Check6.checked == true)
	 	GTotal=GTotal+eval(document.Form1.txtAmount6.value)
	 if(document.Form1.txtAmount7.value!="" && document.Form1.Check7.checked == true)
	 	GTotal=GTotal+eval(document.Form1.txtAmount7.value)
	 if(document.Form1.txtAmount8.value!="" && document.Form1.Check8.checked == true)
	 	GTotal=GTotal+eval(document.Form1.txtAmount8.value)
	 if(document.Form1.txtAmount9.value!="" && document.Form1.Check9.checked == true)
	 	GTotal=GTotal+eval(document.Form1.txtAmount9.value)
	 if(document.Form1.txtAmount10.value!="" && document.Form1.Check10.checked == true)
	 	GTotal=GTotal+eval(document.Form1.txtAmount10.value)
	 if(document.Form1.txtAmount11.value!="" && document.Form1.Check11.checked == true)
	 	GTotal=GTotal+eval(document.Form1.txtAmount11.value)
	 if(document.Form1.txtAmount12.value!="" && document.Form1.Check12.checked == true)
	 	GTotal=GTotal+eval(document.Form1.txtAmount12.value)
	 document.Form1.txtGrandTotal.value=GTotal ;
	 makeRound(document.Form1.txtGrandTotal);
	}	
	
	//***********
	function changeqtyltr()
		{   
		    var total=0
		    var totalscheme=0
		    var totalliter=0
			var f1=document.Form1
			//*********************************************
			<%for(int i=1;i<=12;i++){%>
			var arrPack = new Array();
			var strPack = f1.txtProdName<%=i%>.value
			if(strPack != "")
				arrPack = strPack.split(":")
			else
			{
				arrPack[0]="";
				arrPack[1]="";
			}
			//arrPack = strPack.split(":")
			if(arrPack[1] != "" && document.Form1.Check<%=i%>.checked==true)
			{
				var mainarr1 = new Array()
				//var hidarr1  = document.Form1.txtPack<%=i%>.value
				var hidarr1  = arrPack[1]
				mainarr1 = hidarr1.split("X")
				total=mainarr1[0]* mainarr1[1]*document.Form1.txtQty<%=i%>.value
				totalliter+=mainarr1[0]* mainarr1[1]*document.Form1.txtQty<%=i%>.value
				totalscheme+=total*document.Form1.txtsch<%=i%>.value
			}
			<%}%>
			//*********************************************
			/*if(f1.txtPack1.value != "" && document.Form1.Check1.checked==true)
			{
				var mainarr1 = new Array()
				var hidarr1  = document.Form1.txtPack1.value
				mainarr1 = hidarr1.split("X")
				total=mainarr1[0]* mainarr1[1]*document.Form1.txtQty1.value				
				totalliter+=mainarr1[0]* mainarr1[1]*document.Form1.txtQty1.value
				totalscheme+=total*document.Form1.txtsch1.value
			}
			if(f1.txtPack2.value != "" && document.Form1.Check2.checked==true)
			{
				var mainarr2 = new Array()
				var hidarr2  = document.Form1.txtPack2.value
				mainarr2 = hidarr2.split("X")
				total=mainarr2[0]* mainarr2[1]*document.Form1.txtQty2.value					
				totalliter+=mainarr2[0]* mainarr2[1]*document.Form1.txtQty2.value
				totalscheme+=total*document.Form1.txtsch2.value
			}
			if(f1.txtPack3.value != "" && document.Form1.Check3.checked==true)
			{
				var mainarr3 = new Array()
				var hidarr3  = document.Form1.txtPack3.value
				mainarr3 = hidarr3.split("X")
				total=mainarr3[0]* mainarr3[1]*document.Form1.txtQty3.value					
				totalliter+=mainarr3[0]* mainarr3[1]*document.Form1.txtQty3.value
				totalscheme+=total*document.Form1.txtsch3.value
			}
			if(f1.txtPack4.value != "" && document.Form1.Check4.checked==true)
			{
				var mainarr4 = new Array()
				var hidarr4  = document.Form1.txtPack4.value
				mainarr4 = hidarr4.split("X")
				total=mainarr4[0]* mainarr4[1]*document.Form1.txtQty4.value					
				totalliter+=mainarr4[0]* mainarr4[1]*document.Form1.txtQty4.value
				totalscheme+=total*document.Form1.txtsch4.value
			}
			if(f1.txtPack5.value != "" && document.Form1.Check5.checked==true)
			{
				var mainarr5 = new Array()
				var hidarr5  = document.Form1.txtPack5.value
				mainarr5 = hidarr5.split("X")
				total=mainarr5[0]* mainarr5[1]*document.Form1.txtQty5.value					
				totalliter+=mainarr5[0]* mainarr5[1]*document.Form1.txtQty5.value
				totalscheme+=total*document.Form1.txtsch5.value
			}
			if(f1.txtPack6.value != "" && document.Form1.Check6.checked==true)
			{
				var mainarr6 = new Array()
				var hidarr6  = document.Form1.txtPack6.value
				mainarr6 = hidarr6.split("X")
				total=mainarr6[0]* mainarr6[1]*document.Form1.txtQty6.value					
				totalliter+=mainarr6[0]* mainarr6[1]*document.Form1.txtQty6.value
				totalscheme+=total*document.Form1.txtsch6.value
			}
			if(f1.txtPack7.value != "" && document.Form1.Check7.checked==true)
			{
				var mainarr7 = new Array()
				var hidarr7  = document.Form1.txtPack7.value
				mainarr7 = hidarr7.split("X")
				total=mainarr7[0]* mainarr7[1]*document.Form1.txtQty7.value					
				totalliter+=mainarr7[0]* mainarr7[1]*document.Form1.txtQty7.value
				totalscheme+=total*document.Form1.txtsch7.value
			}
			if(f1.txtPack8.value != "" && document.Form1.Check8.checked==true)
			{
				var mainarr8 = new Array()
				var hidarr8  = f1.txtPack8.value
				mainarr8 = hidarr8.split("X")
				total=mainarr8[0]* mainarr8[1]*document.Form1.txtQty8.value					
				totalliter+=mainarr8[0]* mainarr8[1]*document.Form1.txtQty8.value
				totalscheme+=total*document.Form1.txtsch8.value
			}
			if(f1.txtPack9.value != "" && document.Form1.Check9.checked==true)
			{
				var mainarr9 = new Array()
				var hidarr9  = f1.txtPack9.value
				mainarr9 = hidarr9.split("X")
				total=mainarr9[0]* mainarr9[1]*document.Form1.txtQty9.value					
				totalliter+=mainarr9[0]* mainarr9[1]*document.Form1.txtQty9.value
				totalscheme+=total*document.Form1.txtsch9.value
			}
			if(f1.txtPack10.value != "" && document.Form1.Check10.checked==true)
			{
				var mainarr10 = new Array()
				var hidarr10  = f1.txtPack10.value
				mainarr10 = hidarr10.split("X")
				total=mainarr10[0]* mainarr10[1]*document.Form1.txtQty10.value					
				totalliter+=mainarr10[0]* mainarr10[1]*document.Form1.txtQty10.value
				totalscheme+=total*document.Form1.txtsch10.value
			}
			if(f1.txtPack11.value != "" && document.Form1.Check11.checked==true)
			{
				var mainarr11 = new Array()
				var hidarr11  = f1.txtPack11.value
				mainarr11 = hidarr11.split("X")
				total=mainarr11[0]* mainarr11[1]*document.Form1.txtQty11.value					
				totalliter+=mainarr11[0]* mainarr11[1]*document.Form1.txtQty11.value
				totalscheme+=total*document.Form1.txtsch11.value
			}
			if(f1.txtPack12.value != "" && document.Form1.Check12.checked==true)
			{
				var mainarr12 = new Array()
				var hidarr12  = f1.txtPack12.value
				mainarr12 = hidarr12.split("X")
				total=mainarr12[0]* mainarr12[1]*document.Form1.txtQty12.value					
				totalliter+=mainarr12[0]* mainarr12[1]*document.Form1.txtQty12.value
				totalscheme+=total*document.Form1.txtsch12.value
			}*/
			document.Form1.txtschemetotal.value=totalscheme
			document.Form1.txtlitertotal.value=totalliter
		}	
		//*******changeqtyltr()
		function changeqtyltrUnchecked()
		{   
			document.Form1.txtschemetotal.value="";
		    var total=0
		    var totalscheme=0
		    var totalliter=0
			var f1=document.Form1
			//*********************************************
			<%for(int i=1;i<=12;i++){%>
			var arrPack = new Array();
			var strPack = f1.txtProdName<%=i%>.value
			if(strPack != "")
				arrPack = strPack.split(":")
			else
			{
				arrPack[0]="";
				arrPack[1]="";
			}
			if(arrPack[1] != "" && document.Form1.Check<%=i%>.checked==false)
			{
				var mainarr1 = new Array()
				//var hidarr1  = document.Form1.txtPack<%=i%>.value
				var hidarr1  = arrPack[1]
				mainarr1 = hidarr1.split("X")
				total=mainarr1[0]* mainarr1[1]*document.Form1.txtQty<%=i%>.value
				totalliter+=mainarr1[0]* mainarr1[1]*document.Form1.txtQty<%=i%>.value
				totalscheme+=total*document.Form1.txtsch<%=i%>.value
			}
			<%}%>
			//*********************************************
			/*if(f1.txtPack1.value != ""&& document.Form1.Check1.checked==false)
			{
				var mainarr1 = new Array()
				var hidarr1  = document.Form1.txtPack1.value
				mainarr1 = hidarr1.split("X")
				total=mainarr1[0]* mainarr1[1]*document.Form1.txtQty1.value				
				totalliter+=mainarr1[0]* mainarr1[1]*document.Form1.txtQty1.value
				totalscheme+=total*document.Form1.txtsch1.value
			}
			if(f1.txtPack2.value != ""&& document.Form1.Check2.checked==false)
			{
				var mainarr2 = new Array()
				var hidarr2  = document.Form1.txtPack2.value
				mainarr2 = hidarr2.split("X")
				total=mainarr2[0]* mainarr2[1]*document.Form1.txtQty2.value					
				totalliter+=mainarr2[0]* mainarr2[1]*document.Form1.txtQty2.value
				totalscheme+=total*document.Form1.txtsch2.value
			}
			if(f1.txtPack3.value != ""&& document.Form1.Check3.checked==false)
			{
				var mainarr3 = new Array()
				var hidarr3  = document.Form1.txtPack3.value
				mainarr3 = hidarr3.split("X")
				total=mainarr3[0]* mainarr3[1]*document.Form1.txtQty3.value					
				totalliter+=mainarr3[0]* mainarr3[1]*document.Form1.txtQty3.value
				totalscheme+=total*document.Form1.txtsch3.value
			}
			if(f1.txtPack4.value != ""&& document.Form1.Check4.checked==false)
			{
				var mainarr4 = new Array()
				var hidarr4  = document.Form1.txtPack4.value
				mainarr4 = hidarr4.split("X")
				total=mainarr4[0]* mainarr4[1]*document.Form1.txtQty4.value					
				totalliter+=mainarr4[0]* mainarr4[1]*document.Form1.txtQty4.value
				totalscheme+=total*document.Form1.txtsch4.value
			}
			if(f1.txtPack5.value != ""&& document.Form1.Check5.checked==false)
			{
				var mainarr5 = new Array()
				var hidarr5  = document.Form1.txtPack5.value
				mainarr5 = hidarr5.split("X")
				total=mainarr5[0]* mainarr5[1]*document.Form1.txtQty5.value					
				totalliter+=mainarr5[0]* mainarr5[1]*document.Form1.txtQty5.value
				totalscheme+=total*document.Form1.txtsch5.value
			}
			if(f1.txtPack6.value != ""&& document.Form1.Check6.checked==false)
			{
				var mainarr6 = new Array()
				var hidarr6  = document.Form1.txtPack6.value
				mainarr6 = hidarr6.split("X")
				total=mainarr6[0]* mainarr6[1]*document.Form1.txtQty6.value					
				totalliter+=mainarr6[0]* mainarr6[1]*document.Form1.txtQty6.value
				totalscheme+=total*document.Form1.txtsch6.value
			}
			if(f1.txtPack7.value != ""&& document.Form1.Check7.checked==false)
			{
				var mainarr7 = new Array()
				var hidarr7  = document.Form1.txtPack7.value
				mainarr7 = hidarr7.split("X")
				total=mainarr7[0]* mainarr7[1]*document.Form1.txtQty7.value					
				totalliter+=mainarr7[0]* mainarr7[1]*document.Form1.txtQty7.value
				totalscheme+=total*document.Form1.txtsch7.value
			}
			if(f1.txtPack8.value != "" && document.Form1.Check8.checked==false)
			{
				var mainarr8 = new Array()
				var hidarr8  = f1.txtPack8.value
				mainarr8 = hidarr8.split("X")
				total=mainarr8[0]* mainarr8[1]*document.Form1.txtQty8.value					
				totalliter+=mainarr8[0]* mainarr8[1]*document.Form1.txtQty8.value
				totalscheme+=total*document.Form1.txtsch8.value
			}
			if(f1.txtPack9.value != "" && document.Form1.Check9.checked==false)
			{
				var mainarr9 = new Array()
				var hidarr9  = f1.txtPack9.value
				mainarr9 = hidarr9.split("X")
				total=mainarr9[0]* mainarr9[1]*document.Form1.txtQty9.value					
				totalliter+=mainarr9[0]* mainarr9[1]*document.Form1.txtQty9.value
				totalscheme+=total*document.Form1.txtsch9.value
			}
			if(f1.txtPack10.value != "" && document.Form1.Check10.checked==false)
			{
				var mainarr10 = new Array()
				var hidarr10  = f1.txtPack10.value
				mainarr10 = hidarr10.split("X")
				total=mainarr10[0]* mainarr10[1]*document.Form1.txtQty10.value					
				totalliter+=mainarr10[0]* mainarr10[1]*document.Form1.txtQty10.value
				totalscheme+=total*document.Form1.txtsch10.value
			}
			if(f1.txtPack11.value != "" && document.Form1.Check11.checked==false)
			{
				var mainarr11 = new Array()
				var hidarr11  = f1.txtPack11.value
				mainarr11 = hidarr11.split("X")
				total=mainarr11[0]* mainarr11[1]*document.Form1.txtQty11.value					
				totalliter+=mainarr11[0]* mainarr11[1]*document.Form1.txtQty11.value
				totalscheme+=total*document.Form1.txtsch11.value
			}
			if(f1.txtPack12.value != "" && document.Form1.Check12.checked==false)
			{
				var mainarr12 = new Array()
				var hidarr12  = f1.txtPack12.value
				mainarr12 = hidarr12.split("X")
				total=mainarr12[0]* mainarr12[1]*document.Form1.txtQty12.value					
				totalliter+=mainarr12[0]* mainarr12[1]*document.Form1.txtQty12.value
				totalscheme+=total*document.Form1.txtsch12.value
			}*/
			document.Form1.txtschemetotal.value=totalscheme
			document.Form1.txtlitertotal.value=totalliter
			
		}
	//**********
	function GetCashDiscount()
	{ 
		var CheckBox = new Array(document.Form1.Check1,document.Form1.Check2,document.Form1.Check3,document.Form1.Check4,document.Form1.Check5,document.Form1.Check6,document.Form1.Check7,document.Form1.Check8,document.Form1.Check9,document.Form1.Check10,document.Form1.Check11,document.Form1.Check12);
		var c = 0;
		
		for(var i= 0 ; i < CheckBox.length; i++)
		{
			if(CheckBox[i].checked == false)
			{
				c++
			}
		}
		//if(c == 8)
		if(c == 12)
		{
			changeqtyltrUnchecked();
		}
		else
			changeqtyltr();
	    var CashDisc=document.Form1.txtCashDisc.value
		if(CashDisc=="" || isNaN(CashDisc))
			CashDisc=0
		if(document.Form1.txtCashDiscType.value=="%")
			CashDisc=document.Form1.txtGrandTotal.value*CashDisc/100 
		//************
		var schemeDisc=document.Form1.txtschemetotal.value
		if(schemeDisc=="" || isNaN(schemeDisc))
			schemeDisc=0
			
		var Disc=document.Form1.txtDisc.value
		if(Disc=="" || isNaN(Disc))
			Disc=0
		
		// var NetAmount
		if(document.Form1.txtDiscType.value=="%")
			//Disc=vat_value * Disc/100 
			Disc=(document.Form1.txtGrandTotal.value-eval(schemeDisc))*Disc/100 
			//alert(Disc)
		//document.Form1.txtNetAmount.value=eval(vat_value) - eval(Disc);
		//************
		document.Form1.txtVatValue.value = "";	
		//***bhalcom******document.Form1.txtVatValue.value = eval(document.Form1.txtGrandTotal.value) - eval(CashDisc);	
		document.Form1.txtVatValue.value = eval(document.Form1.txtGrandTotal.value) - (eval(CashDisc)+ eval(Disc)+eval(schemeDisc));
		//alert(document.Form1.txtGrandTotal.value+":::"+CashDisc+":::"+Disc+":::"+schemeDisc)
		
	}
	
	function GetVatAmount()
	{
	    GetCashDiscount()
	    if(document.Form1.No.checked)
	    {
			document.Form1.txtVAT.value = "";
	    }
	    else
	    {
			var vat_rate = document.Form1.txtVatRate.value
			// alert(vat_rate);
			if(vat_rate == "")
				vat_rate = 0;
			var vat = document.Form1.txtVatValue.value
	        if(vat == "" || isNaN(vat))
				vat = 0;
			//alert("disc: "+vat)
			var vat_amount = vat * vat_rate/100
			// alert("vat_amt : "+vat_amount)
			document.Form1.txtVAT.value = vat_amount
			makeRound(document.Form1.txtVAT)
			document.Form1.txtVatValue.value = eval(vat) + eval(vat_amount)
			// alert("total :"+document.Form1.txtVatValue.value)
	    }
	}
	
	function GetNetAmount()
	{
		var vat_value = 0;
		if(document.Form1.No.checked)
	    {
			GetCashDiscount()
			vat_value = document.Form1.txtVatValue.value;
			document.Form1.txtVAT.value = "";
	    }
	    else
	    {
			GetVatAmount()
			vat_value = document.Form1.txtVatValue.value;
	    }
	    if(vat_value=="" || isNaN(vat_value))
			vat_value=0
		/* var Disc=document.Form1.txtDisc.value
		if(Disc=="" || isNaN(Disc))
			Disc=0
		var NetAmount
		if(document.Form1.txtDiscType.value=="%")
			Disc=vat_value * Disc/100 */

		document.Form1.txtNetAmount.value=eval(vat_value) ;
		makeRound(document.Form1.txtNetAmount);
		if(document.Form1.txtNetAmount.value==0)
			document.Form1.txtNetAmount.value==""
	}
		</script>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<script language="javascript" id="SalesReturn" src="../../Sysitem/JS/SalesReturn.js"></script>
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Sysitem/Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body onkeydown="change(event)">
		<form id="Form1" method="post" runat="server">
			<asp:HiddenField ID="hidInvoiceFromDate" runat="server" />
            <asp:HiddenField ID="hidInvoiceToDate" runat="server" />
			<INPUT id="tmpQty4" style="Z-INDEX: 122; LEFT: 390px; WIDTH: 7px; POSITION: absolute; TOP: -3px"
				type="hidden" size="1" name="tmpQty4" runat="server"><INPUT id="tmpQty5" style="Z-INDEX: 123; LEFT: 399px; WIDTH: 7px; POSITION: absolute; TOP: -1px; HEIGHT: 22px"
				type="hidden" size="1" name="tmpQty5" runat="server">
			<uc1:header id="Header1" runat="server"></uc1:header><INPUT id="TxtVen" style="Z-INDEX: 101; LEFT: -544px; POSITION: absolute; TOP: -16px" type="text"
				name="TxtVen" runat="server"> <INPUT id="TextBox1" style="Z-INDEX: 102; LEFT: -248px; WIDTH: 76px; POSITION: absolute; TOP: -40px; HEIGHT: 22px"
				readOnly type="text" size="7" name="TextBox1" runat="server"> <INPUT id="TxtEnd" style="Z-INDEX: 103; LEFT: -208px; WIDTH: 52px; POSITION: absolute; TOP: -24px; HEIGHT: 22px"
				type="text" size="3" name="TxtEnd" runat="server"><INPUT id="Txtstart" style="Z-INDEX: 104; LEFT: -336px; WIDTH: 83px; POSITION: absolute; TOP: -16px; HEIGHT: 22px"
				type="text" size="8" name="Txtstart" runat="server"> <INPUT id="TxtCrLimit" style="Z-INDEX: 105; LEFT: -448px; WIDTH: 70px; POSITION: absolute; TOP: -16px; HEIGHT: 22px"
				accessKey="TxtEnd" type="text" size="6" name="TxtCrLimit" runat="server">
			<asp:textbox id="TextSelect" style="Z-INDEX: 106; LEFT: 216px; POSITION: absolute; TOP: 16px"
				runat="server" Width="16px" Visible="False"></asp:textbox><asp:textbox id="TextBox2" style="Z-INDEX: 107; LEFT: 192px; POSITION: absolute; TOP: 16px" runat="server"
				Width="8px" Visible="False" BorderStyle="Groove"></asp:textbox><asp:textbox id="TxtCrLimit1" style="Z-INDEX: 108; LEFT: 176px; POSITION: absolute; TOP: 16px"
				runat="server" Width="16px" Visible="False" BorderStyle="Groove" ReadOnly="True"></asp:textbox><INPUT id="temptext" style="Z-INDEX: 109; LEFT: 152px; WIDTH: 16px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="temptext" runat="server">
			<asp:textbox id="txtTempQty1" style="Z-INDEX: 110; LEFT: 240px; POSITION: absolute; TOP: 16px"
				runat="server" Width="6px" Visible="False"></asp:textbox><asp:textbox id="txtTempQty2" style="Z-INDEX: 111; LEFT: 256px; POSITION: absolute; TOP: 8px"
				runat="server" Width="8px" Visible="False"></asp:textbox><asp:textbox id="txtTempQty3" style="Z-INDEX: 112; LEFT: 272px; POSITION: absolute; TOP: 8px"
				runat="server" Width="4px" Visible="False"></asp:textbox><asp:textbox id="txtTempQty4" style="Z-INDEX: 113; LEFT: 284px; POSITION: absolute; TOP: 8px"
				runat="server" Width="9px" Visible="False"></asp:textbox><asp:textbox id="TextBox7" style="Z-INDEX: 114; LEFT: 336px; POSITION: absolute; TOP: 0px" runat="server"
				Width="2px" Visible="False"></asp:textbox><asp:textbox id="txtTempQty5" style="Z-INDEX: 115; LEFT: 296px; POSITION: absolute; TOP: 8px"
				runat="server" Width="4px" Visible="False"></asp:textbox><asp:textbox id="txtTempQty6" style="Z-INDEX: 116; LEFT: 304px; POSITION: absolute; TOP: 8px"
				runat="server" Width="4px" Visible="False"></asp:textbox><asp:textbox id="txtTempQty7" style="Z-INDEX: 117; LEFT: 312px; POSITION: absolute; TOP: 0px"
				runat="server" Width="4px" Visible="False"></asp:textbox><asp:textbox id="txtTempQty8" style="Z-INDEX: 118; LEFT: 320px; POSITION: absolute; TOP: 0px"
				runat="server" Width="8px" Visible="False"></asp:textbox><asp:textbox id="txtTempQty9" style="Z-INDEX: 118; LEFT: 320px; POSITION: absolute; TOP: 0px"
				runat="server" Width="8px" Visible="False"></asp:textbox><asp:textbox id="txtTempQty10" style="Z-INDEX: 118; LEFT: 320px; POSITION: absolute; TOP: 0px"
				runat="server" Width="8px" Visible="False"></asp:textbox><asp:textbox id="txtTempQty11" style="Z-INDEX: 118; LEFT: 320px; POSITION: absolute; TOP: 0px"
				runat="server" Width="8px" Visible="False"></asp:textbox><asp:textbox id="txtTempQty12" style="Z-INDEX: 118; LEFT: 320px; POSITION: absolute; TOP: 0px"
				runat="server" Width="8px" Visible="False"></asp:textbox><INPUT id="tmpQty1" style="Z-INDEX: 119; LEFT: 350px; WIDTH: 10px; POSITION: absolute; TOP: 2px; HEIGHT: 22px"
				type="hidden" size="1" name="tmpQty1" runat="server"> <INPUT id="tmpQty2" style="Z-INDEX: 120; LEFT: 365px; WIDTH: 7px; POSITION: absolute; TOP: 0px; HEIGHT: 22px"
				type="hidden" size="1" name="tmpQty2" runat="server"><INPUT id="tmpQty3" style="Z-INDEX: 121; LEFT: 377px; WIDTH: 7px; POSITION: absolute; TOP: 0px; HEIGHT: 22px"
				type="hidden" size="1" name="tmpQty3" runat="server"><INPUT id="tmpQty6" style="Z-INDEX: 124; LEFT: 410px; WIDTH: 6px; POSITION: absolute; TOP: 0px; HEIGHT: 22px"
				type="hidden" size="1" name="tmpQty6" runat="server"><INPUT id="tmpQty7" style="Z-INDEX: 125; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: -7px; HEIGHT: 22px"
				type="hidden" size="1" name="tmpQty7" runat="server"><INPUT id="tmpQty8" style="Z-INDEX: 126; LEFT: 422px; WIDTH: 2px; POSITION: absolute; TOP: -7px; HEIGHT: 22px"
				type="hidden" size="1" name="tmpQty8" runat="server"><INPUT id="tmpQty9" style="Z-INDEX: 126; LEFT: 422px; WIDTH: 2px; POSITION: absolute; TOP: -7px; HEIGHT: 22px"
				type="hidden" size="1" name="tmpQty9" runat="server"><INPUT id="tmpQty10" style="Z-INDEX: 126; LEFT: 422px; WIDTH: 2px; POSITION: absolute; TOP: -7px; HEIGHT: 22px"
				type="hidden" size="1" name="tmpQty10" runat="server"><INPUT id="tmpQty11" style="Z-INDEX: 126; LEFT: 422px; WIDTH: 2px; POSITION: absolute; TOP: -7px; HEIGHT: 22px"
				type="hidden" size="1" name="tmpQty11" runat="server"><INPUT id="tmpQty12" style="Z-INDEX: 126; LEFT: 422px; WIDTH: 2px; POSITION: absolute; TOP: -7px; HEIGHT: 22px"
				type="hidden" size="1" name="tmpQty12" runat="server"><INPUT id="txtVatRate" style="Z-INDEX: 127; LEFT: 432px; WIDTH: 8px; POSITION: absolute; TOP: 8px; HEIGHT: 22px"
				type="hidden" size="1" name="txtVatRate" runat="server"><INPUT id="txtVatValue" style="Z-INDEX: 128; LEFT: 452px; WIDTH: 5px; POSITION: absolute; TOP: 6px; HEIGHT: 22px"
				type="hidden" size="1" name="txtVatValue" runat="server"><INPUT id="tmpGrandTotal" style="Z-INDEX: 129; LEFT: 467px; WIDTH: 9px; POSITION: absolute; TOP: 9px; HEIGHT: 22px"
				type="hidden" size="1" name="Hidden2" runat="server"><INPUT id="tmpCashDisc" style="Z-INDEX: 130; LEFT: 483px; WIDTH: 6px; POSITION: absolute; TOP: 8px; HEIGHT: 22px"
				type="hidden" size="1" name="Hidden3" runat="server"><INPUT id="tmpVatAmount" style="Z-INDEX: 131; LEFT: 496px; WIDTH: 7px; POSITION: absolute; TOP: 10px; HEIGHT: 22px"
				type="hidden" size="1" name="Hidden4" runat="server"><INPUT id="tmpDisc" style="Z-INDEX: 132; LEFT: 508px; WIDTH: 8px; POSITION: absolute; TOP: 10px; HEIGHT: 22px"
				type="hidden" size="1" name="Hidden5" runat="server"><INPUT id="tmpNetAmount" style="Z-INDEX: 133; LEFT: 526px; WIDTH: 10px; POSITION: absolute; TOP: 9px; HEIGHT: 22px"
				type="hidden" size="1" name="Hidden1" runat="server"><INPUT id="temptext11" style="Z-INDEX: 108; LEFT: 152px; WIDTH: 16px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="temptext11" runat="server"><INPUT id="temptext13" style="Z-INDEX: 108; LEFT: 152px; WIDTH: 16px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="temptext13" runat="server">
			<table height="278" cellSpacing="0" cellPadding="0" width="778" align="center">
				<tr>
					<th align="center" colSpan="3">
						<font color="#ce4848">Sales&nbsp;Return Credit Note</font>
						<hr>
						<asp:label id="lblMessage" runat="server" ForeColor="DarkGreen" Font-Size="8pt"></asp:label></th></tr>
				<tr>
					<td align="center">
						<TABLE cellSpacing="0" cellPadding="0" border="1">
							<TBODY>
								<TR>
									<TD vAlign="middle" align="center">
										<TABLE cellPadding="0">
											<TR>
												<TD vAlign="middle">Invoice No&nbsp;<asp:requiredfieldvalidator id="rfv1" InitialValue="Select" Runat="server" ControlToValidate="dropInvoiceNo"
														ErrorMessage="Please Select the Invoice No">*</asp:requiredfieldvalidator></TD>
												<TD vAlign="middle"><asp:dropdownlist id="dropInvoiceNo" runat="server" Width="70px" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="dropInvoiceNo_SelectedIndexChanged">
														<asp:ListItem Value="Select">Select</asp:ListItem>
													</asp:dropdownlist>
                                                    <asp:button id="btnEdit" runat="server" Width="25px" 
														CausesValidation="False" Text="..." ToolTip="Click For Edit" onClientClick="return getDateFilter(450, 300)"></asp:button></TD>
											</TR>
											<TR>
												<TD>Invoice Date</TD>
												<TD><asp:textbox id="lblInvoiceDate" Visible="True" style="WIDTH: 135px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
														 size="22" runat="server" ></asp:textbox></TD>
											</TR>
											<TR>
												<TD>Sales Type</TD>
												<TD><INPUT class="dropdownlist" id="lblSalesType" style="WIDTH: 120px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
														disabled readOnly type="text" size="22" name="lblSalesType" runat="server"></TD>
											</TR>
											<TR>
												<TD></TD>
												<TD><asp:textbox id="txtSlipNo" onblur="check(this)" runat="server" Width="80px" Visible="False"
														BorderStyle="Groove" Font-Size="Larger" CssClass="dropdownlist" Height="20px" Enabled="False"></asp:textbox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
											</TR>
										</TABLE>
									</TD>
									<TD vAlign="middle" align="center">
										<TABLE cellSpacing="0" cellPadding="0">
											<TR>
												<TD>Customer Name</TD>
												<TD><INPUT class="dropdownlist" id="lblCustName" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
														disabled readOnly type="text" size="22" name="lblCustName" runat="server"></TD>
											</TR>
											<TR>
												<TD>Place</TD>
												<TD><INPUT class="dropdownlist" id="lblPlace" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
														disabled readOnly type="text" size="22" name="lblPlace" runat="server"></TD>
											</TR>
											<TR>
												<TD>Due Date</TD>
												<TD><INPUT class="dropdownlist" id="lblDueDate" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
														disabled readOnly type="text" size="22" name="lblDueDate" runat="server"></TD>
											</TR>
											<TR>
												<TD>Vehicle No</TD>
												<TD><INPUT class="dropdownlist" id="lblVehicleNo" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
														disabled readOnly type="text" size="22" name="lblVehicleNo" runat="server"></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD align="center" colSpan="2">
										<TABLE cellSpacing="0" cellPadding="0">
											<TBODY>
												<TR>
													<TD align="center" colSpan="8"><FONT color="#990066"><STRONG><U>Product &nbsp;Details</U></STRONG></FONT></TD>
												</TR>
												<TR>
													<TD align="center" colSpan="2"><FONT color="#990066">SKU Name With Pack</FONT></TD>
													<!--TD align="center"><FONT color="#990066">&nbsp;&nbsp;&nbsp;&nbsp;Package</FONT></TD-->
													<TD align="center"><FONT color="#990066">Qty
															<asp:requiredfieldvalidator id="RequiredFieldValidator4" runat="server" ControlToValidate="txtQty1" ErrorMessage="Please Fill Quentity">*</asp:requiredfieldvalidator></FONT></TD>
													<TD align="center"><FONT color="#990066">Scheme</FONT></TD>
													<TD align="center"><FONT color="#990066">FOC</FONT></TD>
													<TD align="center"><FONT color="#990066">Rate</FONT></TD>
													<TD align="center"><FONT color="#990066">Amount</FONT></TD>
													<TD align="center"><FONT color="#990066">Select</FONT></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdName1" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdName1" runat="server" onserverchange="txtProdName1_ServerChange"></TD>
													<!--TD><INPUT class="dropdownlist" id="txtPack1" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtPack1" runat="server"></TD-->
													<TD align="center"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtQty1" onblur="calc(this,document.Form1.txtRate1,document.Form1.tmpQty1,document.Form1.txtProdsch1,document.Form1.txtQtysch1,1)"
															runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<td><asp:textbox id="txtsch1" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></td>
													<TD><asp:textbox id="txtfoc1" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtRate1" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtAmount1" runat="server" Width="79px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD align="center"><INPUT id="Check1" onclick="select1(document.Form1.Check1,document.Form1.txtProdName1,document.Form1.txtQty1,document.Form1.txtRate1,document.Form1.txtAmount1,document.Form1.tmpQty1)"
															type="checkbox" name="Checkbox1" runat="server"></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdName2" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdName2" runat="server"></TD>
													<!--TD><INPUT class="dropdownlist" id="txtPack2" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtPack2" runat="server"></TD-->
													<TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtQty2" onblur="calc(this,document.Form1.txtRate2,document.Form1.tmpQty2,document.Form1.txtProdsch2,document.Form1.txtQtysch2,2)"
															runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<td><asp:textbox id="txtsch2" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></td>
													<TD><asp:textbox id="txtfoc2" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtRate2" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtAmount2" runat="server" Width="79px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD align="center"><INPUT id="Check2" onclick="select1(document.Form1.Check2,document.Form1.txtProdName2,document.Form1.txtQty2,document.Form1.txtRate2,document.Form1.txtAmount2,document.Form1.tmpQty2)"
															type="checkbox" name="Checkbox2" runat="server" onserverchange="Check2_ServerChange"></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdName3" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdName3" runat="server"></TD>
													<!--TD><INPUT class="dropdownlist" id="txtPack3" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtPack3" runat="server"></TD-->
													<TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtQty3" onblur="calc(this,document.Form1.txtRate3,document.Form1.tmpQty3,document.Form1.txtProdsch3,document.Form1.txtQtysch3,3)"
															runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<td><asp:textbox id="txtsch3" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></td>
													<TD><asp:textbox id="txtfoc3" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtRate3" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtAmount3" runat="server" Width="79px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD align="center"><INPUT id="Check3" onclick="select1(document.Form1.Check3,document.Form1.txtProdName3,document.Form1.txtQty3,document.Form1.txtRate3,document.Form1.txtAmount3,document.Form1.tmpQty3)"
															type="checkbox" name="Checkbox3" runat="server"></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdName4" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdName4" runat="server"></TD>
													<!--TD><INPUT class="dropdownlist" id="txtPack4" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtPack4" runat="server"></TD-->
													<TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtQty4" onblur="calc(this,document.Form1.txtRate4,document.Form1.tmpQty4,document.Form1.txtProdsch4,document.Form1.txtQtysch4,4)"
															runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<td><asp:textbox id="txtsch4" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></td>
													<TD><asp:textbox id="txtfoc4" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtRate4" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtAmount4" runat="server" Width="79px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD align="center"><INPUT id="Check4" onclick="select1(document.Form1.Check4,document.Form1.txtProdName4,document.Form1.txtQty4,document.Form1.txtRate4,document.Form1.txtAmount4,document.Form1.tmpQty4)"
															type="checkbox" name="Checkbox4" runat="server"></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdName5" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdName5" runat="server">
													</TD>
													<!--TD><INPUT class="dropdownlist" id="txtPack5" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtPack5" runat="server"></TD-->
													<TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtQty5" onblur="calc(this,document.Form1.txtRate5,document.Form1.tmpQty5,document.Form1.txtProdsch5,document.Form1.txtQtysch5,5)"
															runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<td><asp:textbox id="txtsch5" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></td>
													<TD><asp:textbox id="txtfoc5" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtRate5" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtAmount5" runat="server" Width="79px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD align="center"><INPUT id="Check5" onclick="select1(document.Form1.Check5,document.Form1.txtProdName5,document.Form1.txtQty5,document.Form1.txtRate5,document.Form1.txtAmount5,document.Form1.tmpQty5)"
															type="checkbox" name="Checkbox5" runat="server"></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdName6" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdName6" runat="server"></TD>
													<!--TD><INPUT class="dropdownlist" id="txtPack6" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtPack6" runat="server"></TD-->
													<TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtQty6" onblur="calc(this,document.Form1.txtRate6,document.Form1.tmpQty6,document.Form1.txtProdsch6,document.Form1.txtQtysch6,6)"
															runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<td><asp:textbox id="txtsch6" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></td>
													<TD><asp:textbox id="txtfoc6" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtRate6" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtAmount6" runat="server" Width="79px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD align="center"><INPUT id="Check6" onclick="select1(document.Form1.Check6,document.Form1.txtProdName6,document.Form1.txtQty6,document.Form1.txtRate6,document.Form1.txtAmount6,document.Form1.tmpQty6)"
															type="checkbox" name="Checkbox6" runat="server"></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdName7" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdName7" runat="server"></TD>
													<!--TD><INPUT class="dropdownlist" id="txtPack7" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtPack7" runat="server"></TD-->
													<TD><asp:textbox id="txtQty7" onblur="calc(this,document.Form1.txtRate7,document.Form1.tmpQty7,document.Form1.txtProdsch7,document.Form1.txtQtysch7,7)"
															runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<td><asp:textbox id="txtsch7" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></td>
													<TD><asp:textbox id="txtfoc7" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtRate7" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtAmount7" runat="server" Width="79px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD align="center"><INPUT id="Check7" onclick="select1(document.Form1.Check7,document.Form1.txtProdName7,document.Form1.txtQty7,document.Form1.txtRate7,document.Form1.txtAmount7,document.Form1.tmpQty7)"
															type="checkbox" name="Checkbox7" runat="server"></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdName8" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdName8" runat="server"></TD>
													<!--TD><INPUT class="dropdownlist" id="txtPack8" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtPack8" runat="server"></TD-->
													<TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtQty8" onblur="calc(this,document.Form1.txtRate8,document.Form1.tmpQty8,document.Form1.txtProdsch8,document.Form1.txtQtysch8,8)"
															runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<td><asp:textbox id="txtsch8" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></td>
													<TD><asp:textbox id="txtfoc8" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtRate8" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtAmount8" runat="server" Width="79px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD align="center"><INPUT id="Check8" onclick="select1(document.Form1.Check8,document.Form1.txtProdName8,document.Form1.txtQty8,document.Form1.txtRate8,document.Form1.txtAmount8,document.Form1.tmpQty8)"
															type="checkbox" name="Checkbox8" runat="server"></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdName9" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdName9" runat="server"></TD>
													<!--TD><INPUT class="dropdownlist" id="txtPack9" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtPack9" runat="server"></TD-->
													<TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtQty9" onblur="calc(this,document.Form1.txtRate9,document.Form1.tmpQty9,document.Form1.txtProdsch9,document.Form1.txtQtysch9,9)"
															runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<td><asp:textbox id="txtsch9" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></td>
													<TD><asp:textbox id="txtfoc9" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtRate9" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtAmount9" runat="server" Width="79px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD align="center"><INPUT id="Check9" onclick="select1(document.Form1.Check9,document.Form1.txtProdName9,document.Form1.txtQty9,document.Form1.txtRate9,document.Form1.txtAmount9,document.Form1.tmpQty9)"
															type="checkbox" name="Checkbox9" runat="server"></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdName10" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdName10" runat="server"></TD>
													<!--TD><INPUT class="dropdownlist" id="txtPack10" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtPack10" runat="server"></TD-->
													<TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtQty10" onblur="calc(this,document.Form1.txtRate10,document.Form1.tmpQty10,document.Form1.txtProdsch10,document.Form1.txtQtysch10,10)"
															runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<td><asp:textbox id="txtsch10" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></td>
													<TD><asp:textbox id="txtfoc10" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtRate10" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtAmount10" runat="server" Width="79px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD align="center"><INPUT id="Check10" onclick="select1(document.Form1.Check10,document.Form1.txtProdName10,document.Form1.txtQty10,document.Form1.txtRate10,document.Form1.txtAmount10,document.Form1.tmpQty10)"
															type="checkbox" name="Checkbox10" runat="server"></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdName11" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdName11" runat="server"></TD>
													<!--TD><INPUT class="dropdownlist" id="txtPack11" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtPack11" runat="server"></TD-->
													<TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtQty11" onblur="calc(this,document.Form1.txtRate11,document.Form1.tmpQty11,document.Form1.txtProdsch11,document.Form1.txtQtysch11,11)"
															runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<td><asp:textbox id="txtsch11" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></td>
													<TD><asp:textbox id="txtfoc11" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtRate11" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtAmount11" runat="server" Width="79px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD align="center"><INPUT id="Check11" onclick="select1(document.Form1.Check11,document.Form1.txtProdName11,document.Form1.txtQty11,document.Form1.txtRate11,document.Form1.txtAmount11,document.Form1.tmpQty11)"
															type="checkbox" name="Checkbox11" runat="server"></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdName12" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdName12" runat="server"></TD>
													<!--TD><INPUT class="dropdownlist" id="txtPack12" style="WIDTH: 168px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtPack11" runat="server"></TD-->
													<TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtQty12" onblur="calc(this,document.Form1.txtRate12,document.Form1.tmpQty12,document.Form1.txtProdsch12,document.Form1.txtQtysch12,12)"
															runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<td><asp:textbox id="txtsch12" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></td>
													<TD><asp:textbox id="txtfoc12" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"
															Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtRate12" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD><asp:textbox id="txtAmount12" runat="server" Width="79px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
													<TD align="center"><INPUT id="Check12" onclick="select1(document.Form1.Check12,document.Form1.txtProdName12,document.Form1.txtQty12,document.Form1.txtRate12,document.Form1.txtAmount12,document.Form1.tmpQty12)"
															type="checkbox" name="Checkbox12" runat="server"></TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdsch1" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdsch1" runat="server"></TD>
													<!--TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtPacksch1" runat="server"
															Width="168px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD-->
													<td><asp:textbox id="txtQtysch1" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></td>
													<TD align="center" colSpan="4" rowSpan="12">&nbsp;<IMG height="250" src="../../HeaderFooter/images/Servo Foc.jpg" width="125"></TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdsch2" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdsch2" runat="server"></TD>
													<!--TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtPacksch2" runat="server"
															Width="168px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD-->
													<td><asp:textbox id="txtQtysch2" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></td>
													<TD colSpan="4">&nbsp;</TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdsch3" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdsch3" runat="server"></TD>
													<!--TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtPacksch3" runat="server"
															Width="168px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD-->
													<td><asp:textbox id="txtQtysch3" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></td>
													<TD colSpan="4">&nbsp;</TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdsch4" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdsch4" runat="server"></TD>
													<!--TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtPacksch4" runat="server"
															Width="168px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD-->
													<td><asp:textbox id="txtQtysch4" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></td>
													<TD colSpan="4">&nbsp;</TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdsch5" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdsch5" runat="server"></TD>
													<!--TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtPacksch5" runat="server"
															Width="168px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD-->
													<td><asp:textbox id="txtQtysch5" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></td>
													<TD colSpan="4">&nbsp;</TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdsch6" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdsch6" runat="server"></TD>
													<!--TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtPacksch6" runat="server"
															Width="168px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD-->
													<td><asp:textbox id="txtQtysch6" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></td>
													<TD colSpan="4">&nbsp;</TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdsch7" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdsch7" runat="server"></TD>
													<!--TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtPacksch7" runat="server"
															Width="168px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD-->
													<td><asp:textbox id="txtQtysch7" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></td>
													<TD colSpan="4">&nbsp;</TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdsch8" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdsch8" runat="server"></TD>
													<!--TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtPacksch8" runat="server"
															Width="168px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD-->
													<td><asp:textbox id="txtQtysch8" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></td>
													<TD colSpan="4">&nbsp;</TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdsch9" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdsch9" runat="server"></TD>
													<!--TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtPacksch9" runat="server"
															Width="168px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD-->
													<td><asp:textbox id="txtQtysch9" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></td>
													<TD colSpan="4">&nbsp;</TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdsch10" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdsch10" runat="server"></TD>
													<!--TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtPacksch10" runat="server"
															Width="168px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD-->
													<td><asp:textbox id="txtQtysch10" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></td>
													<TD colSpan="4">&nbsp;</TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdsch11" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdsch11" runat="server"></TD>
													<!--TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtPacksch11" runat="server"
															Width="168px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD-->
													<td><asp:textbox id="txtQtysch11" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></td>
													<TD colSpan="4">&nbsp;</TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD colSpan="2"><INPUT class="dropdownlist" id="txtProdsch12" style="WIDTH: 100%; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
															disabled readOnly type="text" size="22" name="txtProdsch12" runat="server"></TD>
													<!--TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtPacksch12" runat="server"
															Width="168px" BorderStyle="Groove" CssClass="dropdownlist" Enabled="False"></asp:textbox></TD-->
													<td><asp:textbox id="txtQtysch12" runat="server" Width="52px" BorderStyle="Groove" ReadOnly="True"
															CssClass="dropdownlist" Enabled="False"></asp:textbox></td>
													<TD colSpan="4">&nbsp;</TD>
													<TD>&nbsp;</TD>
												</TR>
												<TR>
													<TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total 
														Liter</TD>
													<TD><asp:textbox id="txtlitertotal" runat="server" Width="94px" BorderStyle="Groove" CssClass="dropdownlist"></asp:textbox></TD>
													<TD></TD>
													<TD></TD>
													<td></td>
													<td></td>
													<TD>Select All</TD>
													<TD align="center"><INPUT id="CheckAll" onclick="return selectAll();" type="checkbox" name="Checkbox9" runat="server"></TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
						<TABLE cellSpacing="0" cellPadding="0" width="530" align="center" border="0">
							<TR>
								<TD>Promo Scheme</TD>
								<TD><asp:textbox id="txtPromoScheme" runat="server" Width="124px" BorderStyle="Groove" ReadOnly="True"
										CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
								<TD></TD>
								<TD>Grand Total</TD>
								<TD><asp:textbox id="txtGrandTotal" runat="server" Width="124px" BorderStyle="Groove" ReadOnly="True"
										CssClass="dropdownlist"></asp:textbox></TD>
							</TR>
							<TR>
								<TD>Remark</TD>
								<TD>
									<P><asp:textbox id="txtRemark" runat="server" Width="124px" BorderStyle="Groove" ReadOnly="True"
											CssClass="dropdownlist" Enabled="False"></asp:textbox></P>
								</TD>
								<TD></TD>
								<TD>Discount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
								<TD><asp:textbox id="txtDisc" onblur="GetNetAmount()" runat="server" Width="124px" BorderStyle="Groove"
										ReadOnly="false" CssClass="dropdownlist" Height="22px"></asp:textbox><asp:textbox id="txtDiscType" onblur="GetNetAmount()" runat="server" Width="124px" BorderStyle="Groove"
										ReadOnly="True" CssClass="dropdownlist" Height="22px" Enabled="False"></asp:textbox></TD>
							</TR>
							<TR>
								<TD>Scheme Discount</TD>
								<TD><asp:textbox id="txtschemetotal" runat="server" Width="124px" BorderStyle="Groove" ReadOnly="True"
										CssClass="dropdownlist"></asp:textbox></TD>
								<TD></TD>
								<TD>Cash Discount</TD>
								<TD><asp:textbox id="txtCashDisc" onblur="GetNetAmount()" runat="server" Width="124px" BorderStyle="Groove"
										ReadOnly="false" CssClass="dropdownlist" Height="22px"></asp:textbox><asp:textbox id="txtCashDiscType" onblur="GetNetAmount()" runat="server" Width="124px" BorderStyle="Groove"
										ReadOnly="True" CssClass="dropdownlist" Height="22px" Enabled="False"></asp:textbox></TD>
							</TR>
							<TR>
								<td>Fleet/OE Discount</td>
								<TD><asp:textbox id="txtfleetoedis" Width="124px" BorderStyle="Groove" ReadOnly="True" Runat="server"
										CssClass="dropdownlist"></asp:textbox></TD>
								<TD></TD>
								<TD>VAT
									<asp:radiobutton id="No" onclick="return GetNetAmount();" runat="server" Enabled="False" Checked="True"
										 GroupName="VAT" ToolTip="Not Applied"></asp:radiobutton>&nbsp;<asp:radiobutton id="Yes" onclick="return GetNetAmount();" runat="server" Enabled="False" 
										GroupName="VAT" ToolTip="Applied"></asp:radiobutton></TD>
								<TD><asp:textbox id="txtVAT" runat="server" Width="124px" BorderStyle="Groove" ReadOnly="True" CssClass="dropdownlist"></asp:textbox></TD>
							</TR>
							<TR>
								<TD>Message</TD>
								<TD><asp:textbox id="txtMessage" runat="server" Width="124px" BorderStyle="Groove" ReadOnly="True"
										CssClass="dropdownlist" Enabled="False"></asp:textbox></TD>
								<td></td>
								<TD>Net Amount</TD>
								<TD><asp:textbox id="txtNetAmount" runat="server" Width="124px" BorderStyle="Groove" ReadOnly="True"
										CssClass="dropdownlist"></asp:textbox></TD>
							</TR>
							<!--TR>
								<TD>Entry&nbsp;By</TD>
								<TD><asp:label id="lblEntryBy" runat="server"></asp:label></TD>
								<TD></TD>
								<TD></TD>
								<TD></TD>
							</TR-->
							<TR>
								<!--TD>Entry Date &amp; Time</TD>
								<TD><asp:label id="lblEntryTime" runat="server"></asp:label></TD-->
								<TD colSpan="3"></TD>
								<TD align="right" colSpan="2"><asp:button id="btnSave" runat="server" Width="55px" 
										Text="Save" onclick="btnSave_Click"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button id="btnPrint" runat="server" Width="55px" Text="Print" onclick="btnPrint_Click"></asp:button></TD>
							</TR>
						</TABLE>
						<asp:validationsummary id="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False"></asp:validationsummary></td>
				</tr>
			</table>
			<uc1:footer id="Footer1" runat="server"></uc1:footer></form>
		<script language="C#">


		</script>
	</body>
</HTML>

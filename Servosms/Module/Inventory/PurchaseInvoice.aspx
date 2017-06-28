<%@ Register TagPrefix="uc1" TagName="Footer" Src="../../HeaderFooter/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="../../HeaderFooter/Header.ascx" %>
<%@ Page language="c#" Inherits="Servosms.Module.Inventory.PurchaseInvoice" CodeFile="PurchaseInvoice.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ServoSMS: Other Purchase Invoice</title> <!--
   Copyright (c) 2005 bbnisys Technologies. All Rights Reserved.
  
   No part of this software shall be reproduced, stored in a 
   retrieval system, or transmitted by any means, electronic 
   mechanical, photocopying, recording  or otherwise, or for
   any  purpose  without the express  written  permission of
   bbnisys Technologies.
-->
		<script language="javascript" id="purchase" src="../../Sysitem/JS/Purchase.js"></script>
		<script language="javascript" id="Searchdrop" src="../../Sysitem/JS/Searchdrop1.js"></script>
		<script language="javascript" id="Validations" src="../../Sysitem/JS/Validations.js"></script>
		<script language="javascript">
		
		function get_fixdisc()
		{
			var disRate=document.Form1.tempfixdisc.value
			if(disRate=="" || isNaN(disRate))
				disRate=0
				
			var tot_qty=document.Form1.txttotalqtyltr1.value
			if(tot_qty=="" || isNaN(tot_qty))
				tot_qty=0
				
			var fixdiscTot=eval(disRate)*eval(tot_qty)
			
			document.Form1.txtfixdisc.value=disRate
			document.Form1.txtfixdiscamount.value=fixdiscTot
		}
		
		
		function get_EBD()
		{
			var v_date=document.Form1.txtVInvoiceDate.value
			
			var EB_period=document.Form1.tempEBPeriod.value      //add by vikas 6.11.2012
			
			var EB_Per=new Array()
			EB_Per=EB_period.split(',')
			if(v_date!="")
			{
				var ebd=document.Form1.temp_EDB.value
				
				var ebd_rate=new Array()
				var ebd_Date=new Array()
				ebd_rate=ebd.split('/')
				ebd_Date=v_date.split('/')
				var day=ebd_Date[0]
				
				//coment by vikas 31.10.2012 if(day<=9 && day>=1)
				
				if(day<=EB_Per[1] && day>=EB_Per[0])
				{
					
					document.Form1.txtebird.value=ebd_rate[0]
					document.Form1.temp_erly_bird.value=ebd_rate[0]
				}
				//coment by vikas 31.10.2012 else if(day<=18 && day>=10)
				else if(day<=EB_Per[3] && day>=EB_Per[2])
				{
					
					document.Form1.txtebird.value=ebd_rate[1]
					document.Form1.temp_erly_bird.value=ebd_rate[1]
				}
				//coment by vikas 31.10.2012 else if(day<=27 && day>=19)
				else if(day<=EB_Per[5] && day>=EB_Per[4])
				{
					
					document.Form1.txtebird.value=ebd_rate[2]
					document.Form1.temp_erly_bird.value=ebd_rate[2]
				}
				else
				{
					document.Form1.txtebird.value=ebd_rate[3]
					document.Form1.temp_erly_bird.value=ebd_rate[3]
				}
			}
			else
			{
				document.Form1.txtebird.value="0.0"
				document.Form1.temp_erly_bird.value="0.0"
				
			}	              
			GetNetAmountEtaxnew()											//add by vikas 27.10.2012
		}
		
		
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
		function checkProd()
		{
			var packArray = new Array();		
			packArray[0]=document.Form1.DropType1.value
			packArray[1]=document.Form1.DropType2.value
			packArray[2]=document.Form1.DropType3.value
			packArray[3]=document.Form1.DropType4.value
			packArray[4]=document.Form1.DropType5.value
			packArray[5]=document.Form1.DropType6.value
			packArray[6]=document.Form1.DropType7.value
			packArray[7]=document.Form1.DropType8.value
			packArray[8]=document.Form1.DropType9.value
			packArray[9]=document.Form1.DropType10.value
			packArray[10]=document.Form1.DropType11.value
			packArray[11]=document.Form1.DropType12.value
			packArray[12]=document.Form1.DropType13.value
			packArray[14]=document.Form1.DropType14.value
			packArray[15]=document.Form1.DropType15.value
			packArray[16]=document.Form1.DropType16.value
			packArray[17]=document.Form1.DropType17.value
			packArray[18]=document.Form1.DropType18.value
			packArray[19]=document.Form1.DropType19.value
			packArray[20]=document.Form1.DropType20.value
			var count = 0;
			for(var i=0;i<20;i++)
			{
				for (var j=0;j<20;j++)
				{
					//if(packArray[i]==packArray[j] && packArray[i]!="TypeSelectSelect")
					if(packArray[i]==packArray[j] && packArray[i]!="Type")
					{
						count=count+1;
						if(count>1)
						{
							alert("Product Already Selected!");
							return false;
						}
					}
					else
						continue;
				}
				count = 0;
			}
			return true;
		}
	
		function calc()
		{	
			document.Form1.txtfoc.value="0";
			//****************************
			<% for(int i=1; i<=20; i++) 
			{
				%>
				document.Form1.txtAmount<%=i%>.value=document.Form1.txtQty<%=i%>.value*document.Form1.txtRate<%=i%>.value	
				if(document.Form1.txtAmount<%=i%>.value==0)
					document.Form1.txtAmount<%=i%>.value=""
				else
					makeRound(document.Form1.txtAmount<%=i%>)
				if(document.Form1.chkfoc<%=i%>.checked)
					document.Form1.txtfoc.value=eval(document.Form1.txtfoc.value)+eval(document.Form1.txtAmount<%=i%>.value)
				<%
			}
			%>
			//****************************
			<% for(int i=1; i<=20; i++) 
			{
				%>
				if(document.Form1.DropType<%=i%>.value != "Type" && document.Form1.txtQty<%=i%>.value != "")
				{
					getschemeprimary(document.Form1.DropType<%=i%>,document.Form1.tempSchDis<%=i%>);
					GetStockistScheme(document.Form1.DropType<%=i%>,document.Form1.tempStktSchDis<%=i%>);    //add
					getschemeAddprimary(document.Form1.DropType<%=i%>,document.Form1.tempSchAddDis<%=i%>);   //Add by vikas 30.06.09
					
					GetFixedDiscount(document.Form1.DropType<%=i%>,document.Form1.tempFixedDisc<%=i%>);       //Add by Vikas 1.1.2013
					
				}
				else
				{
					document.Form1.tempSchDis<%=i%>.value="";
					document.Form1.tempStktSchDis<%=i%>.value="";										//add
					document.Form1.tempSchAddDis<%=i%>.value="";							            //Add by vikas 30.06.09
					
					document.Form1.tempFixedDisc<%=i%>.value="";	           //Add by Vikas 1.1.2013
				}
				<%
			}
			%>
			//****************************
			changeqtyltr();
			document.Form1.txtfixedamt.value="0";
			var schdistot = 0;
			var stktdistot = 0;
			var schdistot_Add = 0;				//Add by vikas 30.06.09
			var stktdis = new Array();
			var schdis = new Array();
			var schdis_Add = new Array();   //Add by vikas 30.06.09
			
			<% 
			for(int i=1;i<=20; i++) 
			{
				%>
				if(document.Form1.tempSchDis<%=i%>.value!="")
				{
					var dis = document.Form1.tempSchDis<%=i%>.value
					schdis = dis.split(":")
					if(schdis[1]=="%")
					{
						schdistot+=eval(document.Form1.txtAmount<%=i%>.value)*eval(schdis[0])/100
					}
					else
					{
						schdistot=schdistot+document.Form1.txtqPack<%=i%>.value*document.Form1.txtQty<%=i%>.value*schdis[0];
					}
				}
				if(document.Form1.tempStktSchDis<%=i%>.value!="")
				{
				
					var stkt = document.Form1.tempStktSchDis<%=i%>.value
					stktdis = stkt.split(":")
					if(!document.Form1.chkfoc<%=i%>.checked)
					{
						if(stktdis[1]=="%")
						{
							stktdistot+=eval(document.Form1.txtAmount<%=i%>.value)*eval(stktdis[0])/100
						}
						else
						{
							stktdistot=stktdistot+document.Form1.txtqPack<%=i%>.value*document.Form1.txtQty<%=i%>.value*stktdis[0];
						}
					}
					
				}
				/***Add by vikas 30.06.09************/
				if(document.Form1.tempSchAddDis<%=i%>.value!="")
				{
					//alert("Check"+document.Form1.tempSchDis<%=i%>.value)
					var dis = document.Form1.tempSchAddDis<%=i%>.value
					schdis_Add = dis.split(":")
					//alert(schdis[0]+":::"+schdis[1]);
					if(schdis_Add[1]=="%")
					{
						schdistot_Add+=eval(document.Form1.txtAmount<%=i%>.value)*eval(schdis_Add[0])/100
					}
					else
					{
						schdistot_Add=schdistot_Add+document.Form1.txtqPack<%=i%>.value*document.Form1.txtQty<%=i%>.value*schdis_Add[0];
					}
				}
				/****end***********/
				<%
			}
			%>
			document.Form1.txtfixedamt.value=eval(schdistot);
			makeRound(document.Form1.txtfixedamt)
			document.Form1.txttradedisamt.value=eval(stktdistot);
			makeRound(document.Form1.txttradedisamt)
			
			/***Add by vikas 30.06.09***************/
			document.Form1.txtAddDis.value=eval(schdistot_Add);
			makeRound(document.Form1.txtAddDis)
			/***end********************/
		
			makeRound(document.Form1.txtfoc)
			GetGrandTotal()
			GetGrandTotal1()
			// alert("hello");
			//Comment by Vikas  2.1.2013 get_fixdisc()        //add by vikas 31.10.2012
			GetNetAmountEtaxnew()
			
			
		}	
	
		
		function GetGrandTotal()
		{
			var GTotal=0
			<% for(int i=1; i<=20; i++) 
			{
				%>
				if(document.Form1.txtAmount<%=i%>.value!="")
	 			GTotal=GTotal+eval(document.Form1.txtAmount<%=i%>.value)
	 			<%
	 		}
	 		%>
			document.Form1.txtGrandTotal.value=GTotal;
			makeRound(document.Form1.txtGrandTotal);
		}	
	 
		function GetGrandTotal1()
		{   
			changeqtyltr();
			//alert("hello");
			var fixdiscTot=0;      //Add by vikas 2.1.2013
			var GTotal1=0
			var GTotal2=0
			var GTotal3=0
			var stktdistot = 0;
			var stktdis = new Array();
			//var GTotal4=0//only for percent value in fixed discount column
			//*************************
			<% for(int i=1; i<=20; i++) 
			{
				%>
				if(document.Form1.txtQty<%=i%>.value!="")
	 			{
	 				GTotal1=GTotal1+eval(document.Form1.txtQty<%=i%>.value);
	 				//GTotal2=GTotal2+changeqtyltr(eval(document.Form1.txtPack1.value)+eval(document.Form1.txtQty1.value))
	 				GTotal2=GTotal2+eval(document.Form1.txtqPack<%=i%>.value)*eval(document.Form1.txtQty<%=i%>.value);
	 				GTotal3=GTotal3+eval(document.Form1.txtqPack<%=i%>.value)*eval(document.Form1.txtQty<%=i%>.value);
	 				
	 				if(document.Form1.chkfoc<%=i%>.checked==true)
	 				{	
	 					if(document.Form1.txtQty<%=i%>.value!="" && GTotal2!=0)
	 					GTotal2=GTotal2-eval(document.Form1.txtqPack<%=i%>.value)*eval(document.Form1.txtQty<%=i%>.value);
	 				}
	 				if(document.Form1.tempSchDis<%=i%>.value!="")
	 				{	
	 					GTotal4=GTotal2-eval(document.Form1.txtqPack<%=i%>.value)*eval(document.Form1.txtQty<%=i%>.value);
	 				}
	 				/***Add by vikas 30.06.09******************
	 				if(document.Form1.tempSchAddDis<%=i%>.value!="")
	 				{	
	 					GTotal4=GTotal2-eval(document.Form1.txtqPack<%=i%>.value)*eval(document.Form1.txtQty<%=i%>.value);
	 				}
	 				****end***************/
				}
				//*******************
				if(document.Form1.tempStktSchDis<%=i%>.value!="")
				{
					var stkt = document.Form1.tempStktSchDis<%=i%>.value
					stktdis = stkt.split(":")
					if(!document.Form1.chkfoc<%=i%>.checked)
					{
						if(stktdis[1]=="%")
						{
							//alert(document.Form1.txtqPack<%=i%>.value)
							var Tot_Ltr=document.Form1.txtqPack<%=i%>.value
							if(Tot_Ltr>=50)
							{
								/*********Add by vikas 29.12.2012*******************/
								stktdistot+=(eval(document.Form1.txtAmount<%=i%>.value)*eval(stktdis[0]))/100;
								/**********************End**************************/
							}
							else
							{
								//coment by vikas 5.11.2012 stktdistot+=eval(document.Form1.txtAmount<%=i%>.value)*eval(stktdis[0])/100
								/*********Add by vikas 5.11.2012*******************/
								var vat_rate = document.Form1.txtVatRate.value;
								var entrytax=eval(document.Form1.txtAmount<%=i%>.value)*2/100;  
								var dealer_vat=eval(entrytax)+ eval(document.Form1.txtAmount<%=i%>.value);
								dealer_vat=(eval(dealer_vat)* eval(vat_rate))/100;
								stktdistot+=(eval(document.Form1.txtAmount<%=i%>.value)+eval(entrytax)+ eval(dealer_vat))*eval(stktdis[0])/100;
								/***************End**************************/
							}
						}
						else
						{
							stktdistot=stktdistot+document.Form1.txtqPack<%=i%>.value*document.Form1.txtQty<%=i%>.value*stktdis[0];
						}
					}
				}
				//*******************
				
				/**************Add By Vikas 2.1.2013************************/
				if(document.Form1.tempFixedDisc<%=i%>.value!="")
				{
					var stkt = document.Form1.tempFixedDisc<%=i%>.value
					stktdis = stkt.split(":")
					
						if(stktdis[1]=="%")
						{
							
						}
						else
						{
							fixdiscTot=fixdiscTot+document.Form1.txtqPack<%=i%>.value*document.Form1.txtQty<%=i%>.value*stktdis[0];
							document.Form1.txtfixdisc.value=stktdis[0]
							//document.Form1.txtfixdiscamount.value=fixdiscTot
						}
					
				}
				
				/**************End************************/
				<%
			}
			%>
			//*************************
		    //alert(GTotal1)
			document.Form1.txttotalqty.value=GTotal1;
			document.Form1.txttotalqtyltr.value=GTotal2;
			document.Form1.txttotalqtyltr1.value=GTotal3;
			
			//document.Form1.txtebirdamt.value=GTotal2*document.Form1.txtebird.value;    //Comment By Vikas Sharma 25.04.09
			
			//****************Start**Add by Vikas Sharma 25.04.09*********************************************/
			
			var EarlyDisType=document.Form1.tempEarlyDisType.value;
			
			var getTotamount=document.Form1.txtGrandTotal.value;
			
			if(EarlyDisType!="%")
			{
				document.Form1.txtebirdamt.value=GTotal2*document.Form1.txtebird.value;
			}
			else
			{
				var EarlyRs=getTotamount*document.Form1.txtebird.value;
				document.Form1.txtebirdamt.value=EarlyRs/100;
			}
				
			//****************end**Add by Vikas Sharma 25.04.09*********************************************/
			
			//***************** add by Mahesh on 30/12/2008, calcculate the trade discount value and after that store in textbox with round the value.
			document.Form1.txttradedisamt.value=eval(stktdistot);
			makeRound(document.Form1.txttradedisamt);
			//5.11.2012 StockistDiscount_New();
			//*****************
			//document.Form1.txttradedisamt.value=GTotal2*document.Form1.txttradedis.value;
			/// comment by Mahesh on 17.12.008, this discount calculate by given different -2 discount in every products then calculate in calc() function. 
			//**var diff=document.Form1.txtGrandTotal.value-document.Form1.txtfoc.value;
			//**document.Form1.txttradedisamt.value=diff*document.Form1.txttradedis.value/100;
			///**************
			//document.Form1.txtfixedamt.value=GTotal2*document.Form1.txtfixed.value;//comment by Mahesh b'coz txtfixedamt is used for Percent Discount on 03.07.008
			//alert(GTotal1+"::"+GTotal2+"::"+GTotal3)
			
			//alert(document.Form1.txtGrandTotal.value)
			document.Form1.tempGrandTotal.value=document.Form1.txtGrandTotal.value-document.Form1.txtfixedamt.value;
			//alert(document.Form1.tempGrandTotal.value)
			
			makeRound(document.Form1.txtfixedamt);
			makeRound(document.Form1.txtebirdamt);
			//makeRound(document.Form1.txttradedisamt);
			makeRound(document.Form1.txttotalqty);
			//makeRound(document.Form1.txttotalqtyltr);
			
			document.Form1.txtfixdiscamount.value=fixdiscTot    //Add by vikas 2.1.2013
			makeRound(document.Form1.txtfixdiscamount);         //Add by vikas 2.1.2013
		}
		//***************************	
		function makeRound(t)
		{
			var str = t.value;
			if(str != "")
			{
				str = eval(str)*100;
				str  = Math.round(str);
				str = eval(str)/100;
				t.value = str;
			}
		}
	
	//this coment add by vikas Grand total and Net Total in GetEtaxnew() function 31.10.2012
		function GetEtaxnew()    //         
		{
			var fixedDisc=0
			//fixedDisc=document.Form1.txtfixed.value
			fixedDisc=document.Form1.txtfixedamt.value
			if(fixedDisc=="" || isNaN(fixedDisc))
				fixedDisc=0
				
				
			/****Add by vikas 30.06.09 ***************/
			var fixedDisc_Add=0
			fixedDisc_Add=document.Form1.txtAddDis.value
			if(fixedDisc_Add=="" || isNaN(fixedDisc_Add))
				fixedDisc_Add=0
			/*******************/
				
	  		//Mahesh,date:07.04.007 if(document.Form1.dropfixed.value=="Per")
			//Mahesh,date:07.04.007 fixedDisc=document.Form1.txtGrandTotal.value*fixedDisc/100
			//****old******
			/* var Et=document.Form1.txtentry.value
			if(Et=="" || isNaN(Et))
			Et=0
			if(document.Form1.dropentry.value=="Per")
			Et=document.Form1.txtGrandTotal.value*Et/100     */
			//**********old**********
			//******new*****
			var Et=document.Form1.txtentrytax.value
			if(Et=="" || isNaN(Et))
				Et=0
			//if(document.Form1.dropentry.value=="Per")
			//Et=document.Form1.txtGrandTotal.value*Et/100
			//alert(document.Form1.tempGrandTotal.value)
			Et=document.Form1.tempGrandTotal.value*Et/100
			document.Form1.txtentry.value=Et
			makeRound(document.Form1.txtentry)
			//****new*********
			var focDisc=document.Form1.txtfoc.value
			if(focDisc=="" || isNaN(focDisc))
				focDisc=0
			if(document.Form1.dropfoc.value=="Per")
				focDisc=document.Form1.txtGrandTotal.value*focDisc/100
			//**********
			var ETFOC=(eval(document.Form1.txtfoc.value)*2)/100
			if(isNaN(ETFOC))
				ETFOC=0
			//**********
			var tradeDisc=document.Form1.txttradedisamt.value
			if(tradeDisc=="" || isNaN(tradeDisc))
				tradeDisc=0
			var tradeless=document.Form1.txttradeless.value
			if(tradeless=="" || isNaN(tradeless) || tradeless=="-")
				tradeless=0	
			var bird=document.Form1.txtebirdamt.value
			if(bird=="" || isNaN(bird))
				bird=0
			var birdless=document.Form1.txtbirdless.value
			if(birdless=="" || isNaN(birdless) || birdless=="-")
				birdless=0
			///document.Form1.txtTotalDisc.value=""
			var Disc=document.Form1.txtDisc.value
			if(Disc=="" || isNaN(Disc))
				Disc=0;
			var Dt=0
			
			var DiscStatus=document.Form1.txtDiscStatus.value
			
			if(DiscStatus=="" || isNaN(DiscStatus))
				DiscStatus=0;
			
			if(DiscStatus==0)
			{
				Dt=eval(document.Form1.txtGrandTotal.value)
				Disc=Dt*Disc/100 
				document.Form1.txtTotalDisc.value=Disc
				makeRound(document.Form1.txtTotalDisc,2)
				if(isNaN(document.Form1.txtTotalDisc.value))
					document.Form1.txtTotalDisc.value=""
			}
			else
			{
				if(document.Form1.DropDiscType.value=="Per")
				{
					//old Dt=eval(document.Form1.txtGrandTotal.value)-(eval(bird)+eval(tradeDisc)+eval(focDisc))
					//		Dt=eval(document.Form1.txtGrandTotal.value)-((eval(bird)-eval(birdless))+(eval(tradeDisc)-eval(tradeless))+eval(focDisc))
					if(Disc>0)
					{
						Dt=eval(document.Form1.txtGrandTotal.value)
						Disc=Dt*Disc/100 
						document.Form1.txtTotalDisc.value=Disc
						makeRound(document.Form1.txtTotalDisc,2)
						if(isNaN(document.Form1.txtTotalDisc.value))
							document.Form1.txtTotalDisc.value=""
					}
					else
					{
						Disc=document.Form1.txtTotalDisc.value
						makeRound(Disc)
					}
				}
				else
				{
					/*var disRate=document.Form1.tempfixdisc.value
					if(disRate=="" || isNaN(disRate))
						disRate=0
					var tot_qty=document.Form1.txttotalqtyltr1.value
					if(tot_qty=="" || isNaN(tot_qty))
						tot_qty=0
					var fixdiscTot=eval(disRate)*eval(tot_qty)
					document.Form1.txtfixdisc.value=disRate
					document.Form1.txtfixdiscamount.value=fixdiscTot*/
					if(Disc>0)
					{
						Dt=eval(document.Form1.txttotalqtyltr1.value)
						Disc=Dt*Disc 
						document.Form1.txtTotalDisc.value=Disc
						makeRound(document.Form1.txtTotalDisc,2)
						if(isNaN(document.Form1.txtTotalDisc.value))
							document.Form1.txtTotalDisc.value=""
					}
					else
					{
						Disc=document.Form1.txtTotalDisc.value
						makeRound(Disc)
					}
				}	
			}
		
			/****Add by vikas 22.12.2012 ***************/
			var Sch_Disc=0
			Sch_Disc=document.Form1.txtPromoScheme.value
			if(Sch_Disc=="" || isNaN(Sch_Disc))
				Sch_Disc=0
			/*******************/
			
			
		    var tot_fixdisc=document.Form1.txtfixdiscamount.value           //Add by vikas 31.10.2012
		
			var CashDisc=document.Form1.txtCashDisc.value
			if(CashDisc=="" || isNaN(CashDisc))
				CashDisc=0
			var GT=0
			document.Form1.txtTotalCashDisc.value=""
			if(document.Form1.DropCashDiscType.value=="Per")
			{  		
				//old  GT=eval(document.Form1.txtGrandTotal.value)-(eval(bird)+eval(tradeDisc)+eval(focDisc))
				//Mahesh ** GT=eval(document.Form1.txtGrandTotal.value)+ eval(Et)-((eval(bird)-eval(birdless))+(eval(tradeDisc)-eval(tradeless))+eval(focDisc)+eval(Disc)+eval(fixedDisc))
				//alert("grandtotal : "+ document.Form1.txtGrandTotal.value);
				//alert("etax : "+Et);
				//alert("ebird : "+bird);
				//alert("tradedis : "+tradeDisc);
				//alert("foc : "+focDisc);
				//alert("dis : "+Disc);
				//alert("fixed dis : "+fixedDisc);
				//alert("ETFOC : "+ETFOC)
				//GT=eval(document.Form1.txtGrandTotal.value)+ eval(Et)-((eval(tradeDisc)-eval(tradeless))+eval(focDisc)+eval(Disc)+eval(fixedDisc)+(eval(bird)-eval(birdless)))
				//coment by vikas 30.06.09 GT=eval(document.Form1.txtGrandTotal.value)+ eval(Et)-((eval(tradeDisc)-eval(tradeless))+eval(focDisc)+eval(Disc)+eval(fixedDisc)+(eval(bird)-eval(birdless))+ETFOC)
				//coment by vikas 31.10.2012 GT=eval(document.Form1.txtGrandTotal.value)+ eval(Et)-eval(fixedDisc_Add)-((eval(tradeDisc)-eval(tradeless))+eval(focDisc)+eval(Disc)+eval(fixedDisc)+(eval(bird)-eval(birdless))+ETFOC)
				
				//coment by vikas 22.12.2012 GT=eval(document.Form1.txtGrandTotal.value)+ eval(Et)-eval(tot_fixdisc)-eval(fixedDisc_Add)-((eval(tradeDisc)-eval(tradeless))+eval(focDisc)+eval(Disc)+eval(fixedDisc)+(eval(bird)-eval(birdless))+ETFOC)
				GT=eval(document.Form1.txtGrandTotal.value)+ eval(Et)-eval(tot_fixdisc)-eval(fixedDisc_Add)-((eval(tradeDisc)-eval(tradeless))+eval(focDisc)+eval(Disc)+eval(fixedDisc)+(eval(bird)-eval(birdless)+eval(Sch_Disc))+ETFOC)   // Add by vikas 22.12.2012
				//GT=GT-eval(fixedDisc_Add)
				 				
				CashDisc=(GT*CashDisc)/100
				document.Form1.txtTotalCashDisc.value=eval(CashDisc)
				makeRound(document.Form1.txtTotalCashDisc,2)
				if(isNaN(document.Form1.txtTotalCashDisc.value))
					document.Form1.txtTotalCashDisc.value=""
				//alert(CashDisc) 
			}
			
			
		document.Form1.txtVatValue.value = "";	
		//old		document.Form1.txtVatValue.value = eval(document.Form1.txtGrandTotal.value) + eval(Et)-eval(tradeDisc)-eval(focDisc)-eval(bird)-eval(CashDisc)-eval(Disc)
		
		//coment by vikas 31.10.2012 document.Form1.txtVatValue.value = eval(document.Form1.txtGrandTotal.value) + eval(Et)-((eval(tradeDisc)-eval(tradeless))+eval(focDisc)+(eval(bird)-eval(birdless))+eval(CashDisc)+eval(Disc)+eval(fixedDisc)+eval(fixedDisc_Add))   //Add by vikas 30.06.09
		
		
		//coment by vikas 22.12.2012 document.Form1.txtVatValue.value = eval(document.Form1.txtGrandTotal.value) + eval(Et)-((eval(tradeDisc)-eval(tradeless))+eval(focDisc)+(eval(bird)-eval(birdless))+eval(CashDisc)+eval(Disc)+eval(fixedDisc)+eval(fixedDisc_Add)+eval(tot_fixdisc))   //Add by vikas 31.10.2012
		document.Form1.txtVatValue.value = eval(document.Form1.txtGrandTotal.value) + eval(Et)-((eval(tradeDisc)-eval(tradeless))+eval(focDisc)+(eval(bird)-eval(birdless))+eval(CashDisc)+eval(Disc)+eval(fixedDisc)+eval(fixedDisc_Add)+eval(tot_fixdisc)+eval(Sch_Disc))   //Add by vikas 22.12.2012
		
		//coment by vikas 30.06.09  document.Form1.txtVatValue.value = eval(document.Form1.txtGrandTotal.value) + eval(Et)-((eval(tradeDisc)-eval(tradeless))+eval(focDisc)+(eval(bird)-eval(birdless))+eval(CashDisc)+eval(Disc)+eval(fixedDisc))
		
		//document.Form1.txtVatValue.value = CashDisc-(eval(bird)-eval(birdless))
		//alert(document.Form1.txtVatValue.value);
	}
				    
	function GetVatAmountetaxnew()
	{
		GetEtaxnew()
		if(document.Form1.No.checked)
		{
			document.Form1.txtVAT.value = "";
	    } 
	    else
	    {
			var vat_rate = document.Form1.txtVatRate.value
			//
			if(vat_rate == "")
				vat_rate = 0;
			var vat = document.Form1.txtVatValue.value ;
			
			if(vat == "" || vat == null || isNaN(vat))
			{
				// alert("if");
				vat = 0;
			}
			// alert("disc: "+vat)
			//mahesh** var vat_amount = vat * vat_rate/100
			var vat_amount = (vat * vat_rate)/100
			// alert("vat_amt : "+vat_amount)
	    
			document.Form1.txtVAT.value = vat_amount
			makeRound(document.Form1.txtVAT)
	    
	        document.Form1.txtVatValue.value = eval(vat) + eval(vat_amount)
			// alert("total :"+document.Form1.txtVatValue.value)
		}
	}
	
	function GetEBT()
	{
		//var birdless = document.Form1.txtbirdless.value
		if(document.Form1.txtbirdless.value != "" && document.Form1.txtbirdless.value != "-")
		{
			document.Form1.txtebirdamt.value = eval(document.Form1.txtebirdamt.value)-eval(document.Form1.txtbirdless.value)
		}
		if(document.Form1.txttradeless.value!="" && document.Form1.txttradeless.value!="-")
		{
			document.Form1.txttradedisamt.value=eval(document.Form1.txttradedisamt.value)-eval(document.Form1.txttradeless.value)
		}
	}
	
	function GetNetAmountEtaxnew()
	{
		GetGrandTotal1();
		var vat_value = 0;
		if(document.Form1.No.checked)
	    {
	        GetEtaxnew()
			vat_value = document.Form1.txtVatValue.value;
			document.Form1.txtVAT.value = "";
	    }
	    else
	    {
			GetVatAmountetaxnew()
			vat_value = document.Form1.txtVatValue.value;
	    }
	    if(vat_value=="" || isNaN(vat_value))
			vat_value=0
		document.Form1.txtNetAmount.value=eval(vat_value);
		//**	makeRound(document.Form1.txtNetAmount);
     
		var netamount=Math.round(document.Form1.txtNetAmount.value,0);
		netamount=netamount+".00";
		document.Form1.txtNetAmount.value=netamount;
		
		if(document.Form1.txtNetAmount.value==0.00 )
			document.Form1.txtNetAmount.value==""
		GetEBT()
	}
	
	function changeqtyltr()
	{
		var f1=document.Form1
		//************************
		<% for(int i=1; i<=20; i++) 
		{
			%>
			var mainarr2 = new Array()
			var hidarr2  = document.Form1.DropType<%=i%>.value
			if(hidarr2 != "Type")
			{
				mainarr2 = hidarr2.split(":")
				//if(f1.txtPack<%=i%>.value != "")
				if(mainarr2[2].toString() != "")
				{
					var mainarr1 = new Array()
					//var hidarr1  = document.Form1.txtPack<%=i%>.value
					//mainarr1 = hidarr1.split("X")
					mainarr1 = mainarr2[2].toString().split("X")
					f1.txtqPack<%=i%>.value=mainarr1[0] * mainarr1[1]
				}
			}
			else
				f1.txtqPack<%=i%>.value="0"
			<%
		}
		%>
	}
	
	function checkDelRec()
	{
		if(document.Form1.BtnEdit == null)
		{
			if(document.Form1.DropInvoiceNo.value!="Select")
			{
				if(confirm("Do You Want To Delete The Product"))
					document.Form1.tempDelinfo.value="Yes";
				else
					document.Form1.tempDelinfo.value="No";
			}
			else
			{
				alert("Please Select The Invoice No");
				return;
			}
		}
		else
		{
			alert("Please Click The Edit button");
			return;
		}
		if(document.Form1.tempDelinfo.value=="Yes")
			document.Form1.submit();
	}
	
	function getInvoiceNo(t)
	{
		if(t.value!="")
		{
			var mainarr = new Array()
			var hidtext  = document.Form1.tempInvoiceInfo.value
			var InNo=t.value
			mainarr = hidtext.split("~")
			if(document.Form1.BtnEdit == null)
			{
				if(document.Form1.tempVndrInvoiceNo.value!=document.Form1.txtVInnvoiceNo.value)
				{
					for(var i=0;i<mainarr.length;i++)
					{
						if(eval(mainarr[i])==eval(t.value))
						{  
							alert("Vendor Invoice No AllReady Exist");
							t.value="";
							return;
						}   
					}
				}
			}    
			else
			{
				for(var i=0;i<mainarr.length;i++)
				{
					if(eval(mainarr[i])==eval(t.value))
					{  
						alert("Vendor Invoice No AllReady Exist");
						t.value="";
						return;
					}   
				}
			}
		}
	}
	
	function GetFOC(t,amt)
	{
		if(t.checked)
		{
			if(amt.value!="")
			{
				if(document.Form1.txtfoc.value=="")
					document.Form1.txtfoc.value=eval(amt.value);
				else
					document.Form1.txtfoc.value=eval(document.Form1.txtfoc.value)+eval(amt.value);
				makeRound(document.Form1.txtfoc)
				calc()
			}
			else
			{
				alert("Please Select The Product and Fill Qty");
				t.checked=false;
			}
		}
		else
		{
			if(amt.value!="")
			{
				document.Form1.txtfoc.value=eval(document.Form1.txtfoc.value)-eval(amt.value);
				makeRound(document.Form1.txtfoc)
				calc()
			}
		}
		//alert(document.Form1.txtfoc.value);
	}
	
	//function getBatch(t,prd,Invo,qty,pck)
	function getBatch(t,prd,Invo,qty)
	{
		if(t.checked)
		{
			if(prd.value!="Type" && qty.value!="")
			{
				var Result="";
				if(Invo!=null)
				{
					childWin=window.open("BatchNo.aspx?chk="+t.name+":"+prd.value+":"+Invo.value, "ChildWin", "toolbar=no,status=no,menubar=no,scrollbars=no,width=205,height=326");
				}
				else
					childWin=window.open("BatchNo.aspx?chk="+t.name+":"+prd.value+":"+document.Form1.DropInvoiceNo.value, "ChildWin", "toolbar=no,status=no,menubar=no,scrollbars=no,width=205,height=326");
			}
			else
			{
				alert("Please Select The Prod & Fill The Qty");
				t.checked=false;
			}
		}
	}
	
	function getSchDisc(t,prd,Invo,qty,tempDisc)
	{
		var count=0;
		if(t.checked)
		{
			if(prd.value!="Type" && qty.value!="")
			{
				var Result="";
				if(Invo!=null)
					childWin=window.open("SchemeDiscount.aspx?chk="+t.name+":"+prd.value+":"+Invo.value, "ChildWin", "toolbar=no,status=no,menubar=no,scrollbars=no,width=165px,height=90px");
				else
					childWin=window.open("SchemeDiscount.aspx?chk="+t.name+":"+prd.value+":"+document.Form1.DropInvoiceNo.value, "ChildWin", "toolbar=no,status=no,menubar=no,scrollbars=no,width=165xp,height=90px");
			}
			else
			{
				alert("Please Select The Prod & Fill The Qty");
				t.checked=false;
			}
		}
		else
		{
			tempDisc.value="";
			<%
			for(int i=1;i<=20;i++)
			{
				%>
				if(document.Form1.tempSchDiscount<%=i%>.value!="")
					count=count+eval(document.Form1.tempSchDiscount<%=i%>.value);
				<%
			}
			%>
			//coment by vikas 22.12.2012 document.Form1.txtDisc.value=count;
			document.Form1.txtPromoScheme.value=count;
			GetNetAmountEtaxnew();
		}
	}
	
	function MoveFocus(t,drop,e)
	{
		if(t.value != "")
		{
			if(window.event) 
			{
				var	key = e.keyCode;
				if(key==13)
				{
					drop.focus();
				}
			}
		}
	}
	function SetFocus()
	{
		document.Form1.DropType1.focus();
	}
		</script>
		</SCRIPT>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<script language="javascript" id="Fuel" src="../../Sysitem/JS/Fuel.js"></script>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Sysitem/Styles.css" type="text/css" rel="StyleSheet">
	</HEAD>
	<body onkeydown="change(event)">
		<form id="Form1" name="Form1" method="post" runat="server">
			<asp:textbox id="txtTempQty2" style="Z-INDEX: 106; LEFT: 184px; POSITION: absolute; TOP: 8px"
				runat="server" Visible="False" Width="8px"></asp:textbox><INPUT id="txtqPack20" style="Z-INDEX: 129; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack20" runat="server"><INPUT id="txtqPack19" style="Z-INDEX: 129; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack19" runat="server"><INPUT id="txtqPack18" style="Z-INDEX: 129; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack18" runat="server"><INPUT id="txtqPack17" style="Z-INDEX: 129; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack17" runat="server"><INPUT id="txtqPack16" style="Z-INDEX: 129; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack16" runat="server"><INPUT id="txtqPack15" style="Z-INDEX: 129; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack15" runat="server"><INPUT id="txtqPack14" style="Z-INDEX: 129; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack14" runat="server"><INPUT id="txtqPack13" style="Z-INDEX: 129; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack13" runat="server"><INPUT id="txtqPack12" style="Z-INDEX: 129; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack12" runat="server"><INPUT id="txtqPack11" style="Z-INDEX: 126; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack11" runat="server"><INPUT id="txtqPack10" style="Z-INDEX: 127; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack10" runat="server"><INPUT id="txtqPack9" style="Z-INDEX: 128; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack9" runat="server"><INPUT id="txtqPack8" style="Z-INDEX: 130; LEFT: 416px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack8" runat="server"><INPUT id="txtqPack7" style="Z-INDEX: 125; LEFT: 400px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack7" runat="server"><INPUT id="txtqPack6" style="Z-INDEX: 124; LEFT: 384px; WIDTH: 5px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack6" runat="server"><INPUT id="txtqPack5" style="Z-INDEX: 123; LEFT: 368px; WIDTH: 5px; POSITION: absolute; TOP: 8px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack5" runat="server"><INPUT id="txtqPack4" style="Z-INDEX: 122; LEFT: 352px; WIDTH: 5px; POSITION: absolute; TOP: 8px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack4" runat="server"><INPUT id="txtqPack3" style="Z-INDEX: 121; LEFT: 336px; WIDTH: 5px; POSITION: absolute; TOP: 8px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack3" runat="server"><INPUT id="txtqPack2" style="Z-INDEX: 120; LEFT: 312px; WIDTH: 5px; POSITION: absolute; TOP: 8px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack2" runat="server"><INPUT id="txtqPack1" style="Z-INDEX: 119; LEFT: 296px; WIDTH: 3px; POSITION: absolute; TOP: 8px; HEIGHT: 22px"
				type="hidden" size="1" name="txtqPack1" runat="server"><INPUT id="txtVatRate" style="Z-INDEX: 118; LEFT: 248px; WIDTH: 8px; POSITION: absolute; TOP: 8px; HEIGHT: 22px"
				type="hidden" size="1" name="txtVatRate" runat="server"><INPUT id="txtVatValue" style="Z-INDEX: 117; LEFT: 272px; WIDTH: 5px; POSITION: absolute; TOP: 8px; HEIGHT: 22px"
				type="hidden" size="1" name="txtVatValue" runat="server"><INPUT id="temp_EDB" style="Z-INDEX: 117; LEFT: 272px; WIDTH: 5px; POSITION: absolute; TOP: 8px; HEIGHT: 22px"
				type="hidden" size="1" name="temp_EDB" runat="server"><asp:textbox id="txtTempQty7" style="Z-INDEX: 111; LEFT: 224px; POSITION: absolute; TOP: 8px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty6" style="Z-INDEX: 110; LEFT: 216px; POSITION: absolute; TOP: 8px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty4" style="Z-INDEX: 108; LEFT: 200px; POSITION: absolute; TOP: 8px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty3" style="Z-INDEX: 107; LEFT: 192px; POSITION: absolute; TOP: 0px"
				runat="server" Visible="False" Width="8px"></asp:textbox><uc1:header id="Header1" runat="server"></uc1:header><INPUT id="TxtVen" style="Z-INDEX: 102; LEFT: -544px; POSITION: absolute; TOP: -24px" type="text"
				name="TxtVen" runat="server">
			<asp:textbox id="Txtselect" style="Z-INDEX: 103; LEFT: 144px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="TextBox1" style="Z-INDEX: 104; LEFT: 160px; POSITION: absolute; TOP: 16px" runat="server"
				Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty1" style="Z-INDEX: 105; LEFT: 176px; POSITION: absolute; TOP: 8px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty5" style="Z-INDEX: 109; LEFT: 208px; POSITION: absolute; TOP: 8px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty8" style="Z-INDEX: 112; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty9" style="Z-INDEX: 116; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty10" style="Z-INDEX: 114; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty11" style="Z-INDEX: 113; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty12" style="Z-INDEX: 115; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="TextBox2" style="Z-INDEX: 131; LEFT: 456px; POSITION: absolute; TOP: 16px" runat="server"
				Width="130px"></asp:textbox><asp:textbox id="txtTempQty13" style="Z-INDEX: 115; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty14" style="Z-INDEX: 115; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty15" style="Z-INDEX: 115; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty16" style="Z-INDEX: 115; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty17" style="Z-INDEX: 115; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty18" style="Z-INDEX: 115; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty19" style="Z-INDEX: 115; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><asp:textbox id="txtTempQty20" style="Z-INDEX: 115; LEFT: 232px; POSITION: absolute; TOP: 16px"
				runat="server" Visible="False" Width="8px"></asp:textbox><INPUT id="txtentrytax" style="Z-INDEX: 132; LEFT: 432px; WIDTH: 12px; POSITION: absolute; TOP: 16px; HEIGHT: 22px"
				type="hidden" size="1" name="txtentrytax" runat="server"><input id="tempDelinfo" style="WIDTH: 1px" type="hidden" name="tempDelinfo" runat="server">
			<input id="tempInvoiceInfo" style="WIDTH: 1px" type="hidden" name="tempInvoiceInfo" runat="server">
			<input id="temp_erly_bird" style="WIDTH: 1px" type="hidden" name="temp_erly_bird" runat="server">
			<input id="bat0" style="WIDTH: 1px" type="hidden" name="bat0" runat="server"><input id="bat1" style="WIDTH: 1px" type="hidden" name="bat1" runat="server"><input id="bat2" style="WIDTH: 1px" type="hidden" name="bat2" runat="server">
			<input id="bat3" style="WIDTH: 1px" type="hidden" name="bat3" runat="server"><input id="bat4" style="WIDTH: 1px" type="hidden" name="bat4" runat="server"><input id="bat5" style="WIDTH: 1px" type="hidden" name="bat5" runat="server">
			<input id="bat6" style="WIDTH: 1px" type="hidden" name="bat6" runat="server"><input id="bat7" style="WIDTH: 1px" type="hidden" name="bat7" runat="server"><input id="bat8" style="WIDTH: 1px" type="hidden" name="bat8" runat="server">
			<input id="bat9" style="WIDTH: 1px" type="hidden" name="bat9" runat="server"><input id="bat10" style="WIDTH: 1px" type="hidden" name="bat10" runat="server"><input id="bat11" style="WIDTH: 1px" type="hidden" name="bat11" runat="server"><input id="bat12" style="WIDTH: 1px" type="hidden" name="bat12" runat="server"><input id="bat13" style="WIDTH: 1px" type="hidden" name="bat13" runat="server"><input id="bat14" style="WIDTH: 1px" type="hidden" name="bat14" runat="server"><input id="bat15" style="WIDTH: 1px" type="hidden" name="bat15" runat="server"><input id="bat16" style="WIDTH: 1px" type="hidden" name="bat16" runat="server"><input id="bat17" style="WIDTH: 1px" type="hidden" name="bat17" runat="server"><input id="bat18" style="WIDTH: 1px" type="hidden" name="bat18" runat="server"><input id="bat19" style="WIDTH: 1px" type="hidden" name="bat19" runat="server">
			<input id="tempSchDis1" style="WIDTH: 1px" type="hidden" name="tempSchDis1" runat="server">
			<input id="tempEarlyDisType" style="WIDTH: 1px" type="hidden" name="tempSchDis1" runat="server">
			<input id="tempSchDis2" style="WIDTH: 1px" type="hidden" name="tempSchDis2" runat="server">
			<input id="tempSchDis3" style="WIDTH: 1px" type="hidden" name="tempSchDis1" runat="server">
			<input id="tempSchDis4" style="WIDTH: 1px" type="hidden" name="tempSchDis4" runat="server">
			<input id="tempSchDis5" style="WIDTH: 1px" type="hidden" name="tempSchDis1" runat="server">
			<input id="tempSchDis6" style="WIDTH: 1px" type="hidden" name="tempSchDis6" runat="server">
			<input id="tempSchDis7" style="WIDTH: 1px" type="hidden" name="tempSchDis1" runat="server">
			<input id="tempSchDis8" style="WIDTH: 1px" type="hidden" name="tempSchDis8" runat="server">
			<input id="tempSchDis9" style="WIDTH: 1px" type="hidden" name="tempSchDis1" runat="server">
			<input id="tempSchDis10" style="WIDTH: 1px" type="hidden" name="tempSchDis10" runat="server">
			<input id="tempSchDis11" style="WIDTH: 1px" type="hidden" name="tempSchDis1" runat="server">
			<input id="tempSchDis12" style="WIDTH: 1px" type="hidden" name="tempSchDis12" runat="server">
			<input id="tempSchDis13" style="WIDTH: 1px" type="hidden" name="tempSchDis1" runat="server">
			<input id="tempSchDis14" style="WIDTH: 1px" type="hidden" name="tempSchDis14" runat="server">
			<input id="tempSchDis15" style="WIDTH: 1px" type="hidden" name="tempSchDis1" runat="server">
			<input id="tempSchDis16" style="WIDTH: 1px" type="hidden" name="tempSchDis16" runat="server">
			<input id="tempSchDis17" style="WIDTH: 1px" type="hidden" name="tempSchDis1" runat="server">
			<input id="tempSchDis18" style="WIDTH: 1px" type="hidden" name="tempSchDis18" runat="server">
			<input id="tempSchDis19" style="WIDTH: 1px" type="hidden" name="tempSchDis1" runat="server">
			<input id="tempSchDis20" style="WIDTH: 1px" type="hidden" name="tempSchDis20" runat="server">
			<input id="tempSchAddDis1" style="WIDTH: 1px" type="hidden" name="tempSchAddDis1" runat="server">
			<input id="tempSchAddDis2" style="WIDTH: 1px" type="hidden" name="tempSchAddDis2" runat="server">
			<input id="tempSchAddDis3" style="WIDTH: 1px" type="hidden" name="tempSchAddDis3" runat="server">
			<input id="tempSchAddDis4" style="WIDTH: 1px" type="hidden" name="tempSchAddDis4" runat="server">
			<input id="tempSchAddDis5" style="WIDTH: 1px" type="hidden" name="tempSchAddDis5" runat="server">
			<input id="tempSchAddDis6" style="WIDTH: 1px" type="hidden" name="tempSchAddDis6" runat="server">
			<input id="tempSchAddDis7" style="WIDTH: 1px" type="hidden" name="tempSchAddDis7" runat="server">
			<input id="tempSchAddDis8" style="WIDTH: 1px" type="hidden" name="tempSchAddDis8" runat="server">
			<input id="tempSchAddDis9" style="WIDTH: 1px" type="hidden" name="tempSchAddDis9" runat="server">
			<input id="tempSchAddDis10" style="WIDTH: 1px" type="hidden" name="tempSchAddDis10" runat="server">
			<input id="tempSchAddDis11" style="WIDTH: 1px" type="hidden" name="tempSchAddDis11" runat="server">
			<input id="tempSchAddDis12" style="WIDTH: 1px" type="hidden" name="tempSchAddDis12" runat="server">
			<input id="tempSchAddDis13" style="WIDTH: 1px" type="hidden" name="tempSchAddDis13" runat="server">
			<input id="tempSchAddDis14" style="WIDTH: 1px" type="hidden" name="tempSchAddDis14" runat="server">
			<input id="tempSchAddDis15" style="WIDTH: 1px" type="hidden" name="tempSchAddDis15" runat="server">
			<input id="tempSchAddDis16" style="WIDTH: 1px" type="hidden" name="tempSchAddDis16" runat="server">
			<input id="tempSchAddDis17" style="WIDTH: 1px" type="hidden" name="tempSchAddDis17" runat="server">
			<input id="tempSchAddDis18" style="WIDTH: 1px" type="hidden" name="tempSchAddDis18" runat="server">
			<input id="tempSchAddDis19" style="WIDTH: 1px" type="hidden" name="tempSchAddDis19" runat="server">
			<input id="tempSchAddDis20" style="WIDTH: 1px" type="hidden" name="tempSchAddDis20" runat="server">
			<input id="tempStktSchDis1" style="WIDTH: 1px" type="hidden" name="tempStktSchDis1" runat="server">
			<input id="tempStktSchDis2" style="WIDTH: 1px" type="hidden" name="tempStktSchDis2" runat="server">
			<input id="tempStktSchDis3" style="WIDTH: 1px" type="hidden" name="tempStktSchDis3" runat="server">
			<input id="tempStktSchDis4" style="WIDTH: 1px" type="hidden" name="tempStktSchDis4" runat="server">
			<input id="tempStktSchDis5" style="WIDTH: 1px" type="hidden" name="tempStktSchDis5" runat="server">
			<input id="tempStktSchDis6" style="WIDTH: 1px" type="hidden" name="tempStktSchDis6" runat="server">
			<input id="tempStktSchDis7" style="WIDTH: 1px" type="hidden" name="tempStktSchDis7" runat="server">
			<input id="tempStktSchDis8" style="WIDTH: 1px" type="hidden" name="tempStktSchDis8" runat="server">
			<input id="tempStktSchDis9" style="WIDTH: 1px" type="hidden" name="tempStktSchDis9" runat="server">
			<input id="tempStktSchDis10" style="WIDTH: 1px" type="hidden" name="tempStktSchDis10" runat="server">
			<input id="tempStktSchDis11" style="WIDTH: 1px" type="hidden" name="tempStktSchDis11" runat="server">
			<input id="tempStktSchDis12" style="WIDTH: 1px" type="hidden" name="tempStktSchDis12" runat="server">
			<input id="tempStktSchDis13" style="WIDTH: 1px" type="hidden" name="tempStktSchDis13" runat="server">
			<input id="tempStktSchDis14" style="WIDTH: 1px" type="hidden" name="tempStktSchDis14" runat="server">
			<input id="tempStktSchDis15" style="WIDTH: 1px" type="hidden" name="tempStktSchDis15" runat="server">
			<input id="tempStktSchDis16" style="WIDTH: 1px" type="hidden" name="tempStktSchDis16" runat="server">
			<input id="tempStktSchDis17" style="WIDTH: 1px" type="hidden" name="tempStktSchDis17" runat="server">
			<input id="tempStktSchDis18" style="WIDTH: 1px" type="hidden" name="tempStktSchDis18" runat="server">
			<input id="tempStktSchDis19" style="WIDTH: 1px" type="hidden" name="tempStktSchDis19" runat="server">
			<input id="tempStktSchDis20" style="WIDTH: 1px" type="hidden" name="tempStktSchDis20" runat="server">
			<input id="tempStktSchDisType1" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType1"
				runat="server"> <input id="tempStktSchDisType2" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType2"
				runat="server"> <input id="tempStktSchDisType3" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType3"
				runat="server"> <input id="tempStktSchDisType4" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType4"
				runat="server"> <input id="tempStktSchDisType5" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType5"
				runat="server"> <input id="tempStktSchDisType6" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType6"
				runat="server"> <input id="tempStktSchDisType7" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType7"
				runat="server"> <input id="tempStktSchDisType8" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType8"
				runat="server"> <input id="tempStktSchDisType9" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType9"
				runat="server"> <input id="tempStktSchDisType10" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType10"
				runat="server"> <input id="tempStktSchDisType11" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType11"
				runat="server"> <input id="tempStktSchDisType12" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType12"
				runat="server"> <input id="tempStktSchDisType13" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType13"
				runat="server"> <input id="tempStktSchDisType14" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType14"
				runat="server"> <input id="tempStktSchDisType15" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType15"
				runat="server"> <input id="tempStktSchDisType16" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType16"
				runat="server"> <input id="tempStktSchDisType17" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType17"
				runat="server"> <input id="tempStktSchDisType18" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType18"
				runat="server"> <input id="tempStktSchDisType19" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType19"
				runat="server"> <input id="tempStktSchDisType20" style="WIDTH: 1px" type="hidden" name="tempStktSchDisType20"
				runat="server"><input id="tempStktSchDis" style="WIDTH: 1px" type="hidden" name="tempStktSchDis" runat="server">
			<input id="tempGrandTotal" style="WIDTH: 1px" type="hidden" name="tempGrandTotal" runat="server">
			<INPUT id="texthiddenprod" style="Z-INDEX: 2; VISIBILITY: hidden; WIDTH: 0px; POSITION: absolute; HEIGHT: 20px"
				type="text" name="texthiddenprod" runat="server"><INPUT class="dropdownlist" id="temptext" style="WIDTH: 1px" type="hidden" name="temptext"
				runat="server"> <INPUT id="temptext12" style="Z-INDEX: 108; LEFT: 152px; WIDTH: 16px; POSITION: absolute; TOP: 0px; HEIGHT: 20px"
				type="hidden" size="2" name="temptext12" runat="server"> <INPUT id="temptext_add1" style="Z-INDEX: 108; LEFT: 152px; WIDTH: 16px; POSITION: absolute; TOP: 0px; HEIGHT: 20px"
				type="hidden" size="2" name="temptext_add1" runat="server"><INPUT id="tempVndrInvoiceNo" style="Z-INDEX: 108; LEFT: 152px; WIDTH: 16px; POSITION: absolute; TOP: 0px; HEIGHT: 20px"
				type="hidden" size="2" name="tempVndrInvoiceNo" runat="server"><input id="tempSchDiscount1" style="WIDTH: 1px" type="hidden" name="tempSchDiscount1" runat="server">
			<input id="tempSchDiscount2" style="WIDTH: 1px" type="hidden" name="tempSchDiscount2" runat="server">
			<input id="tempSchDiscount3" style="WIDTH: 1px" type="hidden" name="tempSchDiscount3" runat="server">
			<input id="tempSchDiscount4" style="WIDTH: 1px" type="hidden" name="tempSchDiscount4" runat="server">
			<input id="tempSchDiscount5" style="WIDTH: 1px" type="hidden" name="tempSchDiscount5" runat="server">
			<input id="tempSchDiscount6" style="WIDTH: 1px" type="hidden" name="tempSchDiscount6" runat="server">
			<input id="tempSchDiscount7" style="WIDTH: 1px" type="hidden" name="tempSchDiscount7" runat="server">
			<input id="tempSchDiscount8" style="WIDTH: 1px" type="hidden" name="tempSchDiscount8" runat="server">
			<input id="tempSchDiscount9" style="WIDTH: 1px" type="hidden" name="tempSchDiscount9" runat="server">
			<input id="tempSchDiscount10" style="WIDTH: 1px" type="hidden" name="tempSchDiscount10"
				runat="server"> <input id="tempSchDiscount11" style="WIDTH: 1px" type="hidden" name="tempSchDiscount11"
				runat="server"> <input id="tempSchDiscount12" style="WIDTH: 1px" type="hidden" name="tempSchDiscount12"
				runat="server"> <input id="tempSchDiscount13" style="WIDTH: 1px" type="hidden" name="tempSchDiscount13"
				runat="server"> <input id="tempSchDiscount14" style="WIDTH: 1px" type="hidden" name="tempSchDiscount14"
				runat="server"> <input id="tempSchDiscount15" style="WIDTH: 1px" type="hidden" name="tempSchDiscount15"
				runat="server"> <input id="tempSchDiscount16" style="WIDTH: 1px" type="hidden" name="tempSchDiscount16"
				runat="server"> <input id="tempSchDiscount17" style="WIDTH: 1px" type="hidden" name="tempSchDiscount17"
				runat="server"> <input id="tempSchDiscount18" style="WIDTH: 1px" type="hidden" name="tempSchDiscount18"
				runat="server"> <input id="tempSchDiscount19" style="WIDTH: 1px" type="hidden" name="tempSchDiscount19"
				runat="server"> <input id="tempSchDiscount20" style="WIDTH: 1px" type="hidden" name="tempSchDiscount20"
				runat="server"><input id="tempfixdisc" style="WIDTH: 1px" type="hidden" name="tempfixdisc" runat="server">
			<input id="tempStkdisc" style="WIDTH: 1px" type="hidden" name="tempStkdisc" runat="server">
			<input id="tempEBPeriod" style="WIDTH: 1px" type="hidden" name="tempEBPeriod" runat="server">
			<input id="txtDiscStatus" style="WIDTH: 1px" type="hidden" name="txtDiscStatus" runat="server">
			<input id="tempFixedDisc1" style="WIDTH: 1px" type="hidden" name="tempFixedDisc1" runat="server">
			<input id="tempFixedDisc2" style="WIDTH: 1px" type="hidden" name="tempFixedDisc2" runat="server">
			<input id="tempFixedDisc3" style="WIDTH: 1px" type="hidden" name="tempFixedDisc3" runat="server">
			<input id="tempFixedDisc4" style="WIDTH: 1px" type="hidden" name="tempFixedDisc4" runat="server">
			<input id="tempFixedDisc5" style="WIDTH: 1px" type="hidden" name="tempFixedDisc5" runat="server">
			<input id="tempFixedDisc6" style="WIDTH: 1px" type="hidden" name="tempFixedDisc6" runat="server">
			<input id="tempFixedDisc7" style="WIDTH: 1px" type="hidden" name="tempFixedDisc7" runat="server">
			<input id="tempFixedDisc8" style="WIDTH: 1px" type="hidden" name="tempFixedDisc8" runat="server">
			<input id="tempFixedDisc9" style="WIDTH: 1px" type="hidden" name="tempFixedDisc9" runat="server">
			<input id="tempFixedDisc10" style="WIDTH: 1px" type="hidden" name="tempFixedDisc10" runat="server">
			<input id="tempFixedDisc11" style="WIDTH: 1px" type="hidden" name="tempFixedDisc11" runat="server">
			<input id="tempFixedDisc12" style="WIDTH: 1px" type="hidden" name="tempFixedDisc12" runat="server">
			<input id="tempFixedDisc13" style="WIDTH: 1px" type="hidden" name="tempFixedDisc13" runat="server">
			<input id="tempFixedDisc14" style="WIDTH: 1px" type="hidden" name="tempFixedDisc14" runat="server">
			<input id="tempFixedDisc15" style="WIDTH: 1px" type="hidden" name="tempFixedDisc15" runat="server">
			<input id="tempFixedDisc16" style="WIDTH: 1px" type="hidden" name="tempFixedDisc16" runat="server">
			<input id="tempFixedDisc17" style="WIDTH: 1px" type="hidden" name="tempFixedDisc17" runat="server">
			<input id="tempFixedDisc18" style="WIDTH: 1px" type="hidden" name="tempFixedDisc18" runat="server">
			<input id="tempFixedDisc19" style="WIDTH: 1px" type="hidden" name="tempFixedDisc19" runat="server">
			<input id="tempFixedDisc20" style="WIDTH: 1px" type="hidden" name="tempFixedDisc20" runat="server">
			<input id="tempFixedDisc" style="WIDTH: 1px" type="hidden" name="tempFixedDisc" runat="server">
			<table style="WIDTH: 778px" align="center">
				<TR>
					<TH align="center" colSpan="3">
						<font color="#ce4848">Purchase Invoice</font>
						<HR>
						<asp:label id="lblMessage" runat="server" ForeColor="DarkGreen" Font-Size="8pt"></asp:label></TH></TR>
				<tr>
					<td align="center">
						<TABLE border="1">
							<TR>
								<TD align="center" width="40%">
									<TABLE cellSpacing="0" cellPadding="0">
										<TR>
											<TD>&nbsp;&nbsp;&nbsp;Invoice No</TD>
											<TD><asp:textbox id="lblInvoiceNo" runat="server" Width="63px" ReadOnly="True" BorderStyle="Groove"
													CssClass="fontstyle" Height="16px"></asp:textbox><asp:dropdownlist id="DropInvoiceNo" runat="server" Width="114px" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="DropInvoiceNo_SelectedIndexChanged">
													<asp:ListItem Value="Select">Select</asp:ListItem>
												</asp:dropdownlist><asp:button id="BtnEdit" tabIndex="200" runat="server" Text="..." ToolTip="Edit Existing Record "
													CausesValidation="False"  onclick="BtnEdit_Click"></asp:button></TD>
										</TR>
										<TR>
											<TD>&nbsp;&nbsp;&nbsp;Invoice Date</TD>
											<TD><asp:textbox id="lblInvoiceDate" runat="server" Width="81px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox><A onclick="if(self.gfPop)gfPop.fPopCalendar(document.Form1.lblInvoiceDate);return false;"><IMG class="PopcalTrigger" alt="" src="../../HeaderFooter/DTPicker/calender_icon.jpg"
														align="absMiddle" border="0"></A></TD>
										</TR>
										<TR>
											<TD>&nbsp;&nbsp;&nbsp;Mode of Payment <FONT color="red">&nbsp;</FONT>&nbsp;&nbsp;</TD>
											<TD><asp:dropdownlist id="DropModeType" runat="server" Width="118px" CssClass="dropdownlist" Height="20px" onselectedindexchanged="DropModeType_SelectedIndexChanged">
													<asp:ListItem Value="Cash" Selected="True">Cash</asp:ListItem>
													<asp:ListItem Value="Cheque">Cheque</asp:ListItem>
													<asp:ListItem Value="DD on Delivery">DD on Delivery</asp:ListItem>
												</asp:dropdownlist>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</TD>
										</TR>
									</TABLE>
								</TD>
								<TD align="center" width="60%"><FONT color="#990066">Vendor Information</FONT></FONT></U>
									<TABLE cellSpacing="0" cellPadding="0">
										<TR>
											<TD>Vendor&nbsp;Name&nbsp;<FONT color="#ff0000">*</FONT>
											</TD>
											<TD colSpan="2"><asp:dropdownlist id="DropVendorID" runat="server" Width="220px" CssClass="dropdownlist" AutoPostBack="False"
													onChange="getCity(this,document.Form1.lblPlace);" onselectedindexchanged="DropVendorID_SelectedIndexChanged">
													<asp:ListItem Value="Select">Select</asp:ListItem>
												</asp:dropdownlist>&nbsp;<asp:comparevalidator id="CompareValidator1" runat="server" ErrorMessage="Please Select The Vendor Name"
													ValueToCompare="Select" ControlToValidate="DropVendorID" Operator="NotEqual">*</asp:comparevalidator>
											</TD>
										</TR>
										<TR>
											<TD>Place</TD>
											<TD colSpan="2"><INPUT class="dropdownlist" id="lblPlace" style="BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; BORDER-BOTTOM-STYLE: groove"
													readOnly type="text" size="38" Width="420px" name="lblPlace" runat="server"></TD>
										</TR>
										<TR>
											<TD>Vehicle No&nbsp;*
											</TD>
											<TD colSpan="2"><asp:textbox onkeypress="return GetAnyNumber(this, event);" id="txtVehicleNo" onkeyup="MoveFocus(this,document.Form1.txtVInnvoiceNo,event)"
													runat="server" Width="220px" BorderStyle="Groove" CssClass="dropdownlist" Height="20px" MaxLength="15" ontextchanged="txtVehicleNo_TextChanged"></asp:textbox>&nbsp;<asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Vehicle No."
													ControlToValidate="txtVehicleNo">*</asp:requiredfieldvalidator></TD>
										</TR>
										<TR>
											<TD>Invoice No&nbsp; <FONT color="red">*</FONT>
												<asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" ErrorMessage="Numeric only" ControlToValidate="txtVInnvoiceNo"
													ValidationExpression="\d+">*</asp:regularexpressionvalidator></TD>
											<TD colSpan="2"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtVInnvoiceNo"
													onblur="getInvoiceNo(this);" runat="server" Width="220px" BorderStyle="Groove" CssClass="dropdownlist"
													Height="20px" MaxLength="9"></asp:textbox>&nbsp;<asp:requiredfieldvalidator id="Requiredfieldvalidator2" runat="server" ErrorMessage="Please Enter Vendor Invoice No"
													ControlToValidate="txtVInnvoiceNo">*</asp:requiredfieldvalidator></TD>
										</TR>
										<TR>
											<TD>Invoice Date <FONT color="#ff0000">*</FONT>
											</TD>
											<TD colSpan="2"><asp:textbox id="txtVInvoiceDate" runat="server" Width="100px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox><A onclick="if(self.gfPop)gfPop.fPopCalendar(document.Form1.txtVInvoiceDate);return false;"><IMG class="PopcalTrigger" alt="" src="../../HeaderFooter/DTPicker/calender_icon.jpg"
														align="absMiddle" border="0"></A><asp:requiredfieldvalidator id="Requiredfieldvalidator4" runat="server" ErrorMessage="Please Enter Invoice Date"
													ControlToValidate="txtVInvoiceDate">*</asp:requiredfieldvalidator></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD align="center" colSpan="2">
									<TABLE id="Table4" cellSpacing="0" cellPadding="0" width="550" border="0">
										<TR>
											<TD align="center" colSpan="7"><FONT color="#990066"><STRONG><U>Products Details</U></STRONG></FONT></TD>
										</TR>
										<TR>
											<TD align="center" colSpan="3"><FONT color="#990066">SKU Name With Pack
													<asp:comparevalidator id="Comparevalidator2" runat="server" ErrorMessage="Please Select The Product Type"
														ValueToCompare="Type" ControlToValidate="DropType1" Operator="NotEqual">*</asp:comparevalidator></FONT></TD>
											<!--TD style="WIDTH: 158px" align="center"><FONT color="#990066">Name</FONT></TD>
											<TD align="center"><FONT color="#990066">Package</FONT></TD-->
											<TD style="WIDTH: 54px" align="center"><FONT color="#990066">Qty
													<asp:requiredfieldvalidator id="Requiredfieldvalidator5" runat="server" ErrorMessage="Please Enter Qty" ControlToValidate="txtQty1">*</asp:requiredfieldvalidator></FONT></TD>
											<TD align="center"><FONT color="#990066">Rate</FONT></TD>
											<TD align="center"><FONT color="#990066">Amount</FONT></TD>
											<TD align="center"><FONT color="#990066">FOC</FONT></TD>
											<TD align="center"><FONT color="#990066">&nbsp;Bat&nbsp;</FONT></TD>
											<TD align="center"><FONT color="#990066">SchDisc</FONT></TD>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType1"
													onkeyup="search3(this,document.Form1.DropProdName1,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName1,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName1,event,document.Form1.DropType1,document.Form1.txtQty1),getStock1(this,document.Form1.txtRate1,document.Form1.txtQty1,document.Form1.txtAmount1)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName1,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName1)"
													value="Type" name="DropType1" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName1,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName1),get_EBD()" readOnly
													type="text" name="temp4"><br>
												<div id="Layer2" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType1,document.Form1.txtQty1),getStock1(document.Form1.DropType1,document.Form1.txtRate1,document.Form1.txtQty1,document.Form1.txtAmount1)"
														id="DropProdName1" ondblclick="select(this,document.Form1.DropType1),getStock1(document.Form1.DropType1,document.Form1.txtRate1,document.Form1.txtQty1,document.Form1.txtAmount1)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty1,document.Form1.DropType1)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType1),getStock1(document.Form1.DropType1,document.Form1.txtRate1,document.Form1.txtQty1,document.Form1.txtAmount1)"
														multiple name="DropProdName1"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty1" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType2,event)" runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate1" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount1" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc1" onclick="GetFOC(this,document.Form1.txtAmount1)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType1,document.Form1.lblInvoiceNo,document.Form1.txtQty1)"
													type="checkbox" name="chkbatch1"></td>
											<td align="center"><input id="chkSchDisc1" onclick="getSchDisc(this,document.Form1.DropType1,document.Form1.lblInvoiceNo,document.Form1.txtQty1,document.Form1.tempSchDiscount1)"
													type="checkbox" name="chkSchDisc1" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType2"
													onkeyup="search3(this,document.Form1.DropProdName2,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName2,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName2,event,document.Form1.DropType2,document.Form1.txtQty2),getStock1(this,document.Form1.txtRate2,document.Form1.txtQty2,document.Form1.txtAmount2)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName2,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName2)"
													value="Type" name="DropType2" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName2,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName2)" readOnly type="text"
													name="temp2"><br>
												<div id="Layer3" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType2,document.Form1.txtQty2),getStock1(document.Form1.DropType2,document.Form1.txtRate2,document.Form1.txtQty2,document.Form1.txtAmount2)"
														id="DropProdName2" ondblclick="select(this,document.Form1.DropType2),getStock1(document.Form1.DropType2,document.Form1.txtRate2,document.Form1.txtQty2,document.Form1.txtAmount2)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty2,document.Form1.DropType2)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType2),getStock1(document.Form1.DropType2,document.Form1.txtRate2,document.Form1.txtQty2,document.Form1.txtAmount2)"
														multiple name="DropProdName2"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty2" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType3,event)" runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD style="WIDTH: 54px"><asp:textbox id="txtRate2" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount2" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc2" onclick="GetFOC(this,document.Form1.txtAmount2)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType2,document.Form1.lblInvoiceNo,document.Form1.txtQty2)"
													type="checkbox" name="chkbatch2"></td>
											<td align="center"><input id="chkSchDisc2" onclick="getSchDisc(this,document.Form1.DropType2,document.Form1.lblInvoiceNo,document.Form1.txtQty2,document.Form1.tempSchDiscount2)"
													type="checkbox" name="chkSchDisc2" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType3"
													onkeyup="search3(this,document.Form1.DropProdName3,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName3,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName3,event,document.Form1.DropType3,document.Form1.txtQty3),getStock1(this,document.Form1.txtRate3,document.Form1.txtQty3,document.Form1.txtAmount3)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName3,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName3)"
													value="Type" name="DropType3" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName3,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName3)" readOnly type="text"
													name="temp4"><br>
												<div id="Layer4" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType3,document.Form1.txtQty3),getStock1(document.Form1.DropType3,document.Form1.txtRate3,document.Form1.txtQty3,document.Form1.txtAmount3)"
														id="DropProdName3" ondblclick="select(this,document.Form1.DropType3),getStock1(document.Form1.DropType3,document.Form1.txtRate3,document.Form1.txtQty3,document.Form1.txtAmount3)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty3,document.Form1.DropType3)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType3),getStock1(document.Form1.DropType3,document.Form1.txtRate3,document.Form1.txtQty3,document.Form1.txtAmount3)"
														multiple name="DropProdName3"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty3" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType4,event)" runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD style="WIDTH: 54px"><asp:textbox id="txtRate3" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount3" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc3" onclick="GetFOC(this,document.Form1.txtAmount3)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType3,document.Form1.lblInvoiceNo,document.Form1.txtQty3)"
													type="checkbox" name="chkbatch3"></td>
											<td align="center"><input id="chkSchDisc3" onclick="getSchDisc(this,document.Form1.DropType3,document.Form1.lblInvoiceNo,document.Form1.txtQty3,document.Form1.tempSchDiscount3)"
													type="checkbox" name="chkSchDisc3" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType4"
													onkeyup="search3(this,document.Form1.DropProdName4,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName4,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName4,event,document.Form1.DropType4,document.Form1.txtQty4),getStock1(this,document.Form1.txtRate4,document.Form1.txtQty4,document.Form1.txtAmount4)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName4,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName4)"
													value="Type" name="DropType4" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName4,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName4)" readOnly type="text"
													name="temp5"><br>
												<div id="Layer5" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType4,document.Form1.txtQty4),getStock1(document.Form1.DropType4,document.Form1.txtRate4,document.Form1.txtQty4,document.Form1.txtAmount4)"
														id="DropProdName4" ondblclick="select(this,document.Form1.DropType4),getStock1(document.Form1.DropType4,document.Form1.txtRate4,document.Form1.txtQty4,document.Form1.txtAmount4)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty4,document.Form1.DropType4)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType4),getStock1(document.Form1.DropType4,document.Form1.txtRate4,document.Form1.txtQty4,document.Form1.txtAmount4)"
														multiple name="DropProdName4"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty4" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType5,event)" runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate4" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount4" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc4" onclick="GetFOC(this,document.Form1.txtAmount4)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType4,document.Form1.lblInvoiceNo,document.Form1.txtQty4)"
													type="checkbox" name="chkbatch4"></td>
											<td align="center"><input id="chkSchDisc4" onclick="getSchDisc(this,document.Form1.DropType4,document.Form1.lblInvoiceNo,document.Form1.txtQty4,document.Form1.tempSchDiscount4)"
													type="checkbox" name="chkSchDisc4" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType5"
													onkeyup="search3(this,document.Form1.DropProdName5,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName5,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName5,event,document.Form1.DropType5,document.Form1.txtQty5),getStock1(this,document.Form1.txtRate5,document.Form1.txtQty5,document.Form1.txtAmount5)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName5,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName5)"
													value="Type" name="DropType5" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName5,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName5)" readOnly type="text"
													name="temp5"><br>
												<div id="Layer6" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType5,document.Form1.txtQty5),getStock1(document.Form1.DropType5,document.Form1.txtRate5,document.Form1.txtQty5,document.Form1.txtAmount5)"
														id="DropProdName5" ondblclick="select(this,document.Form1.DropType5),getStock1(document.Form1.DropType5,document.Form1.txtRate5,document.Form1.txtQty5,document.Form1.txtAmount5)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty5,document.Form1.DropType5)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType5),getStock1(document.Form1.DropType5,document.Form1.txtRate5,document.Form1.txtQty5,document.Form1.txtAmount5)"
														multiple name="DropProdName5"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty5" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType6,event)" runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate5" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount5" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc5" onclick="GetFOC(this,document.Form1.txtAmount5)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType5,document.Form1.lblInvoiceNo,document.Form1.txtQty5)"
													type="checkbox" name="chkbatch5"></td>
											<td align="center"><input id="chkSchDisc5" onclick="getSchDisc(this,document.Form1.DropType5,document.Form1.lblInvoiceNo,document.Form1.txtQty5,document.Form1.tempSchDiscount5)"
													type="checkbox" name="chkSchDisc5" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType6"
													onkeyup="search3(this,document.Form1.DropProdName6,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName6,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName6,event,document.Form1.DropType6,document.Form1.txtQty6),getStock1(this,document.Form1.txtRate6,document.Form1.txtQty6,document.Form1.txtAmount6)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName6,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName6)"
													value="Type" name="DropType6" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName6,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName6)" readOnly type="text"
													name="temp6"><br>
												<div id="Layer7" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType6,document.Form1.txtQty6),getStock1(document.Form1.DropType6,document.Form1.txtRate6,document.Form1.txtQty6,document.Form1.txtAmount6)"
														id="DropProdName6" ondblclick="select(this,document.Form1.DropType6),getStock1(document.Form1.DropType6,document.Form1.txtRate6,document.Form1.txtQty6,document.Form1.txtAmount6)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty6,document.Form1.DropType6)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType6),getStock1(document.Form1.DropType6,document.Form1.txtRate6,document.Form1.txtQty6,document.Form1.txtAmount6)"
														multiple name="DropProdName6"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty6" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType7,event)" runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate6" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount6" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc6" onclick="GetFOC(this,document.Form1.txtAmount6)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType6,document.Form1.lblInvoiceNo,document.Form1.txtQty6)"
													type="checkbox" name="chkbatch6"></td>
											<td align="center"><input id="chkSchDisc6" onclick="getSchDisc(this,document.Form1.DropType6,document.Form1.lblInvoiceNo,document.Form1.txtQty6,document.Form1.tempSchDiscount6)"
													type="checkbox" name="chkSchDisc6" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType7"
													onkeyup="search3(this,document.Form1.DropProdName7,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName7,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName7,event,document.Form1.DropType7,document.Form1.txtQty7),getStock1(this,document.Form1.txtRate7,document.Form1.txtQty7,document.Form1.txtAmount7)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName7,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName7)"
													value="Type" name="DropType7" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName7,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName7)" readOnly type="text"
													name="temp7"><br>
												<div id="Layer8" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType7,document.Form1.txtQty7),getStock1(document.Form1.DropType7,document.Form1.txtRate7,document.Form1.txtQty7,document.Form1.txtAmount7)"
														id="DropProdName7" ondblclick="select(this,document.Form1.DropType7),getStock1(document.Form1.DropType7,document.Form1.txtRate7,document.Form1.txtQty7,document.Form1.txtAmount7)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty7,document.Form1.DropType7)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType7),getStock1(document.Form1.DropType7,document.Form1.txtRate7,document.Form1.txtQty7,document.Form1.txtAmount7)"
														multiple name="DropProdName7"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty7" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType8,event)" runat="server" Width="52px" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate7" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount7" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc7" onclick="GetFOC(this,document.Form1.txtAmount7)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType7,document.Form1.lblInvoiceNo,document.Form1.txtQty7)"
													type="checkbox" name="chkbatch7"></td>
											<td align="center"><input id="chkSchDisc7" onclick="getSchDisc(this,document.Form1.DropType7,document.Form1.lblInvoiceNo,document.Form1.txtQty7,document.Form1.tempSchDiscount7)"
													type="checkbox" name="chkSchDisc7" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType8"
													onkeyup="search3(this,document.Form1.DropProdName8,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName8,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName8,event,document.Form1.DropType8,document.Form1.txtQty8),getStock1(this,document.Form1.txtRate8,document.Form1.txtQty8,document.Form1.txtAmount8)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName8,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName8)"
													value="Type" name="DropType8" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName8,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName8)" readOnly type="text"
													name="temp8"><br>
												<div id="Layer9" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType8,document.Form1.txtQty8),getStock1(document.Form1.DropType8,document.Form1.txtRate8,document.Form1.txtQty8,document.Form1.txtAmount8)"
														id="DropProdName8" ondblclick="select(this,document.Form1.DropType8),getStock1(document.Form1.DropType8,document.Form1.txtRate8,document.Form1.txtQty8,document.Form1.txtAmount8)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty8,document.Form1.DropType8)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType8),getStock1(document.Form1.DropType8,document.Form1.txtRate8,document.Form1.txtQty8,document.Form1.txtAmount8)"
														multiple name="DropProdName8"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty8" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType9,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate8" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount8" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc8" onclick="GetFOC(this,document.Form1.txtAmount8)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType8,document.Form1.lblInvoiceNo,document.Form1.txtQty8)"
													type="checkbox" name="chkbatch8"></td>
											<td align="center"><input id="chkSchDisc8" onclick="getSchDisc(this,document.Form1.DropType8,document.Form1.lblInvoiceNo,document.Form1.txtQty8,document.Form1.tempSchDiscount8)"
													type="checkbox" name="chkSchDisc8" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType9"
													onkeyup="search3(this,document.Form1.DropProdName9,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName9,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName9,event,document.Form1.DropType9,document.Form1.txtQty9),getStock1(this,document.Form1.txtRate9,document.Form1.txtQty9,document.Form1.txtAmount9)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName9,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName9)"
													value="Type" name="DropType9" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName9,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName9)" readOnly type="text"
													name="temp9"><br>
												<div id="Layer10" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType9,document.Form1.txtQty9),getStock1(document.Form1.DropType9,document.Form1.txtRate9,document.Form1.txtQty9,document.Form1.txtAmount9)"
														id="DropProdName9" ondblclick="select(this,document.Form1.DropType9),getStock1(document.Form1.DropType9,document.Form1.txtRate9,document.Form1.txtQty9,document.Form1.txtAmount9)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty9,document.Form1.DropType9)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType9),getStock1(document.Form1.DropType9,document.Form1.txtRate9,document.Form1.txtQty9,document.Form1.txtAmount9)"
														multiple name="DropProdName9"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty9" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType10,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate9" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount9" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc9" onclick="GetFOC(this,document.Form1.txtAmount9)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType9,document.Form1.lblInvoiceNo,document.Form1.txtQty9)"
													type="checkbox" name="chkbatch9"></td>
											<td align="center"><input id="chkSchDisc9" onclick="getSchDisc(this,document.Form1.DropType9,document.Form1.lblInvoiceNo,document.Form1.txtQty9,document.Form1.tempSchDiscount9)"
													type="checkbox" name="chkSchDisc9" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType10"
													onkeyup="search3(this,document.Form1.DropProdName10,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName10,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName10,event,document.Form1.DropType10,document.Form1.txtQty10),getStock1(this,document.Form1.txtRate10,document.Form1.txtQty10,document.Form1.txtAmount10)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName10,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName10)"
													value="Type" name="DropType10" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName10,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName10)" readOnly type="text"
													name="temp10"><br>
												<div id="Layer11" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType10,document.Form1.txtQty10),getStock1(document.Form1.DropType10,document.Form1.txtRate10,document.Form1.txtQty10,document.Form1.txtAmount10)"
														id="DropProdName10" ondblclick="select(this,document.Form1.DropType10),getStock1(document.Form1.DropType10,document.Form1.txtRate10,document.Form1.txtQty10,document.Form1.txtAmount10)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty10,document.Form1.DropType10)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType10),getStock1(document.Form1.DropType10,document.Form1.txtRate10,document.Form1.txtQty10,document.Form1.txtAmount10)"
														multiple name="DropProdName10"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty10" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType11,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate10" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount10" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc10" onclick="GetFOC(this,document.Form1.txtAmount10)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType10,document.Form1.lblInvoiceNo,document.Form1.txtQty10)"
													type="checkbox" name="chkbatch10"></td>
											<td align="center"><input id="chkSchDisc10" onclick="getSchDisc(this,document.Form1.DropType10,document.Form1.lblInvoiceNo,document.Form1.txtQty10,document.Form1.tempSchDiscount10)"
													type="checkbox" name="chkSchDisc10" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType11"
													onkeyup="search3(this,document.Form1.DropProdName11,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName11,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName11,event,document.Form1.DropType11,document.Form1.txtQty11),getStock1(this,document.Form1.txtRate11,document.Form1.txtQty11,document.Form1.txtAmount11)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName11,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName11)"
													value="Type" name="DropType11" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName11,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName11)" readOnly type="text"
													name="temp11"><br>
												<div id="Layer12" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType11,document.Form1.txtQty11),getStock1(document.Form1.DropType11,document.Form1.txtRate11,document.Form1.txtQty11,document.Form1.txtAmount11)"
														id="DropProdName11" ondblclick="select(this,document.Form1.DropType11),getStock1(document.Form1.DropType11,document.Form1.txtRate11,document.Form1.txtQty11,document.Form1.txtAmount11)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty11,document.Form1.DropType11)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType11),getStock1(document.Form1.DropType11,document.Form1.txtRate11,document.Form1.txtQty11,document.Form1.txtAmount11)"
														multiple name="DropProdName11"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty11" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType12,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate11" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount11" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc11" onclick="GetFOC(this,document.Form1.txtAmount11)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType11,document.Form1.lblInvoiceNo,document.Form1.txtQty11)"
													type="checkbox" name="chkbatch11"></td>
											<td align="center"><input id="chkSchDisc11" onclick="getSchDisc(this,document.Form1.DropType11,document.Form1.lblInvoiceNo,document.Form1.txtQty11,document.Form1.tempSchDiscount11)"
													type="checkbox" name="chkSchDisc11" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType12"
													onkeyup="search3(this,document.Form1.DropProdName12,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName12,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName12,event,document.Form1.DropType12,document.Form1.txtQty12),getStock1(this,document.Form1.txtRate12,document.Form1.txtQty12,document.Form1.txtAmount12)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName12,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName12)"
													value="Type" name="DropType12" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName12,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName12)" readOnly type="text"
													name="temp12"><br>
												<div id="Layer13" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType12,document.Form1.txtQty12),getStock1(document.Form1.DropType12,document.Form1.txtRate12,document.Form1.txtQty12,document.Form1.txtAmount12)"
														id="DropProdName12" ondblclick="select(this,document.Form1.DropType12),getStock1(document.Form1.DropType12,document.Form1.txtRate12,document.Form1.txtQty12,document.Form1.txtAmount12)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty12,document.Form1.DropType12)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType12),getStock1(document.Form1.DropType12,document.Form1.txtRate12,document.Form1.txtQty12,document.Form1.txtAmount12)"
														multiple name="DropProdName12"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty12" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType13,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate12" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount12" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc12" onclick="GetFOC(this,document.Form1.txtAmount12)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType12,document.Form1.lblInvoiceNo,document.Form1.txtQty12)"
													type="checkbox" name="chkbatch12"></td>
											<td align="center"><input id="chkSchDisc12" onclick="getSchDisc(this,document.Form1.DropType12,document.Form1.lblInvoiceNo,document.Form1.txtQty12,document.Form1.tempSchDiscount12)"
													type="checkbox" name="chkSchDisc12" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType13"
													onkeyup="search3(this,document.Form1.DropProdName13,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName13,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName13,event,document.Form1.DropType13,document.Form1.txtQty13),getStock1(this,document.Form1.txtRate13,document.Form1.txtQty13,document.Form1.txtAmount13)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName13,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName13)"
													value="Type" name="DropType13" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName13,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName13)" readOnly type="text"
													name="temp12"><br>
												<div id="Layer14" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType13,document.Form1.txtQty13),getStock1(document.Form1.DropType13,document.Form1.txtRate13,document.Form1.txtQty13,document.Form1.txtAmount13)"
														id="DropProdName13" ondblclick="select(this,document.Form1.DropType13),getStock1(document.Form1.DropType13,document.Form1.txtRate13,document.Form1.txtQty13,document.Form1.txtAmount13)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty13,document.Form1.DropType13)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType13),getStock1(document.Form1.DropType13,document.Form1.txtRate13,document.Form1.txtQty13,document.Form1.txtAmount13)"
														multiple name="DropProdName13"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty13" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType14,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate13" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount13" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc13" onclick="GetFOC(this,document.Form1.txtAmount13)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType13,document.Form1.lblInvoiceNo,document.Form1.txtQty13)"
													type="checkbox" name="chkbatch13"></td>
											<td align="center"><input id="chkSchDisc13" onclick="getSchDisc(this,document.Form1.DropType13,document.Form1.lblInvoiceNo,document.Form1.txtQty13,document.Form1.tempSchDiscount13)"
													type="checkbox" name="chkSchDisc13" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType14"
													onkeyup="search3(this,document.Form1.DropProdName14,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName14,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName14,event,document.Form1.DropType14,document.Form1.txtQty14),getStock1(this,document.Form1.txtRate14,document.Form1.txtQty14,document.Form1.txtAmount14)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName14,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName14)"
													value="Type" name="DropType14" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName14,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName14)" readOnly type="text"
													name="temp14"><br>
												<div id="Layer15" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType14,document.Form1.txtQty14),getStock1(document.Form1.DropType14,document.Form1.txtRate14,document.Form1.txtQty14,document.Form1.txtAmount14)"
														id="DropProdName14" ondblclick="select(this,document.Form1.DropType14),getStock1(document.Form1.DropType14,document.Form1.txtRate14,document.Form1.txtQty14,document.Form1.txtAmount14)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty14,document.Form1.DropType14)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType14),getStock1(document.Form1.DropType14,document.Form1.txtRate14,document.Form1.txtQty14,document.Form1.txtAmount14)"
														multiple name="DropProdName14"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty14" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType15,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate14" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount14" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc14" onclick="GetFOC(this,document.Form1.txtAmount14)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType14,document.Form1.lblInvoiceNo,document.Form1.txtQty14)"
													type="checkbox" name="chkbatch14"></td>
											<td align="center"><input id="chkSchDisc14" onclick="getSchDisc(this,document.Form1.DropType14,document.Form1.lblInvoiceNo,document.Form1.txtQty14,document.Form1.tempSchDiscount14)"
													type="checkbox" name="chkSchDisc14" runat="server"></td>
										</TR>
										<tr>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType15"
													onkeyup="search3(this,document.Form1.DropProdName15,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName15,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName15,event,document.Form1.DropType15,document.Form1.txtQty15),getStock1(this,document.Form1.txtRate15,document.Form1.txtQty15,document.Form1.txtAmount15)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName15,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName15)"
													value="Type" name="DropType15" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName15,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName15)" readOnly type="text"
													name="temp15"><br>
												<div id="Layer16" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType15,document.Form1.txtQty15),getStock1(document.Form1.DropType15,document.Form1.txtRate15,document.Form1.txtQty15,document.Form1.txtAmount15)"
														id="DropProdName15" ondblclick="select(this,document.Form1.DropType15),getStock1(document.Form1.DropType15,document.Form1.txtRate15,document.Form1.txtQty15,document.Form1.txtAmount15)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty15,document.Form1.DropType15)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType15),getStock1(document.Form1.DropType15,document.Form1.txtRate15,document.Form1.txtQty15,document.Form1.txtAmount15)"
														multiple name="DropProdName15"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty15" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType16,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate15" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount15" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc15" onclick="GetFOC(this,document.Form1.txtAmount15)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType15,document.Form1.lblInvoiceNo,document.Form1.txtQty15)"
													type="checkbox" name="chkbatch15"></td>
											<td align="center"><input id="chkSchDisc15" onclick="getSchDisc(this,document.Form1.DropType15,document.Form1.lblInvoiceNo,document.Form1.txtQty15,document.Form1.tempSchDiscount15)"
													type="checkbox" name="chkSchDisc15" runat="server"></td>
										</tr>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType16"
													onkeyup="search3(this,document.Form1.DropProdName16,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName16,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName16,event,document.Form1.DropType16,document.Form1.txtQty16),getStock1(this,document.Form1.txtRate16,document.Form1.txtQty16,document.Form1.txtAmount16)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName16,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName16)"
													value="Type" name="DropType16" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName16,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName16)" readOnly type="text"
													name="temp16"><br>
												<div id="Layer17" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType16,document.Form1.txtQty16),getStock1(document.Form1.DropType16,document.Form1.txtRate16,document.Form1.txtQty16,document.Form1.txtAmount16)"
														id="DropProdName16" ondblclick="select(this,document.Form1.DropType16),getStock1(document.Form1.DropType16,document.Form1.txtRate16,document.Form1.txtQty16,document.Form1.txtAmount16)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty16,document.Form1.DropType16)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType16),getStock1(document.Form1.DropType16,document.Form1.txtRate16,document.Form1.txtQty16,document.Form1.txtAmount16)"
														multiple name="DropProdName16"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty16" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType17,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate16" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount16" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc16" onclick="GetFOC(this,document.Form1.txtAmount16)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType16,document.Form1.lblInvoiceNo,document.Form1.txtQty16)"
													type="checkbox" name="chkbatch16"></td>
											<td align="center"><input id="chkSchDisc16" onclick="getSchDisc(this,document.Form1.DropType16,document.Form1.lblInvoiceNo,document.Form1.txtQty16,document.Form1.tempSchDiscount16)"
													type="checkbox" name="chkSchDisc16" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType17"
													onkeyup="search3(this,document.Form1.DropProdName17,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName17,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName17,event,document.Form1.DropType17,document.Form1.txtQty17),getStock1(this,document.Form1.txtRate17,document.Form1.txtQty17,document.Form1.txtAmount17)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName17,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName17)"
													value="Type" name="DropType17" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName17,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName17)" readOnly type="text"
													name="temp17"><br>
												<div id="Layer18" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType17,document.Form1.txtQty17),getStock1(document.Form1.DropType17,document.Form1.txtRate17,document.Form1.txtQty17,document.Form1.txtAmount17)"
														id="DropProdName17" ondblclick="select(this,document.Form1.DropType17),getStock1(document.Form1.DropType17,document.Form1.txtRate17,document.Form1.txtQty17,document.Form1.txtAmount17)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty17,document.Form1.DropType17)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType17),getStock1(document.Form1.DropType17,document.Form1.txtRate17,document.Form1.txtQty17,document.Form1.txtAmount17)"
														multiple name="DropProdName17"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty17" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType18,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate17" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount17" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc17" onclick="GetFOC(this,document.Form1.txtAmount17)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType17,document.Form1.lblInvoiceNo,document.Form1.txtQty17)"
													type="checkbox" name="chkbatch17"></td>
											<td align="center"><input id="chkSchDisc17" onclick="getSchDisc(this,document.Form1.DropType17,document.Form1.lblInvoiceNo,document.Form1.txtQty17,document.Form1.tempSchDiscount17)"
													type="checkbox" name="chkSchDisc17" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType18"
													onkeyup="search3(this,document.Form1.DropProdName18,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName18,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName18,event,document.Form1.DropType18,document.Form1.txtQty18),getStock1(this,document.Form1.txtRate18,document.Form1.txtQty18,document.Form1.txtAmount18)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName18,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName18)"
													value="Type" name="DropType18" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName18,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName18)" readOnly type="text"
													name="temp18"><br>
												<div id="Layer19" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType18,document.Form1.txtQty18),getStock1(document.Form1.DropType18,document.Form1.txtRate18,document.Form1.txtQty18,document.Form1.txtAmount18)"
														id="DropProdName18" ondblclick="select(this,document.Form1.DropType18),getStock1(document.Form1.DropType18,document.Form1.txtRate18,document.Form1.txtQty18,document.Form1.txtAmount18)"
														onkeyup="arrowkeyselect(this,event,document.Form1.DropType19,document.Form1.DropType18)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType18),getStock1(document.Form1.DropType18,document.Form1.txtRate18,document.Form1.txtQty18,document.Form1.txtAmount18)"
														multiple name="DropProdName18"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty18" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType19,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate18" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount18" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc18" onclick="GetFOC(this,document.Form1.txtAmount18)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType18,document.Form1.lblInvoiceNo,document.Form1.txtQty18)"
													type="checkbox" name="chkbatch18"></td>
											<td align="center"><input id="chkSchDisc18" onclick="getSchDisc(this,document.Form1.DropType18,document.Form1.lblInvoiceNo,document.Form1.txtQty18,document.Form1.tempSchDiscount18)"
													type="checkbox" name="chkSchDisc18" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType19"
													onkeyup="search3(this,document.Form1.DropProdName19,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName19,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName19,event,document.Form1.DropType19,document.Form1.txtQty19),getStock1(this,document.Form1.txtRate19,document.Form1.txtQty19,document.Form1.txtAmount19)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName19,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName19)"
													value="Type" name="DropType19" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName19,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName19)" readOnly type="text"
													name="temp19"><br>
												<div id="Layer20" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType19,document.Form1.txtQty19),getStock1(document.Form1.DropType19,document.Form1.txtRate19,document.Form1.txtQty19,document.Form1.txtAmount19)"
														id="DropProdName19" ondblclick="select(this,document.Form1.DropType19),getStock1(document.Form1.DropType19,document.Form1.txtRate19,document.Form1.txtQty19,document.Form1.txtAmount19)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty19,document.Form1.DropType19)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType19),getStock1(document.Form1.DropType19,document.Form1.txtRate19,document.Form1.txtQty19,document.Form1.txtAmount19)"
														multiple name="DropProdName19"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty19" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.DropType20,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate19" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount19" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc19" onclick="GetFOC(this,document.Form1.txtAmount19)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType19,document.Form1.lblInvoiceNo,document.Form1.txtQty19)"
													type="checkbox" name="chkbatch19"></td>
											<td align="center"><input id="chkSchDisc19" onclick="getSchDisc(this,document.Form1.DropType19,document.Form1.lblInvoiceNo,document.Form1.txtQty19,document.Form1.tempSchDiscount19)"
													type="checkbox" name="chkSchDisc19" runat="server"></td>
										</TR>
										<TR>
											<TD colSpan="3"><input class="TextBoxStyle" onkeypress="return GetAnyNumber(this, event);" id="DropType20"
													onkeyup="search3(this,document.Form1.DropProdName20,document.Form1.texthiddenprod.value),arrowkeydown(this,event,document.Form1.DropProdName20,document.Form1.texthiddenprod),Selectbyenter(document.Form1.DropProdName20,event,document.Form1.DropType20,document.Form1.txtQty20),getStock1(this,document.Form1.txtRate20,document.Form1.txtQty20,document.Form1.txtAmount20)"
													style="Z-INDEX: 10; VISIBILITY: visible; WIDTH: 310px; HEIGHT: 19px" onclick="search1(document.Form1.DropProdName20,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName20)"
													value="Type" name="DropType20" runat="server"><input class="ComboBoxSearchButtonStyle" onkeypress="return GetAnyNumber(this, event);"
													onclick="search1(document.Form1.DropProdName20,document.Form1.texthiddenprod),dropshow(document.Form1.DropProdName20)" readOnly type="text"
													name="temp20"><br>
												<div id="Layer21" style="Z-INDEX: 2; POSITION: absolute"><select class="ListBoxborderstyle" onkeypress="Selectbyenter(this,event,document.Form1.DropType20,document.Form1.txtQty20),getStock1(document.Form1.DropType20,document.Form1.txtRate20,document.Form1.txtQty20,document.Form1.txtAmount20)"
														id="DropProdName20" ondblclick="select(this,document.Form1.DropType20),getStock1(document.Form1.DropType20,document.Form1.txtRate20,document.Form1.txtQty20,document.Form1.txtAmount20)"
														onkeyup="arrowkeyselect(this,event,document.Form1.txtQty20,document.Form1.DropType20)" style="Z-INDEX: 10; VISIBILITY: hidden; WIDTH: 330px; HEIGHT: 0px"
														onfocusout="HideList(this,document.Form1.DropType20),getStock1(document.Form1.DropType20,document.Form1.txtRate20,document.Form1.txtQty20,document.Form1.txtAmount20)"
														multiple name="DropProdName20"></select></div>
											</TD>
											<TD style="WIDTH: 54px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,false);" id="txtQty20" onblur="calc(),get_EBD()"
													onkeyup="MoveFocus(this,document.Form1.txtRemark,event)" runat="server" Width="53" BorderStyle="Groove" CssClass="dropdownlist"
													MaxLength="5"></asp:textbox></TD>
											<TD><asp:textbox id="txtRate20" onblur="calc()" runat="server" Width="52px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD><asp:textbox id="txtAmount20" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></TD>
											<TD align="center"><asp:checkbox id="chkfoc20" onclick="GetFOC(this,document.Form1.txtAmount20)" runat="server"></asp:checkbox></TD>
											<td align="center"><input onclick="getBatch(this,document.Form1.DropType20,document.Form1.lblInvoiceNo,document.Form1.txtQty20)"
													type="checkbox" name="chkbatch20"></td>
											<td align="center"><input id="chkSchDisc20" onclick="getSchDisc(this,document.Form1.DropType20,document.Form1.lblInvoiceNo,document.Form1.txtQty20,document.Form1.tempSchDiscount20)"
													type="checkbox" name="chkSchDisc20" runat="server"></td>
										</TR>
										<tr>
											<td align="center">&nbsp; Total Ltr/Kg</td>
											<td><asp:textbox id="txttotalqtyltr1" runat="server" Width="80px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox><asp:textbox id="txttotalqtyltr" runat="server" Width="0px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></td>
											<td align="center">&nbsp;&nbsp;&nbsp;&nbsp; Total</td>
											<td style="WIDTH: 54px"><asp:textbox id="txttotalqty" runat="server" Width="53px" ReadOnly="True" BorderStyle="Groove"
													CssClass="dropdownlist"></asp:textbox></td>
											<td style="WIDTH: 54px">&nbsp;</td>
											<td></td>
											<TD align="center"></TD>
											<TD align="center"></TD>
										</tr>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
						<TABLE style="WIDTH: 600px" cellSpacing="0" cellPadding="0">
							<TR>
								<TD>Sch. Discount</TD>
								<TD><asp:textbox id="txtPromoScheme" runat="server" Width="67px" BorderStyle="Groove" CssClass="dropdownlist"></asp:textbox></TD>
								<TD>&nbsp;Grand Total</TD>
								<TD><asp:textbox id="txtGrandTotal" runat="server" Width="123px" ReadOnly="True" BorderStyle="Groove"
										CssClass="dropdownlist"></asp:textbox></TD>
							</TR>
							<tr>
								<td>FOC Discount</td>
								<td><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtfoc" runat="server"
										Width="67px" ReadOnly="True" BorderStyle="Groove" CssClass="dropdownlist"></asp:textbox><asp:dropdownlist id="dropfoc" runat="server" Width="45px" CssClass="dropdownlist" onchange="GetNetAmountEtaxnew()"
										Enabled="False">
										<asp:ListItem Value="Rs" Selected="True">Rs.</asp:ListItem>
										<asp:ListItem Value="Per">%</asp:ListItem>
									</asp:dropdownlist></td>
								<td>&nbsp;EarlyBird Discount &nbsp;</td>
								<td><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtebird" onblur="GetNetAmountEtaxnew(),get_EBD()"
										runat="server" Width="32px" BorderStyle="Groove" CssClass="dropdownlist" MaxLength="5"></asp:textbox><asp:textbox id="txtebirdamt" onblur="GetNetAmountEtaxnew(),get_EBD()" runat="server" Width="67px"
										ReadOnly="True" BorderStyle="Groove" CssClass="dropdownlist"></asp:textbox><FONT color="#990066">Minus</FONT><asp:textbox onkeypress="return GetOnlyNumbers(this, event, true,true);" id="txtbirdless" onblur="GetNetAmountEtaxnew(),get_EBD()"
										runat="server" Width="28px" BorderStyle="Groove" CssClass="dropdownlist" MaxLength="6"></asp:textbox></td>
							</tr>
							<tr>
								<td>Entry Tax</td>
								<td><asp:textbox id="txtentry" runat="server" Width="68" ReadOnly="True" BorderStyle="Groove" CssClass="dropdownlist" ontextchanged="txtentry_TextChanged"></asp:textbox><asp:dropdownlist id="dropentry" runat="server" Width="45px" CssClass="dropdownlist" onchange="GetNetAmountEtaxnew()" onselectedindexchanged="Dropdownlist1_SelectedIndexChanged">
										<asp:ListItem Value="Rs" Selected="True">Rs.</asp:ListItem>
									</asp:dropdownlist></td>
								<td>&nbsp;Servo Stk. Discount&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td><asp:textbox id="txttradedisamt" runat="server" Width="99px" ReadOnly="True" BorderStyle="Groove"
										CssClass="dropdownlist"></asp:textbox><FONT color="#990066">Minus</FONT><asp:textbox onkeypress="return GetOnlyNumbers(this, event, true,true);" id="txttradeless" onblur="GetNetAmountEtaxnew()"
										runat="server" Width="28px" BorderStyle="Groove" CssClass="dropdownlist" MaxLength="6"></asp:textbox></td>
							</tr>
							<TR>
								<TD style="HEIGHT: 21px">Discount(%)</TD>
								<TD style="HEIGHT: 21px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtfixed" runat="server"
										Visible="False" Width="1px" BorderStyle="Groove" CssClass="dropdownlist"></asp:textbox><asp:textbox id="txtfixedamt" runat="server" Width="67px" ReadOnly="True" BorderStyle="Groove"
										CssClass="dropdownlist" ontextchanged="txtfixed_TextChanged"></asp:textbox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Addl. 
									Discount(%)&nbsp;&nbsp;<asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtAddDis" runat="server"
										Width="67px" BorderStyle="Groove" CssClass="dropdownlist"></asp:textbox></TD>
								<TD style="HEIGHT: 21px">&nbsp;Credit/Cash Discount</TD>
								<TD style="HEIGHT: 21px"><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtCashDisc" onblur="GetNetAmountEtaxnew()"
										runat="server" Width="40px" BorderStyle="Groove" CssClass="dropdownlist" MaxLength="5"></asp:textbox><asp:dropdownlist id="DropCashDiscType" runat="server" Width="45px" CssClass="dropdownlist" onchange="GetNetAmountEtaxnew()">
										<asp:ListItem Value="Rs">Rs.</asp:ListItem>
										<asp:ListItem Value="Per" Selected="True">%</asp:ListItem>
									</asp:dropdownlist><asp:textbox id="txtTotalCashDisc" onblur="GetNetAmountEtaxnew()" runat="server" Width="67px"
										BorderStyle="Groove" CssClass="dropdownlist" ontextchanged="txtTotalCashDisc_TextChanged"></asp:textbox></TD>
							</TR>
							<TR>
								<TD>Message</TD>
								<TD><asp:textbox id="txtMessage" runat="server" Width="246px" ReadOnly="True" BorderStyle="Groove"
										CssClass="dropdownlist"></asp:textbox></TD>
								<TD>&nbsp;Discount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
								<TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, true,true);" id="txtDisc" onblur="GetNetAmountEtaxnew()"
										runat="server" Width="40px" BorderStyle="Groove" CssClass="dropdownlist" MaxLength="6"></asp:textbox><asp:dropdownlist id="DropDiscType" runat="server" Width="45px" CssClass="dropdownlist" onchange="GetNetAmountEtaxnew()">
										<asp:ListItem Value="Rs" Selected="True">Rs.</asp:ListItem>
										<asp:ListItem Value="Per">%</asp:ListItem>
									</asp:dropdownlist><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtTotalDisc" onblur="GetNetAmountEtaxnew()"
										runat="server" Width="67px" BorderStyle="Groove" CssClass="dropdownlist"></asp:textbox></TD>
							</TR>
							<TR>
								<TD>&nbsp;Remark</TD>
								<TD><asp:textbox id="txtRemark" runat="server" Width="246px" BorderStyle="Groove" CssClass="dropdownlist"
										MaxLength="49"></asp:textbox></TD>
								<TD>&nbsp;VAT
									<asp:radiobutton id="No" onclick="return GetNetAmountEtaxnew();" runat="server" Width="39px" ToolTip="Not Applied"
										 Checked="false" GroupName="VAT"></asp:radiobutton><asp:radiobutton id="Yes" onclick="return GetNetAmountEtaxnew();" runat="server" ToolTip="Apply"
										 Checked="true" GroupName="VAT"></asp:radiobutton></TD>
								<TD><asp:textbox id="txtVAT" runat="server" Width="124px" ReadOnly="True" BorderStyle="Groove" CssClass="dropdownlist" ontextchanged="txtVAT_TextChanged"></asp:textbox></TD>
							</TR>
							<TR>
								<TD>&nbsp;Fixed Discount&nbsp;</TD>
								<TD><asp:textbox onkeypress="return GetOnlyNumbers(this, event, true,true);" id="txtfixdisc" runat="server"
										Width="40px" ReadOnly="True" BorderStyle="Groove" CssClass="dropdownlist" MaxLength="6"></asp:textbox><asp:dropdownlist id="DropFixDisType" runat="server" Width="45px" CssClass="dropdownlist" onchange="GetNetAmountEtaxnew()"
										Enabled="false">
										<asp:ListItem Value="Rs" Selected="True">Rs.</asp:ListItem>
										<asp:ListItem Value="Per">%</asp:ListItem>
									</asp:dropdownlist><asp:textbox onkeypress="return GetOnlyNumbers(this, event, false,true);" id="txtfixdiscamount"
										onblur="GetNetAmountEtaxnew()" runat="server" Width="67px" ReadOnly="True" BorderStyle="Groove" CssClass="dropdownlist"></asp:textbox></TD>
								<TD>&nbsp;Net Amount</TD>
								<TD><asp:textbox id="txtNetAmount" runat="server" Width="124px" ReadOnly="True" BorderStyle="Groove"
										CssClass="dropdownlist"></asp:textbox></TD>
							</TR>
							<!--TR>
								<TD style="HEIGHT: 2px">Entry&nbsp;By</TD>
								<TD style="WIDTH: 211px; HEIGHT: 2px"><asp:label id="lblEntryBy" runat="server"></asp:label></TD>
								<TD style="HEIGHT: 2px" align="right" colSpan="2"></TD>
							</TR-->
							<TR>
								<!--TD>Entry Date &amp; Time&nbsp;&nbsp;&nbsp;
								</TD>
								<TD style="WIDTH: 211px"><asp:label id="lblEntryTime" runat="server"></asp:label></TD-->
								<TD align="right" colSpan="4"><asp:button id="btnSave" runat="server" Width="75px" Text="Save" 
										 onclick="btnSave_Click"></asp:button>&nbsp;&nbsp;<asp:button id="btnPrint" runat="server" Width="75px"  Text="Print" CausesValidation="False"
										 onclick="btnPrint_Click"></asp:button>&nbsp;&nbsp;<asp:button onmouseup="checkDelRec()" Text="Delete"  id="btnDelete" runat="server" Width="75px" 
										  onclick="btnDelete_Click"></asp:button>&nbsp;&nbsp;<asp:button id="btnPreview" runat="server" Width="75px"  Text="Preview"
										 onclick="btnPreview_Click"></asp:button></TD>
							</TR>
						</TABLE>
					</td>
				</tr>
				<tr>
					<td><asp:validationsummary id="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False"></asp:validationsummary></td>
				</tr>
			</table>
			<iframe id="gToday:contrast:agenda.js" style="Z-INDEX: 101; LEFT: -500px; VISIBILITY: visible; POSITION: absolute; TOP: 0px"
				name="gToday:contrast:agenda.js" src="../../HeaderFooter/DTPicker/ipopeng.htm" frameBorder="0"
				width="174" scrolling="no" height="189"></iframe>
			<uc1:footer id="Footer1" runat="server"></uc1:footer></form>
	</body>
</HTML>

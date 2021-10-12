<!DOCTYPE html>
<html lang="en">

<cfparam name="action" default="">

<cfset today_date=dateformat(now(),'yyyy-mm-dd')>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="ROBOTS" CONTENT="NOFOLLOW">
<meta name="ROBOTS" CONTENT="NOINDEX">
<title>FMP</title>
<link href="stylesheet.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.foot2 {
	margin-bottom:-15px;
	color:black;
}
.foot {
	font-family:calibri;
	font-size:18px;
	color:black;
	font-weight:bold;
	letter-spacing: 1px;
	border-top:1px solid gray;
	border-bottom:1px solid gray;
}
.mail2 {
	text-decoration: none;
	color:blue;
}
</style>
</head>

<body style="background:#d4c8b2;">

<div align="center" style="margin-left:-10px;margin-top: -18px;width:101%; background:#404040; height:125px;">
	<br><br>
	<span style="color: gold; font-family:century;font-size:30px;font-weight: bold; margin-top:20px;letter-spacing: 5px;">DEBARY MARKETING, LLC.</span>
	<p>
</div>

<br><br>
<div align="center">
<img src="images/tutorial.png" style="border-radius: 10px;">
</div>

<p>
<table align="center" width=800>
<tr>
	<td  style="font-family: calibri;font-size: 22px;">
	<b>What is FMP ?</b><br>
	FMP stands for Financial Modeling Prep.  It is a company that provides financial information, including stock prices and much more, 
	for over 25000 publicly traded companies.
	<p>
	Using their API Endpoints, you can do in depth financial analysis on publicly traded companies.  That includes current stock prices, 
	historical prices, earnings history, financial statements, and so much more that you will have to go their to fully understand.
	<p>
	This is a link to their website... <a href="https://financialmodelingprep.com" target="_blank">FMP</a>
	<p>
	A key to their API is required to use the service.  A Free, Starter, Professional, and Enterprise subscription is available.
	<p>
	Go here to see.... <a href="https://financialmodelingprep.com/developer/docs/pricing" target="_blank">Pricing</a>
	<p>
	</td>
</tr>
</table>
<p>
<table align="center" width=800>
<tr>
	<td style="font-family: calibri;font-size: 22px;">
	<b>What is ColdFusion?</b><br>
	ColdFusion is a markup language used for creating websites.  If you have never heard of this, you need go no further.  The rest of what
	follows will mean nothing to you.  You must be familiar with ColdFusion for this tutorial to be meaningful.
	<p>
	<b>TUTORIAL</b><br>
	Before you can begin, you will have to have a FMP API Key.  Get this from FMP.
	<p>
	This is the CF code to use to obtain a <b>short quote</b> for a stock symbol (sym).  Insert your API Key.  
	<p>
	<img src="images/codesnip1.png" width=800>	
	<p>
	<ul>
		<li> The part of the code (line 5) after V3/ can be changed to any of the functions offered by FMP, and there are many of them.  This one is for a "short-quote".
		<p>
		<li> The line (8) that contains "DeserializeJSON" is the CF function that extracts an array-structure from the <b>"result.filecontent"</b>.
		<p>
		<li>  Setting "MyData" equal to "result.content" on line 8, makes "MyData" an array.  It can have one or many elements.  And it can have a child array name as well.
		<p>
		<li>  Test "MyData" using a "CFDump" to see if there is a child array name.  If there is, then on the last line (9), "MyData[1]" is replaced with "MyData.arrayname[1]."  Where "arrayname" is the child array name found.  Many of the functions don't have a child array name.  The [1] in "MyData[1]" is because this array only has one element.
		<p>
		<li>  If the array, "MyData" has more than one element, the total number of elements, or the array length can be obtained with  <b>"N=arraylen(MyData)"</b>.  Or if you
		are interested in a different array element,  put whatever number in the subscript as desired... "MyData[7]", etc..
		<p>
		<li>  Once you have "N", then you can loop through the data with <b>"cfloop index=x from=1 to=N"</b>
		<p>
		<li>  The structure key of interest can be specified. Instead of using <b>"price"</b> on line 9, use whatever you wish... "MyWhatever=MyData[1].whatever" in last line.   When you do a "cfdump" on "MyData" you will see the structure keys of the function that are available.
		<p>
		<li>  If you wanted to see the quarterly dividend yields for a company for the last 130 quarters, then you use the FMP "dividendYield" function, and loop thru the array elements, using "MyData[x].dividendYield" in the loop. <b>"cfloop index=x from=1 to=130"</b>.
		<p>
		<li> One last tip.  If the cfhttp result is empty, i.e.  no data found, then use an IF statement at the beginning of the code, to skip over the extraction process.  i.e... like this<p>
				cfif result.filecontent neq "[ ]"  <i>(of course use the cf tag brackets, omitted here)</i> <p> then put the above code, and add  "/cfif" tag at the end.
		This will avoid an error if the symbol can't be found or is in error.
	</ul>
	</td>
</tr>
</table>
<p>
<div align="center"><form action="index.cfm" method="post"><input type="submit" value="Home"></form></div>
<br><br>		





<div align="center"><span style="font-size:16px;color:gray;">Copyright 2021 DeBary Marketing, LLC All Rights Reserved</span></div>
<br><br>  
</body>
</html>
<!--- ///////////////// PORTFOLIO.CFM /////////////////////////    --->
<!--- This program is a demonstration on how to use FMP to         --->
<!--- get live stock prices to update the value of a stock portfolio. --->
<!--- /////////////////////////////////////////////////////////////    --->

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
<title>Portfolio</title>
<link href="stylesheet.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.title {
	font-family: serif;
	font-size: 32px;
	letter-spacing: 3px;
}
</style>
</head>

<body>

<!--- Initialize the arrays --->
<cfset symbol = ArrayNew(1)>
<cfset company = ArrayNew(1)>
<cfset shares = ArrayNew(1)>
<cfset cost = ArrayNew(1)>
<cfset price = ArrayNew(1)>

<!--- 
////////////////////////////////////////////////////////////////////////////////   
Normally the portfolio records would be kept in a MySql database table 
and a query would be used to populate the arrays. But, to keep this example 
simple, I have manually loaded the arrays, to make life simple for the GitHub.   
To keep it simple this porfolio will have just five positions.  All but the PRICE 
will be manually loaded.   We'll use FMP to get the stock prices.
/////////////////////////////////////////////////////////////////////////////////   
--->

<cfset symbol[1]="IBM">      <cfset company[1]="IBM Corp">
<cfset symbol[2]="F">           <cfset company[2]="Ford">
<cfset symbol[3]="GE">        <cfset company[3]="General Electric">
<cfset symbol[4]="T">           <cfset company[4]="AT&T">
<cfset symbol[5]="C">           <cfset company[5]="City Group">

<cfset shares[1]=100>           <cfset cost[1]=118.70>
<cfset shares[2]=500>            <cfset cost[2]=7.50>
<cfset shares[3]=200>           <cfset cost[3]=47.10>
<cfset shares[4]=300>           <cfset cost[4]=25.80>
<cfset shares[5]=200>           <cfset cost[5]=41.50>

<br><br>
<div align="center" class="title">Example Portfolio with FMP Pricing</div>

<table align="center" cellpadding="2" cellspacing="2" width=800>
<tr bgcolor="silver">
	<td align="center"><b>Symbol</b></td>
	<td align="left"><b>Company</b></td>
	<td align="center"><b>Shares</b></td>
	<td align="center"><b>Cost</b></td>
	<td align="center"><b>Price</b></td>
	<td align="center"><b>$ Cost</b></td>
	<td align="center"><b>$ Value</b></td>
	<td align="center"><b>Gain</b></td>
	<td align="center"><b>%Gain</b></td>
</tr>

<!--- initialize grand totals --->
<cfset gtot_cost=0>
<cfset gtot_val=0>
<cfset gtot_gain=0>

<cfoutput>
<cfloop index="x" from=1 to=5>

	<!--- get the price --->
	<cfset sym=symbol[x]>
	<cfinclude template="get_price.cfm">  <!--- this returns "theprice" --->

	<!--- do some calculations --->
	<cfset totcost=shares[x] * cost[x]>
	<cfset totprice=shares[x] * theprice>
	<cfset gain=totprice-totcost>
	<cfset pgain=100*gain/totcost>


	<tr bgcolor="ededed">
		<td align="center">#symbol[x]#</td>
		<td align="left">#company[x]#</td>
		<td align="right">#shares[x]#</td>

		<!--- display cost and price per share --->
		<td align="right">#cost[x]#</td>
		<td align="right">#numberformat(theprice,'______.__')#</td>

		<!--- display total cost and today's value --->
		<td align="right">#numberformat(totcost,'______.__')#</td>
		<td align="right">#numberformat(totprice,'______.__')#</td>

		<!--- display gain --->
		<cfif gain LT 0>	<td align="right" style="color:red;">#numberformat(gain,'_______.__')#</td></cfif>
		<cfif gain GTE 0>	<td align="right" style="color:green;">#numberformat(gain,'_______.__')#</td></cfif>

		<!--- display percent gain --->
		<cfif gain LT 0>	<td align="right" style="color:red;">#numberformat(pgain,'___._')#%</td></cfif>
		<cfif gain GTE 0>	<td align="right" style="color:green;">#numberformat(pgain,'___._')#%</td></cfif>

		<!--- grand totals --->
		<cfset gtot_cost=gtot_cost+totcost>
		<cfset gtot_val=gtot_val+totprice>
		<cfset gtot_gain=gtot_gain+gain>

	</tr>
</cfloop>
</cfoutput>

<!--- add last row to show the grand totals --->
<cfoutput>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td align="right"><b>#numberformat(gtot_cost,'_,___,___.__')#</b></td>
	<td align="right"><b>#numberformat(gtot_val,'_,___,___.__')#</b></td>
	<td align="right"><b>#numberformat(gtot_gain,'_,___,___.__')#</b></td>
	<cfset the_pgain=100*gtot_gain/gtot_cost>
	<td align="right"><b>#numberformat(the_pgain,'___._')#%</b></td>
</tr>
</cfoutput>
</table> 

</body>
</html>
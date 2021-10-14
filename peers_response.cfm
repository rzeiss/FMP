<!DOCTYPE html>
<html lang="en">

<cfset today_date=dateformat(now(),'yyyy-mm-dd')>
<cfparam name="sym" default="GM">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="ROBOTS" CONTENT="NOFOLLOW">
<meta name="ROBOTS" CONTENT="NOINDEX">
<title>Response</title>
<link href="stylesheet.css" rel="stylesheet" type="text/css" />
<style type="text/css"></style>
</head>

<body bgcolor="lightgray">
<br><br><br>

<cfhttp 
result="result" 
method="GET" 
charset="utf-8" 
url="https://financialmodelingprep.com/api/v4/stock_peers?symbol=#sym#&apikey=795614daf5698f32ac1f42ca114a50e2">
<cfhttpparam name="q" type="url" value="cfml">
</cfhttp>

<cfset mydata = deserializeJSON(result.filecontent)>	

<!--- ////////////////////////////////////////////////////////////////////////////////////////////
For a STOCK PEERS request, FMP returns two arrays, "MyData" and "MyData[1].PeersList".
MyData only has one element, a structure that contains a child array.
MyData.PeersList is the child array containing the list of  Stock Peers  for General Motors (GM).
///////////////////////////////////////////////////////////////////////////////////////////////// --->

<div align="center"><h2>EXPLORING A STOCK PEERS REQUEST FOR GM</h2></div>
<p>
<table align="center">
<tr>
	<td valign="bottom" align="center"><cfdump var="#myData#"><br>
	MyData</td>
	<td width=100></td>
	<td valign="bottom" align="center"><cfdump var="#mydata[1].peersList#"><br>
	MyData.PeersList</td>
</tr>
</table>
<p>
<div align="center"><img src="images/the_http.png"></div>

<!--- ////////////////////////////////////////////////////////////////////////////////////////////
MyData.PeersList contains 10 elements.   They can be viewed by looping thru the array.

<cfset L=arraylen(mydata[1].peersList)>
<cfloop index="x" from=1 to=#L#>
	<cfoutput>#myData[1].peersList[x]# </cfoutput><br>
</cfloop>
//////////////////////////////////////////////////////////////////////////////////////////////// --->
   
</body>
</html>



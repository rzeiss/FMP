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

<body>
<br><br><br>

<cfhttp 
result="result" 
method="GET" 
charset="utf-8" 
url="https://financialmodelingprep.com/api/v4/stock_peers?symbol=#sym#&apikey=PutYourAPIKeyHere">
<cfhttpparam name="q" type="url" value="cfml">
</cfhttp>

<cfset mydata = deserializeJSON(result.filecontent)>	

<!--- ////////////////////////////////////////////////////////////////////////////////////////////
For a STOCK PEERS request, FMP returns two arrays, "MyData" and "MyData[1].PeersList".
MyData only has one element, a structure that contains a child array.
MyData.PeersList is the child array containing the list of  Stock Peers  for General Motors (GM).
///////////////////////////////////////////////////////////////////////////////////////////////// --->

<table align="center">
<tr>
	<td><cfdump var="#myData#"></td>
	<td width=100></td>
	<td><cfdump var="#mydata[1].peersList#"></td>
</tr>
</table>

<!--- ////////////////////////////////////////////////////////////////////////////////////////////
MyData.PeersList contains 10 elements.   They can be viewed by looping thru the array.
<cfset L=arraylen(mydata[1].peersList)>
<cfloop index="x" from=1 to=#L#>
	<cfoutput>#myData[1].peersList[x]# </cfoutput><br>
</cfloop>
//////////////////////////////////////////////////////////////////////////////////////////////// --->
   
</body>
</html>



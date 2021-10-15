<cfparam name="sym" default="GM">
<cfhttp 
result="result" 
method="GET" 
charset="utf-8" 
url="https://financialmodelingprep.com/api/v4/stock_peers?symbol=#sym#&apikey=PutYourAPIKeyHere">
<cfhttpparam name="q" type="url" value="cfml">
</cfhttp>
<cfset mydata = deserializeJSON(result.filecontent)>
<cfdump var="#myData#">

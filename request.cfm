<cfparam name="sym" default="GM">
<cfhttp 
result="result" 
method="GET" 
charset="utf-8" 
url="https://financialmodelingprep.com/api/v4/stock_peers?symbol=#sym#&apikey=795614daf5698f32ac1f42ca114a50e2">
<cfhttpparam name="q" type="url" value="cfml">
</cfhttp>
<cfset mydata = deserializeJSON(result.filecontent)>
<cfdump var="#myData#">
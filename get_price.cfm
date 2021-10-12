<!--- /////////////////////////////////  get_price.cfm  //////////////////////////////// --->
<!--- THIS IS AN INCLUDE THAT RETURNS A SHORT-QUOTE STOCK PRICE - SYM MUST BE PASSED IN --->
<!--- THE VARIABLE "THEPRICE" WILL BE RETURNED --->
<!--- ////////////////////////////////////////////////////////////////////////////////// --->
<cfparam name="sym" default="">
<cfset theprice=0>

<cfif sym neq "">
	<cfhttp 
	result="result" 
	method="GET" 
	charset="utf-8" 
	url="https://financialmodelingprep.com/api/v3/quote-short/#sym#?apikey=PutYourAPIKeyHere">
	<cfhttpparam name="q" type="url" value="cfml">
	</cfhttp>

	<cfif result.filecontent neq "[ ]">
		<p>
		<cfset mydata = deserializeJSON(result.filecontent)>	
		<cfset theprice=mydata[1].price>
		<cfset theprice=100*theprice>         
		<cfset theprice=(round(theprice)/100)>
	</cfif>	
	
</cfif>



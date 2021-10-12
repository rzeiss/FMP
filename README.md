<b>COLDFUSION FMP TUTORIAL</b>
<p>
FMP (Financial Modeling Prep) provides access to over 20,000 publicly traded companies.<br>
The objective of this project is to demonstrate how to use the FMP data in a Coldfusion environment to retrieve stock prices, earnings reports, financial statements, and much more.
<p>
I'll explain how to do it, and offer some CF code examples that can easily be implemented by anyone that is familiar with Coldfusion.  Of course to run the CF code will require a ColdFusion Server.
<p>
  The first example is named.. <b>get_price.cfm</b>.  It will retrieve a SHORT QUOTE from FMP.  It returns "theprice" given a stock symbol (SYM).  It is designed to be an "include" in a higher level program.  I will also discuss the higher level program.

<img src="/images/tutorial.png">
<p> 
<h2>COLDFUSION FMP TUTORIAL</h2>
<p>
If you are intested in the stock market, and want to do some FINANCIAL MODELING, then <a href="https://financialmodelingprep.com/developer/docs" target=:_blank">
  FMP</a> will provide all the data you will ever need. It is a great resource that can be used with many web programming languages.  This is about how to use FMP with Coldfusion.
<p>
FMP (Financial Modeling Prep) provides access to over 20,000 publicly traded companies.<br>
The objective of this project is to demonstrate how to use the FMP data in a Coldfusion environment to retrieve stock prices, earnings reports, financial statements, and much more.
<p>
I'll explain how to do it, and offer some CF code examples that can easily be implemented by anyone that is familiar with Coldfusion.  Of course to run the CF code will require a ColdFusion Server.
<p>
  The first example is named.. <b>get_price.cfm</b>.  It will retrieve a SHORT QUOTE from FMP.  It returns "theprice" given a stock symbol (SYM).  It is designed to be an "include" in a higher level program.  I will also discuss the higher level program.
<p>
If you wish to explore what can be done with <b>FMP</b>, then visit their documentation page..
<br>  
https://financialmodelingprep.com/developer/docs
<p>
There are hundreds of functions available to retrieve financial data on American and foreign companies.  Once you capture the data it can be used for examining what has happened in the past, or even what may happen in the future, if your model is capable of such a prediction.
<p>
  <h2>PORTFOLIO EXAMPLE</h2>
<p>
In the file list you will find code for a Coldfusion program called <b>"Portfolio.cfm"</b>.  This is just a simple example of how to use the <b>"get_price.cfm"</b> program as an include or subroutine to fetch a stock price from <b>FMP</b>.
<p>
The Porfolio program noramlly would pull data (symbol, company, shares, and cost per share) from a database connected to the portfolio program.  But, for the sake of simplicity I have manually filled arrays for each of the portfolio fields, EXCEPT for the PRICE.  The PRICE will be obtained on the fly from FMP, so that it is the current price.  Thus the output from the portfolio program will reflect current prices and gains.
<p>
  If you copy and paste the <b>portfolio</b> and the <b>get_price</b> programs into your editor and upload them to a Coldfusion server, this is the output to expect.
<p>
<img src="/images/theportfolio.png" width="600">
<p>
As the program loops thru the stocks pre loaded in the arrays, it runs the included program <b>GET_PRICE.CFM</B> on line 87.  This goes out to FMP and executes a SHORT-QUOTE function that returns a variable named <b>"theprice"</b>.  Then <b>"theprice"</b> is used to calculate gain and percent gain, as well as the grand totals.
<p>
It's easy, and it's fast.
<p>
<h2>The FMP Response</h2>
<p>
<b><u>CFHTTP</u></b> - To get a respose from the FMP server, a request has to be sent to it first.  In Coldfusion the tag that sends HTTP request to a URL is the <b>CFHTTP</b> tag.
It Generates an HTTP request and parses the response from the server.  It returns a structure containing these keys...
<ul>
<li> statusCode: The HTTP response code and reason string.
<li> fileContent: The body of the HTTP response. Usually an array.
<li> responseHeader: A structure of response headers.
<li> errorDetail: An error message if applicable.
<li> mimeType: The mime type returned in the Content-Type response header.
<li> text: a boolean indicating if the response body is text or binary.
<li> charset: The character set returned in the Content-Type header.
<li> header: All the http response headers as a single string.
</ul>
<p>
<b><u>FILE CONTENT</u></b> - Assuming there are no errors in this exchange, the part of the HTTP request we are interested in is the <b>FILE CONTENT</b>.  The File Content will contain an array that contains a structure.  In some cases the structure may contain another array or a "child" array.
<p>

 

  

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
The first example is named.. <b>get_price.cfm</b>.  It will retrieve a SHORT QUOTE from FMP.  It returns "theprice" given a stock symbol (SYM).  It is designed to be an "include" in a higher level program.  I will also discuss the higher level program, "portfolio.cfm".
<p>
If you wish to explore what can be done with <b>FMP</b>, then visit their documentation page..
<br>  
https://financialmodelingprep.com/developer/docs
<p>
There are hundreds of functions, endpoints, available to retrieve financial data on American and foreign companies.  Once you capture the data it can be used for examining what has happened in the past, or even what may happen in the future, if your model is capable of such a prediction.
<p>
  <h2>PORTFOLIO EXAMPLE</h2>
<p>
In the file list you will find code for a Coldfusion program called <b>"Portfolio.cfm"</b>.  This is just a simple example of how to use the <b>"get_price.cfm"</b> program as an include or subroutine to fetch a stock price from <b>FMP</b>.
<p>
The Porfolio program noramlly would pull data (symbol, company, shares, and cost per share) from a database connected to the portfolio program.  But, for the sake of simplicity I have manually filled arrays for each of the portfolio fields, EXCEPT for the PRICE.  The PRICE will be obtained on the fly from FMP, so that it is the current price.  Thus the output from the portfolio program will reflect current prices and gains.
<p>
If you copy and paste the <b>portfolio</b> and the <b>get_price</b> programs into your editor and upload them to a Coldfusion server, this is the output to expect.  The source code for the Portfolio.cfm program is contained in the file list. Examine it so you know how it works.
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
<li> <b>fileContent</b>: The body of the HTTP response. Usually an array.
<li> responseHeader: A structure of response headers.
<li> errorDetail: An error message if applicable.
<li> mimeType: The mime type returned in the Content-Type response header.
<li> text: a boolean indicating if the response body is text or binary.
<li> charset: The character set returned in the Content-Type header.
<li> header: All the http response headers as a single string.
</ul>
<p>
<b><u>FILE CONTENT</u></b> - Assuming there are no errors in this exchange, the part of the HTTP response we are interested in is the <b>FILE CONTENT</b>.  The File Content will contain an array that contains a structure.  In some cases the structure may contain another array or a "child" array.
<p>
<table cellspacing="50"><tr>
  <td valign="bottom" align="center"><img src="/images/one-array.png"><br>Single Array</td>
  <td> </td>
  <td valign="bottom" align="center"><img src="/images/twoarray.png"><br>Two Arrays</td>
  <td> </td>
  <td valign="bottom" align="center"><img src="/images/childarray.png"><br>Child Array</td>
  <td> </td>
  <td valign="bottom" align="center"><img src="/images/child-structure.png"><br>Child Structure</td>
  </tr></table>
<p>
These are the types of arrays returned.  Some arrays have just one element [1], like the Single Array above. Others may have several or hundreds of Array elements.
The Two Arrays shown above contains another structure (peerslist) that has a child array inside of it.  We can access all the data in these arrays.
<p>
<b><u>MAKING A REQUEST</u></b> - Use the code shown below (request.cfm).  This happens to be a STOCK PEERS request for General Motors (GM).  <i>The response returned was the "Two Arrays" shown above.</i>
<p>
<img src="/images/request.png" width="600">
<p>
Let's discuss the above code. (request.cfm is in the file list)
<ul>
<li> Line 2 is the beginning of the CFHTTP request.
<li> On Line 3, <b>Result</b> will contain whatever FMP returns as a response.
<li> On Line 6, don't forget to put in your own API Key.
<li> On Line 9, the Coldfusion function.. <b>DeSerializeJSON</b>, does it's magic and converts the JSON response in to an array with structures.
<li> Also on Line 9, the <b>Result.FileContent</b> variable contains the array that has been returned in the response for the <b>FileContent</b> structure key.
<li> On Line 10, the CFDUMP function, displays the MyData array and it's structures and child arrays, if it has any.
<li> Of course the URL, on Line 6, for the CFHTTP will change for different FMP requests, like STOCK QUOTE, Earnings, Dividends, etc.
</ul>
<p>  
<b><u>RESPONSE EXPLORATION</u></b> - Because none of us have probably tried all of the FMP functions, we really don't know what we are going to get back as a response.
So, we have to "Explore" a bit, before we can write the code we need to capture or display the data that is returned from FMP.
<p>
We do this by running the "request.cfm" program that is discussed above (or you can run "response.cfm").  We want to see what the CFDUMP shows us. Is there a child array? Does the main array have multiple elements.. 1, 2, 3,... ?, what are the names of the structure keys we are interested in using, and what is the name of the child array, if there is one.  All good questions, that we must EXPLORE before we can write our final code.  <i>The code for exploring the STOCK PEERS response for GM is in the file list... <b>peers_response.cfm</b></i>
<p>
<b><u>GETTING A STOCK QUOTE</u></b> - THE center portion of the URL for a STOCK QUOTE is /api/v3/quote-short/#sym#.   The response from FMP for General Motors (GM) is..
<p>
<img src="/images/one-array.png">
<p>
We get back an array with one element and a structure containing the Price, Volume, and Symbol.  We can refer to each of them in parent-child notation.
<p>
Price is mydata[1].price,  volume is mydata[1].volume, and the symbol is mydata[1].symbol.  In the "get_price.cfm" program, I set "theprice" equal to mydata[1].price.  Then it s available in Coldfusion for doing calculations or just displaying it on the screen.  (See portfolio.cfm for how to use the get_price.cfm program.)
<p>
In the case of the STOCK PEERS response, the stock symbols for the Peers are... mydata[1].peerlist[x] where x goes from 1 to 10.  So once the FMP response is explored, and you know what it will return, then the data from FMP can be used for financial analysis and modeling.  There is so much data available that there is no limit on what can be done.
<p>
In the case where the response contains a CHILD STRUCTURE, as shown above, the code to capture the data is a little different.  For example, if you want to get the CLOSE price from the Child Structure, then use this... <b>mydata.historical[1].close</b>.  The name of the child structure was returned as "historical".  This will return a value of 56.89. This request was for "Historical Daily Prices with Change and Volume Interval" as specified in the FMP API documentation.  But I only wanted the close price for 10/18/2020, so I only put in one date.  Using the Coldfusion DateAdd function, you can go back to any date you wish.
<p>
FMP Rocks!! and ColdFusion makes it easy to obtain the data and manipulate it as desired.
<p>
                                                      /////////////////////////  END ////////////////////////
 


  

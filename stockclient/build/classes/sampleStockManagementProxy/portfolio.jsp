<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@ page import ="com.interoperability.users.User" %>
<jsp:useBean id="sampleUserManagementServiceProxyid" scope="session" class="com.interoperability.users.UserManagementServiceProxy" /> 
<jsp:useBean id="com1interoperability1users1Stock_7id" scope="session" class="com.interoperability.users.Stock" />
<jsp:useBean id="sampleStockManagementProxyid" scope="session" class="com.interoperability.stocks.StockManagementProxy" />
<%@ page import="com.interoperability.stocks.Stock"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>



<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />

	<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $('#stocks').DataTable();
} );

</script>
</head>



<body style="width: 100% , overflow-x: hidden" >
<form method="post" name="form1" >
<table id="stocks" class="display" style="width: 80%">
		<thead>
			<tr>
			    <th>SYMBOL</th>
				<th>SECURITY</th>
				<th>PREV_CL_PR</th>
				<th>OPEN_PRICE</th>
				<th>HIGH_PRICE</th>
				<th>CLOSE_PRICE</th>
				<th>NET_TRDVAL</th>
				<th>NET_TRDQTY</th>
				<th>HI_52_WK</th>
				<th>LO_52_WK</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>

<%




String symbol = request.getParameter("stockv");

String stockId = request.getParameter("stockx");


out.println("username"+ session.getAttribute("username"));



out.println("Stock Symbole ..... "+ symbol);

out.println("Stock ID ..... "+ stockId);

Stock stock = sampleStockManagementProxyid.getStock(symbol);

Set<Stock> stocks = new HashSet();
stocks.add(stock);



for(Stock c : stocks){ 
%>
	
	<tr>			  
		        <td><%=c.getSymbol()%></td>
				<td><%=c.getSecurity()%></td>
				<td><%=c.getPreviousClosePrice()%></td>
				<td><%=c.getOpenPrice()%></td>
				<td><%=c.getHighPrice()%></td>
				<td><%=c.getClosePrice()%></td>
				<td><%=c.getNetTradeVaule()%></td>
				<td><%=c.getNetTradeQuantity()%></td>
				<td><%=c.getHigh52Week()%></td>
				<td><%=c.getLow52Week()%></td>
				<td><input type="submit" name="button1" value="add" onclick="javascript:openPopUp('<%=c.getSecurity()%>', '<%=c.getId()%>')"/>							    
				</td>				  
			</tr>		
<%} %>

	
		</tbody>
	</table>
	</center>
	</form>

</body>
</html>
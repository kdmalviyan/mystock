<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
    
    
            <table border="1" width="80%" cellpadding="5">
             <tr>

<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
You are not logged in<br/>
<a href="home.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("username")%>
<a href='logout.jsp'>Log out</a>
</tr>
<tr>
</tr>
<tr>
<a href="portfolio.jsp">Portfolio</a>
</tr>
<tr>
<jsp:include page="stockList.jsp" />
  <%  }%>
</tr>
 </table>
           
    </body>
</html>
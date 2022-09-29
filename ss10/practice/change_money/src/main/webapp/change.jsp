<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 29/09/2022
  Time: 08:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chang to Money</title>
</head>
<body>
<%
    float rate = Float.parseFloat(request.getParameter("Rate"));
    float usd = Float.parseFloat(request.getParameter("USD"));
    float vnd = rate * usd;
%>
<h1>Rate: <%=rate%>
</h1>
<h1>USD: <%=usd%>
</h1>
<h1>VND: <%=vnd%>
</h1>
</body>
</html>

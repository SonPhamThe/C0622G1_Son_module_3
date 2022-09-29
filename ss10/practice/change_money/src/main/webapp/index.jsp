<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 29/09/2022
  Time: 08:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Change to Money</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
  <form method="post" action="/change.jsp">
    <label>Rate:</label> <br>
    <input type="number" name="Rate" placeholder="Enter value here">
    <label>USD:</label>
    <input type="number" name="USD" placeholder="Money after to change:">
    <input type="submit" id="submit">
  </form>
  </body>
</html>

<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 29/09/2022
  Time: 09:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vietnamese Dictionary</title>
</head>
<body>
<%
    Map<String, String> dictionary = new HashMap<>();
%>
<%
    dictionary.put("hello", "Xin chào");
    dictionary.put("how", "Thế nào");
    dictionary.put("book", "Quyển vở");
    dictionary.put("computer", "Máy tính");

    String search = request.getParameter("word");

    String result = dictionary.get(search);

    PrintWriter writer = response.getWriter();
    writer.println("<html>");

    if (result != null) {
        writer.println("word:" + search);
        writer.println("Result:" + result);
    } else {
        writer.println("Not Found");
    }

    writer.println("</html>");
%>
</body>
</html>

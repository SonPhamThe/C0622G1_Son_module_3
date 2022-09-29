<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 29/09/2022
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Simple Calculator</title>
    <style>
    </style>
</head>
<body>
<h1>Simple Calculator</h1>

<form action="/cal" method="post">
    <fieldset>
        <legend>Calculator</legend>

        <div class="calculator">
            <label>First operand:</label>
            <input type="number" name="first__operand" placeholder="Enter value">
        </div>
        <br>

        <div>
            <label>Operator:</label>
            <select name="operator" id="operator">
                <option value="add">addition</option>
                <option value="div">division</option>
                <option value="sum">summation</option>
                <option value="sub">subtraction</option>
            </select>
        </div>
        <br>

        <div>
            <label>Second operand:</label>
            <input type="number" name="second__operand" placeholder="Enter value">
        </div>
        <br> <br>

        <input type="submit" value="Calculate">
        
    </fieldset>
</form>
<p>${result}</p>
</body>
</html>

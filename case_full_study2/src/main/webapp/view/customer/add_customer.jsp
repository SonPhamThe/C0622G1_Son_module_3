<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 05/10/2022
  Time: 00:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>The FURAMA Resort</title>
</head>
<body>
<div style="text-align: center;">
    <h1>Form ADD Customer</h1>
</div>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <tr>
                <th>Customer Type ID:</th>
                <td>
                    <input type="text" name="customer_type_id" id="customer_type_id" size="45"
                           value='${customer.customer_type_id}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageNameError!=null}">
                            ${messageNameError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Name Customer:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"
                           value='${customer.name}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageEmailError!=null}">
                            ${messageEmailError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Date Of Birth Customer:</th>
                <td>
                    <input type="text" name="date_of_birth" id="date_of_birth" size="45"
                           value='${customer.date_of_birth}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageEmailError!=null}">
                            ${messageEmailError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Gender Customer:</th>
                <td>
                    <input type="text" name="gender" id="gender" size="45"
                           value='${customer.gender}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageEmailError!=null}">
                            ${messageEmailError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>ID Card Employee:</th>
                <td>
                    <input type="text" name="id_card" id="id_card" size="45" value='${customer.id_card}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Phone Number:</th>
                <td>
                    <input type="text" name="phone_number" id="phone_number" size="45"
                           value='${customer.phone_number}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Email Employee:</th>
                <td>
                    <input type="text" name="email" id="email" size="45"
                           value='${customer.email}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Address Employee:</th>
                <td>
                    <input type="text" name="address" id="address" size="45"
                           value='${customer.address}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<p style="text-align: center">
    <span style="color:blue">
        <c:if test="${messageSuccess!=null}">
            ${messageSuccess}
        </c:if>
    </span>
</p>
</body>
</html>
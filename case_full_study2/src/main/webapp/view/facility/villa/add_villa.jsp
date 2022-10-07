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
    <h1>Form ADD Villa</h1>
</div>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <tr>
                <th>Name Villa:</th>
                <td>
                    <input type="text" name="name" id="name" size="45" value='${villa.name}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageNameError!=null}">
                            ${messageNameError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Area Villa:</th>
                <td>
                    <input type="text" name="area" id="area" size="45" value='${villa.area}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageEmailError!=null}">
                            ${messageEmailError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Cost Villa:</th>
                <td>
                    <input type="text" name="cost" id="cost" size="45" value='${villa.cost}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Max people:</th>
                <td>
                    <input type="text" name="max_people" id="max_people" size="45" value='${villa.max_people}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Rent type:</th>
                <td>
                    <input type="text" name="rent_type" id="rent_type" size="45" value='${villa.cost}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Standard Room:</th>
                <td>
                    <input type="text" name="standard_room" id="standard_room" size="45"
                           value='${villa.standard_room}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Description Other Convenience:</th>
                <td>
                    <input type="text" name="description_other_convenience" id="description_other_convenience" size="45"
                           value='${villa.description_other_convenience}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Pool Area:</th>
                <td>
                    <input type="text" name="pool_area" id="pool_area" size="45" value='${villa.pool_area}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Number Of Floors:</th>
                <td>
                    <input type="text" name="number_of_floors" id="number_of_floors" size="45"
                           value='${villa.number_of_floors}'/>
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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>The Furama Resort</title>
</head>
<body>
<center>
    <h2>Edit Employee</h2>
    <form method="post">
        <table border="1px">
            <input type="hidden" name="id" value="${editEmployee.id}">
            <tr>
                <td>
                    <pre>Name:</pre>
                </td>
                <td><input type="text" name="name" value="${editEmployee.name}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Birthday:</pre>
                </td>
                <td><input type="date" name="date_of_birth" value="${editEmployee.date_of_birth}"></td>
            </tr>
            </tr>
            <tr>
                <td>
                    <pre>ID Card:  </pre>
                </td>
                <td><input type="text" name="id_card" value="${editEmployee.id_card}"></td>
            </tr>
            </tr>
            <tr>
                <td>
                    <pre>Salary:  </pre>
                </td>
                <td><input type="text" name="salary" value="${editEmployee.salary}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Phone Number:</pre>
                </td>
                <td><input type="text" name="phone_number" value="${editEmployee.phone_number}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Email:</pre>
                </td>
                <td><input type="text" name="email" value="${editEmployee.email}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Address:</pre>
                </td>
                <td><input type="text" name="address" value="${editEmployee.address}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Position:</pre>
                </td>
                <td>
                    <select name="position_id">
                        <option value="1">Lễ Tân</option>
                        <option value="2">Phục Vụ</option>
                        <option value="3">Chuyên Viên</option>
                        <option value="4">Giám sát</option>
                        <option value="5">Quản lí</option>
                        <option value="6">Giám Đốc</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <pre>Education:</pre>
                </td>
                <td><select name="education_degree_id">
                    <option value="1">Trung Cấp</option>
                    <option value="2">Cao Đẳng</option>
                    <option value="3">Đại Học</option>
                    <option value="4">Sau Đại Học</option>
                </select></td>
            </tr>

            <tr>
                <td>
                    <pre>Division:</pre>
                </td>
                <td><select name="division_id">
                    <option value="1">Sale-Marketing</option>
                    <option value="2">Hành chính</option>
                    <option value="3">Phục vụ</option>
                    <option value="4">Quản lý</option>
                </select></td>
            </tr>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <pre>Username:</pre>--%>
<%--                </td>--%>
<%--                <td><input type="text" name="username" value="${editEmployee.username}"></td>--%>
<%--            </tr>--%>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"/></td>
            </tr>
        </table>
    </form>
    <a href="/employees?action=listEmployee">
        <button type="button">Back List Employees</button>
    </a>
</center>
</body>
</html>

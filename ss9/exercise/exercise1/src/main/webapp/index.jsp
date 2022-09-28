<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 26/09/2022
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>

<form action="/display" method="post">
    <label>
        <input placeholder="Product Description:" type="text" name="product_description">
    </label>
    <label>
        <input placeholder="List Price" type="text" name="list_price">
    </label>
    <label>
        <input placeholder="Discount Percent" type="text" name="discount_percent">
    </label>
    <input type="submit" id="submit" value="Tính toán">
</form>

<h1> Mô tả sản phẩm: ${productDescription}</h1>
<h1> Giá niêm yết của sản phẩm: ${listPrice}</h1>
<h1> Tỷ lệ chiết khấu (phần trăm): ${discountPercent}</h1>
<h1> Lượng chiết khâu: ${discountAmount}</h1>
<h1> giá sau khi chiết khấu: ${discountPrice}</h1>

</body>
</html>

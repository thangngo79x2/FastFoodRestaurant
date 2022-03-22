<%--
  Created by IntelliJ IDEA.
  User: PV
  Date: 3/11/2022
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Receipt</title>
    <style type="text/css">
        table { border: 0; }
        table td { padding: 5px; }
    </style>
</head>
<body>
<div align="center">
    <h1>Payment is made. Thank you for purchasing our products!</h1>
    <br/>
    <h2>Receipt details:</h2>
    <table>
        <tr>
            <td><b>Merchant:</b></td>
            <td> CHiKeN Co Ltd.</td>
        </tr>
        <tr>
            <td><b>Payer:</b></td>
            <td>${payer.firstName} ${payer.lastName}</td>
        </tr>

        <tr>
            <td><b>Total:</b></td>
            <td>${transaction.amount.total} VND</td>
        </tr>
    </table>
</div>
</body>
</html>


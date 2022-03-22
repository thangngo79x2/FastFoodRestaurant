<%--
  Created by IntelliJ IDEA.
  User: PV
  Date: 3/11/2022
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="header.jsp" %>
<%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Out</title>
    <style type="text/css">
        table { border: 0; }
        table td { padding: 10px; }
    </style>
</head>
<body>
<div align="center">
    <br>
    <br>
    <br>
    <br/>
    <form action="authorize_payment" method="post">
        <legend>Confirm the amount to be paid</legend>
        <table>
            <tr>
                <td>Amount of money:</td>
                <td><input class="form-control" type="text" readonly name="total" value="${cart.getFinalTotalFormat()}" /></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" class="btn btn-outline-warning"value="Confirm" />
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/vendor/purecounter/purecounter.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/waypoints/noframework.waypoints.js"></script>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/login.js"></script>

</html>


<%--
  Created by IntelliJ IDEA.
  User: PV
  Date: 3/11/2022
  Time: 9:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="admin-header.jsp" %>


<main>
  <br>
<h1 class="text-center">Feedback!</h1>
<div class="container">
  <table class="table">
    <thead>
    <tr>
      <th scope="col">Email</th>
      <th scope="col">Name</th>
      <th scope="col">Subject</th>
      <th scope="col">Feedback</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="crr" items="${feedbackList}">

      <tr>
        <td>${crr.email}</td>
        <td>${crr.name}</td>
        <td>${crr.subject}</td>
        <td>${crr.message}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</main>
<%@include file="admin-footer.jsp" %>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="jsp-header.jsp" %>
<main class="login-box">
    <div class="contain">
        <div class="login-form">
            <form action="infor" method="post">
                <h1>Edit information</h1>
                <div class="input-box ">
                    <i>Fullname : </i>
                    <input type="text" placeholder="Enter name" name="name" id="update-name" value="${user.getName()}">

                </div>
                <div class="input-box ">
                    <i>Email :</i>
                    <input type="email" placeholder="Enter email" name="email" id="update-email" value="${user.getMail()}">

                </div>
                <div class="input-box">
                    <i>Shipment Details :</i>
                    <p style="text-align: left;">Recipient's name: ${address.getAddressName()}</p>
                    <p style="text-align: left;">Recipient's phone number: ${address.getPhone()}</p>
                    <p style="text-align: left;">Address: ${address.fullAddress()}</p>

                </div>
                <div class="login-box">
                    <h2>Sign in with another account: </h2>
                    <input type="hidden" name="action" value="update">

<%--                    facebook--%>
                    <c:choose>
                        <c:when test="${customer.getFbId() == null}">
                            <a href="https://www.facebook.com/dialog/oauth?client_id=606938923966761&redirect_uri=https://group6project.herokuapp.com/fb-login" class="social-button" id="facebook-connect"> <span>Connect with Facebook</span></a>
                        </c:when>
                        <c:when test="${customer.getFbId() != null}">
                            <a href="fb-login?action=remove" class="social-button" id="facebook-connect"> <span>Remove with Facebook</span></a>
                        </c:when>
                    </c:choose>
                    <%--                    google--%>
                    <c:choose>
                        <c:when test="${customer.getGgId() == null}">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=https://group6project.herokuapp.com/gg-login&response_type=code&client_id=1020369265111-u30b21k5ghkap6g6bh666r6j3q1qhvni.apps.googleusercontent.com&approval_prompt=force" class="social-button" id="google-connect"> <span>Connect with Google</span></a>
                        </c:when>
                        <c:when test="${customer.getGgId() != null}">
                            <a href="gg-login?action=remove" class="social-button" id="google-connect"> <span>Remove with Google</span></a>
                        </c:when>
                    </c:choose>


                </div>

                <a href="re-passwd" style="float:left;">Change Password ?</a><br>
                <a href="address?state=infor" style="float:left;">Change delivery information ?</a>
                <br> <p class="text-danger" style="float:left;"> ${status}</p>
                <a href="confirmemail.html " style="color: #FFF9E5; ">
                    <div class="btn-box ">
                        <button type="submit ">
                            Update
                        </button>
                    </div>
                </a>
            </form>
        </div>
    </div>
</main>
<%@include file="jsp-footer.jsp" %>
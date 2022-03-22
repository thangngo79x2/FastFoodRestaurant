
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="jsp-header.jsp" %>
<main class="login-box">
    <div class="container">
        <div class="login-form">
            <form action="re-passwd" method="post">
                <h1>Sign In</h1>
                <input type="hidden" name="action" value="update">

                <div class="input-box">
                    <i></i>
                    <input type="password" placeholder="Enter old password" name="oldPasswd">
                </div>
                <div class="input-box">
                    <i></i>
                    <input type="password" placeholder="Enter new password" name="newPasswd">
                </div>
                <div class="input-box">
                    <i></i>
                    <input type="password" placeholder="Confirm" name="checkPasswd">
                </div>

                <p class="text-danger">${status}</p>

                <div class="btn-box">
                    <button type="submit">
                        Update
                    </button>
                </div>

            </form>
        </div>
    </div>
</main>


<%@include file="jsp-footer.jsp" %>
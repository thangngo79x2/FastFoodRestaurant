
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="jsp-header.jsp" %>
<main class="login-box">
    <div class="container">
        <div class="login-form">
            <form action="sig" method="post">
                <h1>Login</h1>
                <input type="hidden" name="action" value="login">
                <div class="input-box">
                    <i></i>
                    <input type="email" placeholder="Enter email" name="email">
                </div>
                <div class="input-box">
                    <i></i>
                    <input type="password" placeholder="Enter password" name="passwd">
                </div>
                <a href="register" style="float:left ; font-size: 15px;">Do not have an account ?</a> <br>
                <div class="login-box">
                   
                    <a href="https://www.facebook.com/dialog/oauth?client_id=512141757136187&redirect_uri=https://fastfoodress.herokuapp.com/fb-login" class="social-button" id="facebook-connect"> <span>Login with Facebook</span></a>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=https://fastfoodress.herokuapp.com/gg-login&response_type=code&client_id=1020369265111-u30b21k5ghkap6g6bh666r6j3q1qhvni.apps.googleusercontent.com&approval_prompt=force" class="social-button" id="google-connect"> <span>Login with Google</span></a>

                </div>
                <p class="text-danger"> ${status}</p>
                
                <div class="btn-box">
                    <button type="submit">
                        Login
                    </button>

                </div>
        </form>
    </div>
    </div>
</main>

<%@include file="jsp-footer.jsp" %>

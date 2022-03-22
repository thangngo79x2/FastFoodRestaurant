
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="jsp-header.jsp" %>
<main class="login-box">
    <div class="container">
        <div class="login-form">
            <form action="register" method="post">
                <h1>Sign In</h1>
                <input type="hidden" name="action" value="register">
                <div class="input-box">
                    <i></i>
                    <input type="text" placeholder="Enter name" name="name">
                </div>
                <div class="input-box">
                    <i></i>
                    <input type="email" placeholder="Enter email" name="email">
                </div>
                <div class="input-box">
                    <i></i>
                    <input type="password" placeholder="Enter password" name="passwd">
                </div>
                <div class="input-box">
                    <i></i>
                    <input type="password" placeholder="Rewrite password" name="rePasswd">
                </div>
                <p class="text-danger">${status}</p>

                <div class="btn-box">
                    <button type="submit">
                        Sign In
                    </button>
                </div>

            </form>
        </div>
    </div>
</main>


<%@include file="jsp-footer.jsp" %>

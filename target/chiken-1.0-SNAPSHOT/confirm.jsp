
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="jsp-header.jsp" %>
<main class="login-box">
    <div class="container">
        <div class="login-form">
            <form action="confirm" method="post">
                <h1>Enter the confirmation code</h1>
                <input type="hidden" name="action" value="code">
                <div class="input-box">
                    <i></i>
                    <input type="text" placeholder="Enter code" name="code">
                </div>
                <p class="text-danger"> ${status}</p>
                <div class="btn-box">
                    <button type="submit">
                        Confirm
                    </button>
                </div>

            </form>
        </div>
    </div>
</main>


<%@include file="jsp-footer.jsp" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="jsp-header.jsp" %>
<main class="login-box">
    <div class="contain">
        <div class="login-form">
            <form action="address" method="post">
                <h1>Edit shipping information</h1>
                <input type="hidden" name="state" value="${state}">
                <input type="hidden" name="action" value="update">
                <div class="input-box ">
                    <i>Recipient's fullname: </i>
                    <input type="text" placeholder="Enter name" name="name" value="${address.getAddressName()}" >

                </div>
                <div class=" input-box ">
                    <i>Phone number:</i>
                    <input type="text" placeholder="Enter phone number" name="phone" value="${address.getPhone()}" >

                </div>
                <div class="input-box">
                    <i>Delivery address :</i>
                    <input type="text" placeholder="province" name="province" value="${address.getProvince()}">

                </div>
                <div class="input-box">

                    <input type="text" placeholder="district" name="district" value="${address.getDistrict()}" >

                </div>
                <div class="input-box">

                    <input type="text" placeholder="commune" name="commune" value="${address.getCommune()}" >

                </div>
                <div class="input-box">

                    <input type="text" placeholder="house number/street name"  name="details" value="${address.getDetails()}">

                </div>
                <br> <p class="text-danger" style="float:left;"> ${status}</p>
                <a style="color: #FFF9E5; ">
                    <div class="btn-box ">
                        <button type="submit ">
                            Update
                        </button>
                    </div>
                </a>
        </div>
        </form>
    </div>
    </div>
</main>
<%@include file="jsp-footer.jsp" %>

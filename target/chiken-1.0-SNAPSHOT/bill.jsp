<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="jsp-header.jsp" %>
<!-- End Header -->

<main class="confirmcart">
    <h1>Hoá đơn</h1>
    <h2 class="name" name="">Fullname : ${address.getAddressName()}

    </h2>
    <h2 class="phone">Phone number : ${address.phoneFormat()}

    </h2>
    <h2 class="address">Address: ${address.fullAddress()}

    </h2>

    <ul class="responsive-table">
        <li class="table-header">
            <div class="col col-1">Product Name</div>
            <div class="col col-2">Price</div>
            <div class="col col-3"></div>
            <div class="col col-4">Total</div>
        </li>
        <c:forEach var="lineItem" items="${cart.items}">
            <li class="table-row">
                <div class="col col-1" data-label="Product">${lineItem.getProduct().getProductName()}</div>
                <div class="col col-2" data-label="Amount">${lineItem.getPriceFormat()}</div>
                <div class="col col-3" data-label="Number">${lineItem.getQuantity()}</div>
                <div class="col col-4" data-label="Cost">${lineItem.getTotalCurrencyFormat()}</div>
            </li>
        </c:forEach>


    </ul>

    <ul class="responsive-table">
        <li class="table-header">
            <div class="col col-1">Promo code</div>
            <div class="col col-2">Total money</div>
            <div class="col col-3">Amount reduced</div>
            <div class="col col-4">Total amount</div>
        </li>
        <li class="table-row">
            <div class="col col-1" data-label="Product">
                <form class="form" action="check-out" method="post">
                    <input type="hidden" name="action" value="checkCode">
                    <input type="text" class="form__field" placeholder="Code" name="code" value="${cart.getDiscountCode()}">
                    <button type="submit" class="btn btn--primary btn--inside uppercase">Check</button>
                </form>
            </div>
            <div class="col col-2" data-label="Amount">${cart.getSumTotalFormat()}</div>
            <div class="col col-3" data-label="Number">${cart.getDiscountValueFormat()}</div>
            <div class="col col-4" name= "total" data-label="Cost">${cart.getFinalTotalFormat()}</div>
        </li>
    </ul>


    <h3>

        <c:if test="${address.getAddressName()!=null}">
            <a href="check-out?action=final" class="btn btn-success btn-block">Pay <i class="fa fa-angle-right"></i></a>
        </c:if>

        <a href="address?state=bill" class="btn btn-success btn-block">Edit shipping information <i
                class="fa fa-angle-right"></i></a>
        <a href="cart" class="btn btn-success btn-block">Back <i class="fa fa-angle-right"></i></a>
    </h3>

</main>
<%@ include file="jsp-footer.jsp" %>
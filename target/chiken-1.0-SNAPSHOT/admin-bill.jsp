
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="admin-header.jsp"%>
<main class="costumerbill">
    <h1>Hoá đơn</h1>
    <h2>Họ và tên :  ${viewBill.getAddressName()}</h2>
    <h2>Số điện thoại :  ${viewBill.getPhone()} </h2>
    <h2>Địa chỉ : ${viewBill.fullAddress()}</h2>

    <ul class="responsive-table">
        <li class="table-header">
            <div class="col col-1">Product's name</div>
            <div class="col col-2">Price</div>
            <div class="col col-3">Amount</div>
            <div class="col col-4">Total</div>
        </li>

        <c:forEach var="billItem" items="${listBillItem}">
            <li class="table-row">
                <div class="col col-1" data-label="Product">${billItem.getProductName()}</div>
                <div class="col col-2" data-label="Amount">${billItem.priceFormat()}</div>
                <div class="col col-3" data-label="Number">${billItem.getQuantity()}</div>
                <div class="col col-4" data-label="Cost">${billItem.totalFormat()}</div>
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
            <div class="col col-1" data-label="Product">${viewBill.getDiscountCode()}</div>
            <div class="col col-2" data-label="Amount">${bill.getSumTotalFormat()}</div>
            <div class="col col-3" data-label="Number">${bill.getDiscountValueFormat()}</div>
            <div class="col col-4" data-label="Cost">${bill.getSumTotalFinalFormat()}</div>


        </li>
    </ul>

    <a href="admin-bill?action=confirm&id=${viewBill.getBillId()}" >Confirm</a>
</main>


<%@ include file="admin-footer.jsp"%>
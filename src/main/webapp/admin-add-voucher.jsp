
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="admin-header.jsp" %>

<main id="main">

    <!-- ======= Resume Section ======= -->


        <h1 class="text-center">Add voucher</h1>
        <div class="container">
            <form action="addvoucher" method="post" class="form-group">
                Voucher Name
                <input class="form-control" type="text" name="discountName" />
                Voucher Code
                <input class="form-control" type="text" name="discountCode" />
                Voucher value
                <input  class="form-control"type="text" name="discountValue"  />
                Begin date
                <input class="form-control" type="text" name="begin"  />
                End date
                <input  class="form-control"type="text" name="end"  />
                <br> <p class="text-danger" style="float:left;"> ${status}</p>
                <a style="color: #FFF9E5; ">
                    <div class="btn-box ">
                        <button type="submit ">
                            Add
                        </button>
                    </div>
                </a>

            </form>
        </div>
    <!-- End Resume Section -->

</main>

<%@include file="admin-footer.jsp" %>
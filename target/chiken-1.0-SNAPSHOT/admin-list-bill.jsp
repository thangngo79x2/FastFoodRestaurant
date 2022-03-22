
  <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="admin-header.jsp" %>

      <main id="main">

        <!-- ======= Resume Section ======= -->
        <section id="listbill" class="listbill">
          <h1><span class="blue"></span>List of invoices</h1>

          <table class="table">
            <thead>
              <tr>
                <th>
                  <h1>Customer</h1>
                </th>
                <th>
                  <h1>Invoice code</h1>
                </th>
                <th>
                  <h1>Phone Number</h1>
                </th>
                <th>
                  <h1>Invoice Date</h1>
                </th>
                <th>
                  <h1>Address</h1>
                </th>
                <th>
                  <h1></h1>
                </th>
              </tr>
            </thead>
            <tbody>

              <c:forEach var="bill" items="${billList}">
                <tr>
                  <td>${bill.getAddressName()}</td>
                  <td>${bill.getBillId()}</td>
                  <td>${bill.getPhone()}</td>
                  <td>${bill.getInvoiceDate()}</td>
                  <td>${bill.shortAddress()}</td>
                  <td>
                    <form action="admin-bill" method="post">
                      <input type="hidden" name="id" value="${bill.getBillId()}">

                      <input style="border: 0px; background-color: rgba(0, 0, 0, 0);" type="submit" value="Chi tiết ">
                    </form>
                  </td>
                </tr>
              </c:forEach>


            </tbody>
          </table>
        </section>
        <!-- End Resume Section -->

      </main>

      <%@include file="admin-footer.jsp" %>
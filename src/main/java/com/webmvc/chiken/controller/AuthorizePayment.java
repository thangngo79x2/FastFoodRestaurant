package com.webmvc.chiken.controller;


    import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.paypal.base.rest.PayPalRESTException;
    import com.webmvc.chiken.model.entity.OrderDetails;
    import com.webmvc.chiken.model.entity.PaymentServices;

@WebServlet("/authorize_payment")
    public class AuthorizePayment extends HttpServlet {
        private static final long serialVersionUID = 1L;

        public AuthorizePayment() {
        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String total = request.getParameter("total");

            OrderDetails orderDetail = new OrderDetails(total);

            try {
                PaymentServices paymentServices = new PaymentServices();
                String approvalLink = paymentServices.authorizePayment(orderDetail);

                response.sendRedirect(approvalLink);

            } catch (PayPalRESTException ex) {
                request.setAttribute("errorMessage", ex.getMessage());
                ex.printStackTrace();
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }

    }


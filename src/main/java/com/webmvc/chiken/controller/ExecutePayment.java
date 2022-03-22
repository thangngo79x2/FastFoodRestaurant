package com.webmvc.chiken.controller;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import com.webmvc.chiken.model.entity.PaymentServices;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ExecutePayment", urlPatterns = {"/execute_payment"})
public class ExecutePayment extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        try {

            PaymentServices paymentService = new PaymentServices();
            Payment payment = paymentService.executePayment(paymentId, payerId);
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            request.getRequestDispatcher("receipt.jsp").forward(request, response);
        } catch (PayPalRESTException ex) {
            ex.printStackTrace();
            request.setAttribute("errorMessage", "Can not pay");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

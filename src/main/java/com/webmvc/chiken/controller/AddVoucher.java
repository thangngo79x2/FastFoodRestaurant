package com.webmvc.chiken.controller;

import com.webmvc.chiken.model.DAO.DiscountDB;
import com.webmvc.chiken.model.DAO.ViewBillDB;
import com.webmvc.chiken.model.entity.DiscountEntity;
import com.webmvc.chiken.model.entity.ViewBillEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.sql.Date;


    @WebServlet(name = "AddVoucher", value = "/addvoucher")
    public class AddVoucher extends HttpServlet {
        @Override
        protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            doPost(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            resp.setContentType("text/html; charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");

            String status = "";
            String url = "/admin-add-voucher.jsp";
            String discountName = req.getParameter("discountName");
            String discountCode = req.getParameter("discountCode");
            String discountValue = req.getParameter("discountValue");
            Date begin = Date.valueOf(req.getParameter("begin"));
            Date end = Date.valueOf(req.getParameter("end"));
            DiscountEntity discount= new DiscountEntity();
            discount.setDiscountName(discountName);
            discount.setDiscountCode(discountCode);
            discount.setDiscountValue(Double.valueOf(discountValue));
            discount.setBeginDiscount(begin);
            discount.setEndDiscount(end);
            DiscountDB.inset(discount);
            url="/admin.jsp";
            getServletContext().getRequestDispatcher(url).forward(req, resp);

        }
    }



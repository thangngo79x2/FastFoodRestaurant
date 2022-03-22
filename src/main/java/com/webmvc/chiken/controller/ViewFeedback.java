package com.webmvc.chiken.controller;

import com.webmvc.chiken.model.DAO.FeedBackDB;
import com.webmvc.chiken.model.DAO.ViewBillDB;
import com.webmvc.chiken.model.entity.CustomerEntity;
import com.webmvc.chiken.model.entity.FeedbackEntity;
import com.webmvc.chiken.model.entity.ViewBillEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "ViewFeedback",value = "/viewFeedback")
public class ViewFeedback extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        HttpSession httpSession = req.getSession();
        String status = "";
        String url = "";
        String admin = (String) httpSession.getAttribute("admin");
        CustomerEntity userSession =(CustomerEntity) httpSession.getAttribute("customer");
        if (admin == null || !admin.equals("18112001")) {
            url = "/index.jsp";


        } else {
            ArrayList<FeedbackEntity> listFeedback = FeedBackDB.getListFeedback();
            req.setAttribute("feedbackList", listFeedback);
            url = "/view-feedback.jsp";
        }
        req.setAttribute("status", status);
        getServletContext().getRequestDispatcher(url).forward(req, resp);


    }
}


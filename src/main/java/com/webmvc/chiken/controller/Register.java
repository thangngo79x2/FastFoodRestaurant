package com.webmvc.chiken.controller;

import com.webmvc.chiken.model.DAO.CustomerDB;

import com.webmvc.chiken.model.entity.CustomerEntity;
import com.webmvc.chiken.util.EmailUtil;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Register", value = "/register")
public class Register extends HttpServlet {
    private String host;
    private String port;
    private String username;
    private String pass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        username = context.getInitParameter("username");
        pass = context.getInitParameter("pass");
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String url = "/register.jsp";
        String action = req.getParameter("action");
        String status = "";
        HttpSession httpSession = req.getSession();
        if (action == null) {

            action = "index";
        }
        if (action.equals("index")) {
            url = "/register.jsp";
        } else if (action.equals("register")) {


            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String passwd = req.getParameter("passwd");
            String rePasswd = req.getParameter("rePasswd");

            if (name == null || email == null || passwd == null || rePasswd == null
                    || name.equals("") || email.equals("") || passwd.equals("") || rePasswd.equals("")) {
                url = "/register.jsp";
                status = "You entered missing information";

            } else if (!passwd.equals(rePasswd)) {
                url = "/register.jsp";
                status = "password incorrect";
            } else if (CustomerDB.getCustomerByEmail(email) != null) {
                //email đã được đăng ký
                url = "/register.jsp";
                status = "This email is already registered";
                req.setAttribute("status", status);
            } else {
                //email chưa được đăng ký

                String code = EmailUtil.getRandom();
                CustomerEntity Customer = new CustomerEntity();
                Customer.setName(name);
                Customer.setMail(email);
                Customer.setPasswd(passwd);
                Customer.setRole("user");


                boolean state;
                try {
                    state = EmailUtil.sendEmail(host, port, username, pass, email, "Email Verification",
                            "Registered successfully.Please verify your account using this code: " + code);
                } catch (MessagingException e) {
                    e.printStackTrace();
                    state = false;
                }
                if (state) {

                    httpSession.setAttribute("code", code);
                    httpSession.setAttribute("user", Customer);
                    url = "/confirm.jsp";
                    status = "We have sent the code to your email, please check ";
                } else {
                    url = "/register.jsp";
                    status = "System error. Please re-enter";
                }


            }

        }

        req.setAttribute("status", status);
        getServletContext().getRequestDispatcher(url).forward(req, resp);
    }
}

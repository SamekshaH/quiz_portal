package com.quizportal.controller;

import com.quizportal.dao.UserDAO;
import com.quizportal.model.User;
import com.quizportal.util.PasswordUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("login".equals(action)) {
            handleLogin(req, resp);
        } else if ("register".equals(action)) {
            handleRegister(req, resp);
        } else if ("logout".equals(action)) {
            handleLogout(req, resp);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String action = req.getParameter("action");
         if ("logout".equals(action)) {
            handleLogout(req, resp);
        }
    }

    private void handleLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userDAO.findByUsername(username);

        if (user != null && PasswordUtil.checkPassword(password, user.getPassword())) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            
            if ("TEACHER".equals(user.getRole())) {
                resp.sendRedirect("teacher/dashboard");
            } else {
                resp.sendRedirect("student/dashboard");
            }
        } else {
            req.setAttribute("error", "Invalid username or password");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    private void handleRegister(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role"); // TEACHER or STUDENT

        if (userDAO.findByUsername(username) != null) {
            req.setAttribute("error", "Username already exists");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(PasswordUtil.hashPassword(password));
        newUser.setRole(role);

        if (userDAO.createUser(newUser)) {
            resp.sendRedirect("login.jsp?registered=true");
        } else {
            req.setAttribute("error", "Registration failed");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }

    private void handleLogout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        resp.sendRedirect("login.jsp");
    }
}

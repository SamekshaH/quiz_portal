package com.quizportal.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        boolean isAuthRequest = uri.endsWith("login.jsp") || uri.endsWith("register.jsp") || uri.contains("/auth")
                || uri.endsWith("index.jsp") || uri.endsWith(".css") || uri.endsWith(".js")
                || uri.equals(contextPath + "/") || uri.equals(contextPath);

        if (isLoggedIn || isAuthRequest) {
            chain.doFilter(request, response);
        } else {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }

    @Override
    public void destroy() {
    }
}

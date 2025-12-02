package com.quizportal.controller;

import com.quizportal.dao.QuestionDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/teacher/delete_question")
public class DeleteQuestionServlet extends HttpServlet {

    private QuestionDAO questionDAO = new QuestionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        String quizIdStr = req.getParameter("quizId");

        if (idStr != null && quizIdStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                questionDAO.deleteQuestion(id);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            resp.sendRedirect("view_quiz?id=" + quizIdStr);
        } else {
            resp.sendRedirect("dashboard");
        }
    }
}

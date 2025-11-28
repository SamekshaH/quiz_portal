package com.quizportal.controller;

import com.quizportal.dao.QuestionDAO;
import com.quizportal.dao.QuizDAO;
import com.quizportal.dao.SubmissionDAO;
import com.quizportal.model.Quiz;
import com.quizportal.model.User;
import com.quizportal.model.Submission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/teacher/*")
public class TeacherQuizServlet extends HttpServlet {

    private QuizDAO quizDAO = new QuizDAO();
    private QuestionDAO questionDAO = new QuestionDAO();
    private SubmissionDAO submissionDAO = new SubmissionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/dashboard")) {
            List<Quiz> quizzes = quizDAO.getAllQuizzes();
            req.setAttribute("quizzes", quizzes);
            req.getRequestDispatcher("/teacher/dashboard.jsp").forward(req, resp);
        } else if (pathInfo.equals("/create_quiz")) {
            req.getRequestDispatcher("/teacher/create_quiz.jsp").forward(req, resp);
        } else if (pathInfo.equals("/view_quiz")) {
            int quizId = Integer.parseInt(req.getParameter("id"));
            Quiz quiz = quizDAO.getQuizById(quizId);
            req.setAttribute("quiz", quiz);
            req.setAttribute("questions", questionDAO.getQuestionsByQuizId(quizId));
            req.getRequestDispatcher("/teacher/view_quiz.jsp").forward(req, resp);
        } else if (pathInfo.equals("/quiz_results")) {
            int quizId = Integer.parseInt(req.getParameter("id"));
            Quiz quiz = quizDAO.getQuizById(quizId);
            List<Submission> submissions = submissionDAO.getSubmissionsByQuizId(quizId);
            req.setAttribute("quiz", quiz);
            req.setAttribute("submissions", submissions);
            req.getRequestDispatcher("/teacher/quiz_results.jsp").forward(req, resp);
        } else if (pathInfo.equals("/toggle_status")) {
            int quizId = Integer.parseInt(req.getParameter("id"));
            Quiz quiz = quizDAO.getQuizById(quizId);
            String newStatus = "OPEN".equals(quiz.getStatus()) ? "CLOSED" : "OPEN";
            quizDAO.updateQuizStatus(quizId, newStatus);
            resp.sendRedirect("dashboard");
        } else if (pathInfo.equals("/delete_quiz")) {
            int quizId = Integer.parseInt(req.getParameter("id"));
            quizDAO.deleteQuiz(quizId);
            resp.sendRedirect("dashboard");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo.equals("/create_quiz")) {
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            int duration = Integer.parseInt(req.getParameter("duration"));
            
            User user = (User) req.getSession().getAttribute("user");
            
            Quiz quiz = new Quiz();
            quiz.setTitle(title);
            quiz.setDescription(description);
            quiz.setDurationMinutes(duration);
            quiz.setStatus("CLOSED");
            quiz.setCreatedBy(user.getId());
            
            quizDAO.createQuiz(quiz);
            resp.sendRedirect("dashboard");
        }
    }
}

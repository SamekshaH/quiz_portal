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

@WebServlet("/student/*")
public class StudentQuizServlet extends HttpServlet {

    private QuizDAO quizDAO = new QuizDAO();
    private QuestionDAO questionDAO = new QuestionDAO();
    private SubmissionDAO submissionDAO = new SubmissionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        User user = (User) req.getSession().getAttribute("user");

        if (pathInfo == null || pathInfo.equals("/dashboard")) {
            List<Quiz> quizzes = quizDAO.getAllQuizzes(); // Show all, let UI filter or show status
            // Or better, show all but indicate status
            req.setAttribute("quizzes", quizzes);
            req.setAttribute("submissionDAO", submissionDAO); // To check if attempted
            req.setAttribute("studentId", user.getId());
            req.getRequestDispatcher("/student/dashboard.jsp").forward(req, resp);
        } else if (pathInfo.equals("/attempt_quiz")) {
            int quizId = Integer.parseInt(req.getParameter("id"));
            
            // Check if already attempted
            if (submissionDAO.hasStudentAttempted(quizId, user.getId())) {
                req.setAttribute("error", "You have already attempted this quiz.");
                req.getRequestDispatcher("/student/dashboard").forward(req, resp);
                return;
            }
            
            Quiz quiz = quizDAO.getQuizById(quizId);
            if (!"OPEN".equals(quiz.getStatus())) {
                 req.setAttribute("error", "Ask your lecturer to start the test.");
                 req.getRequestDispatcher("/student/dashboard").forward(req, resp);
                 return;
            }
            
            req.setAttribute("quiz", quiz);
            req.setAttribute("questions", questionDAO.getQuestionsByQuizId(quizId));
            req.getRequestDispatcher("/student/attempt_quiz.jsp").forward(req, resp);
        } else if (pathInfo.equals("/my_results")) {
             List<Submission> submissions = submissionDAO.getSubmissionsByStudentId(user.getId());
             req.setAttribute("submissions", submissions);
             req.setAttribute("quizDAO", quizDAO);
             req.getRequestDispatcher("/student/my_results.jsp").forward(req, resp);
        }
    }
}

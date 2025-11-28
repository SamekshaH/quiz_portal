package com.quizportal.controller;

import com.quizportal.dao.QuestionDAO;
import com.quizportal.dao.SubmissionDAO;
import com.quizportal.model.Question;
import com.quizportal.model.Submission;
import com.quizportal.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/student/submit_quiz")
public class SubmissionServlet extends HttpServlet {

    private SubmissionDAO submissionDAO = new SubmissionDAO();
    private QuestionDAO questionDAO = new QuestionDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int quizId = Integer.parseInt(req.getParameter("quizId"));
        
        // Prevent double submission
        if (submissionDAO.hasStudentAttempted(quizId, user.getId())) {
             resp.sendRedirect("dashboard");
             return;
        }

        List<Question> questions = questionDAO.getQuestionsByQuizId(quizId);
        int score = 0;
        Map<Integer, String> answers = new HashMap<>();

        for (Question q : questions) {
            String selectedOption = req.getParameter("question_" + q.getId());
            if (selectedOption != null) {
                answers.put(q.getId(), selectedOption);
                if (selectedOption.equals(q.getCorrectOption())) {
                    score++;
                }
            }
        }

        Submission submission = new Submission();
        submission.setQuizId(quizId);
        submission.setStudentId(user.getId());
        submission.setScore(score);
        
        int submissionId = submissionDAO.createSubmission(submission);
        if (submissionId != -1) {
            submissionDAO.saveSubmissionAnswers(submissionId, answers);
        }

        // Show result
        req.setAttribute("score", score);
        req.setAttribute("total", questions.size());
        req.setAttribute("questions", questions);
        req.setAttribute("answers", answers);
        req.getRequestDispatcher("/WEB-INF/views/student/result.jsp").forward(req, resp);
    }
}

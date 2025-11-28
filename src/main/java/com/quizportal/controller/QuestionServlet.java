package com.quizportal.controller;

import com.quizportal.dao.QuestionDAO;
import com.quizportal.model.Question;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/teacher/add_question")
public class QuestionServlet extends HttpServlet {

    private QuestionDAO questionDAO = new QuestionDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int quizId = Integer.parseInt(req.getParameter("quizId"));
        String questionText = req.getParameter("questionText");
        String optionA = req.getParameter("optionA");
        String optionB = req.getParameter("optionB");
        String optionC = req.getParameter("optionC");
        String optionD = req.getParameter("optionD");
        String correctOption = req.getParameter("correctOption");

        Question question = new Question();
        question.setQuizId(quizId);
        question.setQuestionText(questionText);
        question.setOptionA(optionA);
        question.setOptionB(optionB);
        question.setOptionC(optionC);
        question.setOptionD(optionD);
        question.setCorrectOption(correctOption);

        questionDAO.createQuestion(question);
        
        resp.sendRedirect("view_quiz?id=" + quizId);
    }
}

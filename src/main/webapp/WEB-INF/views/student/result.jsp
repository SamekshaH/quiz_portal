<%-- Force recompilation --%>
    <%@ page import="com.quizportal.model.Question" %>
        <%@ page import="java.util.List" %>
            <%@ page import="java.util.Map" %>
                <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <title>Quiz Result - Quiz Portal</title>
                        <link rel="stylesheet"
                            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                        <link rel="stylesheet" href="../css/style.css">
                    </head>

                    <body>
                        <nav class="navbar navbar-dark bg-dark">
                            <a class="navbar-brand" href="dashboard">Back to Dashboard</a>
                        </nav>
                        <div class="container mt-4">
                            <div class="jumbotron text-center">
                                <h1 class="display-4">Quiz Submitted!</h1>
                                <p class="lead">Your Score: <strong>
                                        <%= request.getAttribute("score") %> / <%= request.getAttribute("total") %>
                                    </strong></p>
                                <hr class="my-4">
                                <a class="btn btn-primary btn-lg" href="dashboard" role="button">Go to Dashboard</a>
                            </div>
                            <h3>Detailed Review</h3>
                            <% List<Question> questions = (List<Question>) request.getAttribute("questions");
                                    Map<Integer, String> answers = (Map<Integer, String>)
                                            request.getAttribute("answers");
                                            if (questions != null) {
                                            int i = 1;
                                            for (Question q : questions) {
                                            String selected = answers.get(q.getId());
                                            boolean isCorrect = q.getCorrectOption().equals(selected);
                                            %>
                                            <div class="question-block" style="border-left: 5px solid <%= isCorrect ? "#28a745" : "#dc3545" %>;">
    <h5>Q<%= i++ %>: <%= q.getQuestionText() %></h5>
    <p>Your Answer:
        <span class="<%= isCorrect ? "correct-answer" : "wrong-answer" %>">
            <%= selected != null ? selected : "Not Answered" %>
        </span>
    </p>

    <% if (!isCorrect) { %>
        <p class="correct-answer">Correct Answer: <%= q.getCorrectOption() %></p>
    <% } %>
</div>

                                            <% } } %>
                        </div>
                    </body>

                    </html>
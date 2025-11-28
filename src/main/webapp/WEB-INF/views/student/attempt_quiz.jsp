<%@ page import="com.quizportal.model.Quiz" %>
    <%@ page import="com.quizportal.model.Question" %>
        <%@ page import="java.util.List" %>
            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <title>Attempt Quiz - Quiz Portal</title>
                    <link rel="stylesheet"
                        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                    <link rel="stylesheet" href="../css/style.css">
                </head>

                <body>
                    <% Quiz quiz=(Quiz) request.getAttribute("quiz"); %>
                        <nav class="navbar navbar-dark bg-dark justify-content-between sticky-top">
                            <span class="navbar-brand">
                                <%= quiz.getTitle() %>
                            </span>
                            <span class="text-white">Time Remaining: <span id="timer" class="timer">00:00</span></span>
                        </nav>

                        <div class="container mt-4">
                            <form id="quizForm" action="submit_quiz" method="post">
                                <input type="hidden" name="quizId" value="<%= quiz.getId() %>">

                                <% List<Question> questions = (List<Question>) request.getAttribute("questions");
                                        if (questions != null) {
                                        int i = 1;
                                        for (Question q : questions) {
                                        %>
                                        <div class="question-block">
                                            <h5>Q<%= i++ %>: <%= q.getQuestionText() %>
                                            </h5>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio"
                                                    name="question_<%= q.getId() %>" value="A" id="q<%= q.getId() %>A">
                                                <label class="form-check-label" for="q<%= q.getId() %>A">
                                                    <%= q.getOptionA() %>
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio"
                                                    name="question_<%= q.getId() %>" value="B" id="q<%= q.getId() %>B">
                                                <label class="form-check-label" for="q<%= q.getId() %>B">
                                                    <%= q.getOptionB() %>
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio"
                                                    name="question_<%= q.getId() %>" value="C" id="q<%= q.getId() %>C">
                                                <label class="form-check-label" for="q<%= q.getId() %>C">
                                                    <%= q.getOptionC() %>
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio"
                                                    name="question_<%= q.getId() %>" value="D" id="q<%= q.getId() %>D">
                                                <label class="form-check-label" for="q<%= q.getId() %>D">
                                                    <%= q.getOptionD() %>
                                                </label>
                                            </div>
                                        </div>
                                        <% } } %>

                                            <button type="submit" class="btn btn-primary btn-lg btn-block mb-5">Submit
                                                Quiz</button>
                            </form>
                        </div>

                        <script src="../js/timer.js"></script>
                        <script>
                            window.onload = function () {
                                var duration = <%= quiz.getDurationMinutes() %>;
                                var display = document.querySelector('#timer');
                                startTimer(duration, display);
                            };
                        </script>
                </body>

                </html>
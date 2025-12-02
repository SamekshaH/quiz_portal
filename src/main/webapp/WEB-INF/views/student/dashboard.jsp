<%@ page import="java.util.List" %>
    <%@ page import="com.quizportal.model.Quiz" %>
        <%@ page import="com.quizportal.dao.SubmissionDAO" %>
            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <title>Student Dashboard - Quiz Portal</title>
                    <link rel="stylesheet"
                        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                    <link rel="stylesheet" href="../css/style.css">
                </head>

                <body>
                    <nav class="navbar navbar-dark bg-dark justify-content-between">
                        <a class="navbar-brand">Student Dashboard</a>
                        <div>
                            <a href="my_results" class="btn btn-outline-info mr-2">My Results</a>
                            <form class="form-inline d-inline" action="../auth" method="post">
                                <input type="hidden" name="action" value="logout">
                                <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Logout</button>
                            </form>
                        </div>
                    </nav>

                    <div class="container">
                        <% if (request.getAttribute("error") !=null) { %>
                            <div class="alert alert-danger">
                                <%= request.getAttribute("error") %>
                            </div>
                            <% } %>

                                <h2>Available Quizzes</h2>
                                <div class="row mt-4">
                                    <% List<Quiz> availableQuizzes = (List<Quiz>)
                                            request.getAttribute("availableQuizzes");
                                            if (availableQuizzes != null && !availableQuizzes.isEmpty()) {
                                            for (Quiz quiz : availableQuizzes) {
                                            boolean isOpen = "OPEN".equals(quiz.getStatus());
                                            %>
                                            <div class="col-md-4">
                                                <div class="card mb-4">
                                                    <div class="card-body">
                                                        <h5 class="card-title">
                                                            <%= quiz.getTitle() %>
                                                        </h5>
                                                        <p class="card-text">
                                                            <%= quiz.getDescription() %>
                                                        </p>
                                                        <p><strong>Duration:</strong>
                                                            <%= quiz.getDurationMinutes() %> mins
                                                        </p>
                                                        <% if (isOpen) { %>
                                                            <a href="attempt_quiz?id=<%= quiz.getId() %>"
                                                                class="btn btn-success btn-block">Start Quiz</a>
                                                            <% } else { %>
                                                                <button class="btn btn-secondary btn-block" disabled
                                                                    onclick="alert('Ask your lecturer to start the test.')">Closed</button>
                                                                <% } %>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } } else { %>
                                                <div class="col-12">
                                                    <p>No available quizzes.</p>
                                                </div>
                                                <% } %>
                                </div>

                                <h2 class="mt-5">Attended Quizzes</h2>
                                <div class="row mt-4">
                                    <% List<Quiz> attendedQuizzes = (List<Quiz>)
                                            request.getAttribute("attendedQuizzes");
                                            if (attendedQuizzes != null && !attendedQuizzes.isEmpty()) {
                                            for (Quiz quiz : attendedQuizzes) {
                                            %>
                                            <div class="col-md-4">
                                                <div class="card mb-4">
                                                    <div class="card-body">
                                                        <h5 class="card-title">
                                                            <%= quiz.getTitle() %>
                                                        </h5>
                                                        <p class="card-text">
                                                            <%= quiz.getDescription() %>
                                                        </p>
                                                        <a href="my_results" class="btn btn-info btn-block">View
                                                            Results</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } } else { %>
                                                <div class="col-12">
                                                    <p>No attended quizzes yet.</p>
                                                </div>
                                                <% } %>
                                </div>
                    </div>
                </body>

                </html>
<%@ page import="java.util.List" %>
    <%@ page import="com.quizportal.model.Quiz" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>Teacher Dashboard - Quiz Portal</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                <link rel="stylesheet" href="../css/style.css">
            </head>

            <body>
                <nav class="navbar navbar-dark bg-dark justify-content-between">
                    <a class="navbar-brand">Teacher Dashboard</a>
                    <form class="form-inline" action="../auth" method="post">
                        <input type="hidden" name="action" value="logout">
                        <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Logout</button>
                    </form>
                </nav>

                <div class="container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2>My Quizzes</h2>
                        <a href="create_quiz" class="btn btn-primary">Create New Quiz</a>
                    </div>

                    <div class="row">
                        <% List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
                                if (quizzes != null) {
                                for (Quiz quiz : quizzes) {
                                %>
                                <div class="col-md-4">
                                    <div class="card">
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
                                            <p><strong>Status:</strong>
                                                <span class="badge badge-<%= " OPEN".equals(quiz.getStatus())
                                                    ? "success" : "secondary" %>">
                                                    <%= quiz.getStatus() %>
                                                </span>
                                            </p>
                                            <div class="btn-group-vertical w-100">
                                                <a href="view_quiz?id=<%= quiz.getId() %>"
                                                    class="btn btn-info mb-1">Manage Questions</a>
                                                <a href="toggle_status?id=<%= quiz.getId() %>"
                                                    class="btn btn-warning mb-1">
                                                    <%= "OPEN" .equals(quiz.getStatus()) ? "Close Quiz" : "Open Quiz" %>
                                                </a>
                                                <a href="quiz_results?id=<%= quiz.getId() %>"
                                                    class="btn btn-secondary mb-1">View Results</a>
                                                <a href="delete_quiz?id=<%= quiz.getId() %>" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure?')">Delete</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% } } %>
                    </div>
                </div>
            </body>

            </html>
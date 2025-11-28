<%@ page import="com.quizportal.model.Quiz" %>
    <%@ page import="com.quizportal.model.Submission" %>
        <%@ page import="java.util.List" %>
            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <title>Quiz Results - Quiz Portal</title>
                    <link rel="stylesheet"
                        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                    <link rel="stylesheet" href="../css/style.css">
                </head>

                <body>
                    <nav class="navbar navbar-dark bg-dark">
                        <a class="navbar-brand" href="dashboard">Back to Dashboard</a>
                    </nav>

                    <div class="container mt-4">
                        <% Quiz quiz=(Quiz) request.getAttribute("quiz"); %>
                            <h3>Results for: <%= quiz.getTitle() %>
                            </h3>

                            <table class="table table-striped mt-4">
                                <thead>
                                    <tr>
                                        <th>Student</th>
                                        <th>Score</th>
                                        <th>Submitted At</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% List<Submission> submissions = (List<Submission>)
                                            request.getAttribute("submissions");
                                            if (submissions != null) {
                                            for (Submission sub : submissions) {
                                            %>
                                            <tr>
                                                <td>
                                                    <%= sub.getStudentName() %>
                                                </td>
                                                <td>
                                                    <%= sub.getScore() %>
                                                </td>
                                                <td>
                                                    <%= sub.getSubmittedAt() %>
                                                </td>
                                            </tr>
                                            <% } } else { %>
                                                <tr>
                                                    <td colspan="3">No submissions yet.</td>
                                                </tr>
                                                <% } %>
                                </tbody>
                            </table>
                    </div>
                </body>

                </html>
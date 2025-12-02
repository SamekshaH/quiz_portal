<%@ page import="com.quizportal.model.Quiz" %>
    <%@ page import="com.quizportal.model.Question" %>
        <%@ page import="java.util.List" %>
            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <title>Manage Quiz - Quiz Portal</title>
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
                            <h3>
                                <%= quiz.getTitle() %> <small class="text-muted">Manage Questions</small>
                            </h3>

                            <div class="row mt-4">
                                <div class="col-md-8">
                                    <h4>Questions</h4>
                                    <% List<Question> questions = (List<Question>) request.getAttribute("questions");
                                            if (questions != null) {
                                            int i = 1;
                                            for (Question q : questions) { %>
                                            <div class="question-block">
                                                <div class="d-flex justify-content-between">
                                                    <h5>Q<%= i++ %>: <%= q.getQuestionText() %>
                                                    </h5>
                                                    <a href="delete_question?id=<%= q.getId() %>&quizId=<%= quiz.getId() %>"
                                                        class="btn btn-sm btn-danger"
                                                        onclick="return confirm('Are you sure you want to delete this question?')">Delete</a>
                                                </div>
                                                <ul class="list-unstyled ml-3">
                                                    <li class="<%= " A".equals(q.getCorrectOption())
                                                        ? "text-success font-weight-bold" : "" %>">A) <%= q.getOptionA()
                                                            %>
                                                    </li>
                                                    <li class="<%= " B".equals(q.getCorrectOption())
                                                        ? "text-success font-weight-bold" : "" %>">B) <%= q.getOptionB()
                                                            %>
                                                    </li>
                                                    <li class="<%= " C".equals(q.getCorrectOption())
                                                        ? "text-success font-weight-bold" : "" %>">C) <%= q.getOptionC()
                                                            %>
                                                    </li>
                                                    <li class="<%= " D".equals(q.getCorrectOption())
                                                        ? "text-success font-weight-bold" : "" %>">D) <%= q.getOptionD()
                                                            %>
                                                    </li>
                                                </ul>
                                            </div>
                                            <% } } %>
                                </div>

                                <div class="col-md-4">
                                    <div class="card">
                                        <div class="card-header">Add New Question</div>
                                        <div class="card-body">
                                            <form action="add_question" method="post">
                                                <input type="hidden" name="quizId" value="<%= quiz.getId() %>">
                                                <div class="form-group">
                                                    <label>Question Text</label>
                                                    <textarea name="questionText" class="form-control"
                                                        required></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" name="optionA" class="form-control mb-2"
                                                        placeholder="Option A" required>
                                                    <input type="text" name="optionB" class="form-control mb-2"
                                                        placeholder="Option B" required>
                                                    <input type="text" name="optionC" class="form-control mb-2"
                                                        placeholder="Option C" required>
                                                    <input type="text" name="optionD" class="form-control mb-2"
                                                        placeholder="Option D" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Correct Option</label>
                                                    <select name="correctOption" class="form-control">
                                                        <option value="A">Option A</option>
                                                        <option value="B">Option B</option>
                                                        <option value="C">Option C</option>
                                                        <option value="D">Option D</option>
                                                    </select>
                                                </div>
                                                <button type="submit" class="btn btn-success btn-block">Add
                                                    Question</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </body>

                </html>
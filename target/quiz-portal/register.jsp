<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Register - Quiz Portal</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">Register</div>
                        <div class="card-body">
                            <% if (request.getAttribute("error") !=null) { %>
                                <div class="alert alert-danger">
                                    <%= request.getAttribute("error") %>
                                </div>
                                <% } %>
                                    <form action="auth" method="post">
                                        <input type="hidden" name="action" value="register">
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input type="text" name="username" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="password" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Role</label>
                                            <select name="role" class="form-control">
                                                <option value="STUDENT">Student</option>
                                                <option value="TEACHER">Teacher</option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-success btn-block">Register</button>
                                    </form>
                                    <div class="mt-3 text-center">
                                        <a href="login.jsp">Already have an account? Login</a>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Login - Quiz Portal</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">Login</div>
                        <div class="card-body">
                            <% if (request.getParameter("registered") !=null) { %>
                                <div class="alert alert-success">Registration successful! Please login.</div>
                                <% } %>
                                    <% if (request.getAttribute("error") !=null) { %>
                                        <div class="alert alert-danger">
                                            <%= request.getAttribute("error") %>
                                        </div>
                                        <% } %>
                                            <form action="auth" method="post">
                                                <input type="hidden" name="action" value="login">
                                                <div class="form-group">
                                                    <label>Username</label>
                                                    <input type="text" name="username" class="form-control" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" name="password" class="form-control"
                                                        required>
                                                </div>
                                                <button type="submit" class="btn btn-primary btn-block">Login</button>
                                            </form>
                                            <div class="mt-3 text-center">
                                                <a href="register.jsp">Create an account</a>
                                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>
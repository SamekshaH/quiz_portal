<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Create Quiz - Quiz Portal</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>

    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="dashboard">Back to Dashboard</a>
        </nav>

        <div class="container mt-4">
            <div class="card">
                <div class="card-header">Create New Quiz</div>
                <div class="card-body">
                    <form action="create_quiz" method="post">
                        <div class="form-group">
                            <label>Quiz Title</label>
                            <input type="text" name="title" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea name="description" class="form-control" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Duration (minutes)</label>
                            <input type="number" name="duration" class="form-control" min="1" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Create Quiz</button>
                    </form>
                </div>
            </div>
        </div>
    </body>

    </html>
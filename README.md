# Java Full-Stack Quiz Portal

A production-ready Online Quiz Portal implemented using Java (JSP, Servlets, JDBC, MySQL).

## Features
- **Roles**: Teacher and Student.
- **Teacher**: Create quizzes, add MCQ questions, toggle quiz status (OPEN/CLOSED), view results.
- **Student**: Attempt OPEN quizzes, auto-submit timer, view immediate results and history.
- **Security**: Session-based authentication, BCrypt password hashing, Role-based access control.
- **Tech Stack**: Java 8+, Maven, Apache Tomcat, MySQL, Bootstrap 4.

## Prerequisites
- Java Development Kit (JDK) 8 or higher.
- Apache Maven.
- Apache Tomcat 9 (or compatible Servlet container).
- MySQL Server.

## Setup Instructions

### 1. Database Setup
1.  Open your MySQL client (Workbench, Command Line, etc.).
2.  Create a new database:
    ```sql
    CREATE DATABASE quiz_portal;
    ```
3.  Run the migration script `src/main/resources/schema.sql` to create tables.
4.  (Optional) Run `src/main/resources/seed.sql` to insert sample data.

### 2. Application Configuration
1.  Open `src/main/resources/db.properties`.
2.  Update the database credentials to match your local setup:
    ```properties
    db.url=jdbc:mysql://localhost:3306/quiz_portal?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
    db.username=YOUR_MYSQL_USERNAME
    db.password=YOUR_MYSQL_PASSWORD
    ```

### 3. Build the Project
Open a terminal in the project root directory and run:
```bash
mvn clean package
```
This will generate a WAR file in the `target` directory (e.g., `target/quiz-portal.war`).

### 4. Deploy to Tomcat
1.  Copy the generated WAR file (`target/quiz-portal.war`) to your Tomcat `webapps` directory.
2.  Start your Tomcat server (`bin/startup.bat` or `bin/startup.sh`).
3.  The application will be accessible at: `http://localhost:8080/quiz-portal`

## Usage Guide

### Sample Credentials (from seed.sql)
- **Teacher**:
    - Username: `teacher1`
    - Password: `password123`
- **Student**:
    - Username: `student1`
    - Password: `password123`

### Teacher Workflow
1.  Login as Teacher.
2.  Click "Create New Quiz".
3.  Enter details (Title, Duration) and Create.
4.  Click "Manage Questions" on the new quiz.
5.  Add MCQ questions (select correct option A/B/C/D).
6.  Go back to Dashboard and click "Open Quiz" to make it live.
7.  Click "View Results" to see student scores.

### Student Workflow
1.  Login as Student.
2.  See list of quizzes.
3.  If a quiz is "OPEN", click "Start Quiz".
4.  Answer questions before the timer runs out.
5.  Click "Submit" (or wait for auto-submit).
6.  View your score and correct answers immediately.
7.  Click "My Results" to view past attempts.

## Project Structure
- `src/main/java`: Backend source code (Controllers, DAOs, Models).
- `src/main/webapp`: Frontend views (JSP) and static assets (CSS, JS).
- `src/main/resources`: Database scripts and configuration.

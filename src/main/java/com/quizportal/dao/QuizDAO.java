package com.quizportal.dao;

import com.quizportal.model.Quiz;
import com.quizportal.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuizDAO {

    public List<Quiz> getAllQuizzes() {
        List<Quiz> quizzes = new ArrayList<>();
        String sql = "SELECT * FROM quizzes ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                quizzes.add(mapResultSetToQuiz(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quizzes;
    }
    
    public List<Quiz> getOpenQuizzes() {
        List<Quiz> quizzes = new ArrayList<>();
        String sql = "SELECT * FROM quizzes WHERE status = 'OPEN' ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                quizzes.add(mapResultSetToQuiz(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quizzes;
    }

    public Quiz getQuizById(int id) {
        String sql = "SELECT * FROM quizzes WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToQuiz(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean createQuiz(Quiz quiz) {
        String sql = "INSERT INTO quizzes (title, description, duration_minutes, status, created_by) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, quiz.getTitle());
            stmt.setString(2, quiz.getDescription());
            stmt.setInt(3, quiz.getDurationMinutes());
            stmt.setString(4, quiz.getStatus());
            stmt.setInt(5, quiz.getCreatedBy());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateQuizStatus(int quizId, String status) {
        String sql = "UPDATE quizzes SET status = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, quizId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteQuiz(int quizId) {
        String deleteAnswersSql = "DELETE FROM submission_answers WHERE submission_id IN (SELECT id FROM submissions WHERE quiz_id = ?)";
        String deleteSubmissionsSql = "DELETE FROM submissions WHERE quiz_id = ?";
        String deleteQuestionsSql = "DELETE FROM questions WHERE quiz_id = ?";
        String deleteQuizSql = "DELETE FROM quizzes WHERE id = ?";
        
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // Start transaction

            try (PreparedStatement stmt1 = conn.prepareStatement(deleteAnswersSql);
                 PreparedStatement stmt2 = conn.prepareStatement(deleteSubmissionsSql);
                 PreparedStatement stmt3 = conn.prepareStatement(deleteQuestionsSql);
                 PreparedStatement stmt4 = conn.prepareStatement(deleteQuizSql)) {
                
                // 1. Delete Submission Answers
                stmt1.setInt(1, quizId);
                stmt1.executeUpdate();
                
                // 2. Delete Submissions
                stmt2.setInt(1, quizId);
                stmt2.executeUpdate();
                
                // 3. Delete Questions
                stmt3.setInt(1, quizId);
                stmt3.executeUpdate();
                
                // 4. Delete Quiz
                stmt4.setInt(1, quizId);
                int rows = stmt4.executeUpdate();
                
                conn.commit(); // Commit transaction
                return rows > 0;
            } catch (SQLException e) {
                conn.rollback(); // Rollback on error
                e.printStackTrace();
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    private Quiz mapResultSetToQuiz(ResultSet rs) throws SQLException {
        return new Quiz(
            rs.getInt("id"),
            rs.getString("title"),
            rs.getString("description"),
            rs.getInt("duration_minutes"),
            rs.getString("status"),
            rs.getInt("created_by"),
            rs.getTimestamp("created_at")
        );
    }
}

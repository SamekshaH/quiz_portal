package com.quizportal.dao;

import com.quizportal.model.Submission;
import com.quizportal.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SubmissionDAO {

    public int createSubmission(Submission submission) {
        String sql = "INSERT INTO submissions (quiz_id, student_id, score) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, submission.getQuizId());
            stmt.setInt(2, submission.getStudentId());
            stmt.setInt(3, submission.getScore());
            int rows = stmt.executeUpdate();
            if (rows > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public void saveSubmissionAnswers(int submissionId, Map<Integer, String> answers) {
        String sql = "INSERT INTO submission_answers (submission_id, question_id, selected_option) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            for (Map.Entry<Integer, String> entry : answers.entrySet()) {
                stmt.setInt(1, submissionId);
                stmt.setInt(2, entry.getKey());
                stmt.setString(3, entry.getValue());
                stmt.addBatch();
            }
            stmt.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean hasStudentAttempted(int quizId, int studentId) {
        String sql = "SELECT id FROM submissions WHERE quiz_id = ? AND student_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, quizId);
            stmt.setInt(2, studentId);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Submission> getSubmissionsByQuizId(int quizId) {
        List<Submission> submissions = new ArrayList<>();
        String sql = "SELECT s.*, u.username FROM submissions s JOIN users u ON s.student_id = u.id WHERE s.quiz_id = ? ORDER BY s.score DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, quizId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Submission sub = new Submission(
                    rs.getInt("id"),
                    rs.getInt("quiz_id"),
                    rs.getInt("student_id"),
                    rs.getInt("score"),
                    rs.getTimestamp("submitted_at")
                );
                sub.setStudentName(rs.getString("username"));
                submissions.add(sub);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return submissions;
    }
    
    public List<Submission> getSubmissionsByStudentId(int studentId) {
        List<Submission> submissions = new ArrayList<>();
        String sql = "SELECT * FROM submissions WHERE student_id = ? ORDER BY submitted_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                submissions.add(new Submission(
                    rs.getInt("id"),
                    rs.getInt("quiz_id"),
                    rs.getInt("student_id"),
                    rs.getInt("score"),
                    rs.getTimestamp("submitted_at")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return submissions;
    }
}

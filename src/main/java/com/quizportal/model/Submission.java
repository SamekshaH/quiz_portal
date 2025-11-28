package com.quizportal.model;

import java.sql.Timestamp;

public class Submission {
    private int id;
    private int quizId;
    private int studentId;
    private int score;
    private Timestamp submittedAt;
    
    // Optional: to hold student name for display
    private String studentName;

    public Submission() {}

    public Submission(int id, int quizId, int studentId, int score, Timestamp submittedAt) {
        this.id = id;
        this.quizId = quizId;
        this.studentId = studentId;
        this.score = score;
        this.submittedAt = submittedAt;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getQuizId() { return quizId; }
    public void setQuizId(int quizId) { this.quizId = quizId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }

    public Timestamp getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(Timestamp submittedAt) { this.submittedAt = submittedAt; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
}

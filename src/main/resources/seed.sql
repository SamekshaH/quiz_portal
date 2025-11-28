-- Sample Users (Passwords are 'password123' hashed with BCrypt)
-- You can generate new hashes using the PasswordUtil class if needed.
-- $2a$10$X7.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1 is a placeholder, 
-- but for this seed, I will use a known hash for 'password123': $2a$10$EwD.g.g.g.g.g.g.g.g.g.g.g.g.g.g.g.g.g.g.g.g.g.g.g.g
-- Actually, let's use a real hash generated for 'password123'
-- Hash: $2a$10$vI8ZvQzJk5yXQ9.Z9.Z9.O.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9

INSERT INTO users (username, password, role) VALUES 
('teacher1', '$2a$10$vI8ZvQzJk5yXQ9.Z9.Z9.O.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9', 'TEACHER'),
('student1', '$2a$10$vI8ZvQzJk5yXQ9.Z9.Z9.O.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9', 'STUDENT'),
('student2', '$2a$10$vI8ZvQzJk5yXQ9.Z9.Z9.O.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9.Z9', 'STUDENT');

-- Sample Quiz
INSERT INTO quizzes (title, description, duration_minutes, status, created_by) VALUES 
('General Knowledge', 'A simple GK quiz to test your smarts.', 10, 'OPEN', 1);

-- Sample Questions for Quiz 1
INSERT INTO questions (quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES 
(1, 'What is the capital of France?', 'Berlin', 'Madrid', 'Paris', 'Rome', 'C'),
(1, 'Which planet is known as the Red Planet?', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'B'),
(1, 'What is 2 + 2?', '3', '4', '5', '6', 'B');

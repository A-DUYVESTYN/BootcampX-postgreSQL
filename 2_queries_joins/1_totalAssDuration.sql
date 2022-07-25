SELECT SUM(assignment_submissions.duration) as total_duration 
-- assignments.duration as assignments_duration, 
-- assignment_submissions.duration as assignment_submissions_duration 
FROM students
JOIN assignment_submissions ON student_id = students.id
WHERE students.name =  'Ibrahim Schimmel';
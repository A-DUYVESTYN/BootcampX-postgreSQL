--Get the students who's average time it takes to complete an assignment is less than the average estimated time it takes to complete an assignment.

SELECT students.name as student, 
AVG(assignment_submissions.duration) as average_assignment_duration, 
AVG(assignments.duration) as average_estimated_duration

FROM assignment_submissions
JOIN students ON student_id = students.id
JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL
-- AND AVG(assignment_submissions.duration) < AVG(assignments.duration)
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_assignment_duration ASC;
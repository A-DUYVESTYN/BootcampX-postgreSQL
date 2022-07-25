SELECT cohorts.name as cohort_name, COUNT(students.cohort_id) as student_count
FROM cohorts
JOIN students ON cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING COUNT(students.cohort_id) >= 18
ORDER BY student_count;
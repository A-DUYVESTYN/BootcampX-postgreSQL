const { Pool } = require('pg');
const { query_timeout } = require('pg/lib/defaults');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortInput = process.argv[2]

pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON students.id = student_id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = '${cohortInput}'
ORDER BY teacher;
`)
.then(res => {
  res.rows.forEach(element => {
    console.log(element.cohort,": ",element.teacher)
  });
})
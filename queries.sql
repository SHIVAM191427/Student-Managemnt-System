-- 1. Count total students per batch year
SELECT SUBSTRING(student_id, 1, 4) AS batch_year, COUNT(*) AS total_students
FROM Students
GROUP BY batch_year
ORDER BY batch_year;

-- 2. Number of students enrolled per course
SELECT c.course_name, COUNT(DISTINCT e.student_id) AS enrolled_students
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_name
ORDER BY enrolled_students DESC;

-- 3. Grade distribution per course
SELECT c.course_name, g.grade, COUNT(*) AS grade_count
FROM Grades g
JOIN Courses c ON g.course_id = c.course_id
GROUP BY c.course_name, g.grade
ORDER BY c.course_name, g.grade;

-- 4. Top instructors by number of courses taught
SELECT i.first_name, i.last_name, COUNT(*) AS courses_taught
FROM Instructors i
JOIN Courses c ON i.instructor_id = c.instructor_id
GROUP BY i.instructor_id
ORDER BY courses_taught DESC;

-- 5. Students enrolled in more than 3 courses
SELECT student_id, COUNT(course_id) AS course_count
FROM Enrollments
GROUP BY student_id
HAVING course_count > 3
ORDER BY course_count DESC;

-- 6. Course schedule summary
SELECT c.course_name, s.day_of_week, s.start_time, s.end_time
FROM Schedules s
JOIN Courses c ON s.course_id = c.course_id
ORDER BY c.course_name, s.day_of_week, s.start_time;

-- 7. Total students per grade overall
SELECT grade, COUNT(*) AS total_students
FROM Grades
GROUP BY grade
ORDER BY FIELD(grade, 'O','A+','A','B+','B','C','P','F');

-- 8. List students with their enrolled courses and grades
SELECT s.student_id, s.first_name, s.last_name, c.course_name, g.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Grades g ON s.student_id = g.student_id AND c.course_id = g.course_id
ORDER BY s.student_id, c.course_name;

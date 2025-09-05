# 🎓 Student Management System - Database Design

This project is a **Student Management System (SMS)** database design that captures and manages information about students, instructors, courses, enrollments, grades, and schedules.  
The schema ensures **data integrity**, **clear relationships**, and **scalability** for academic institutions.

---

## 📂 Table Creation Scripts

### **1. Students Table**
Stores personal details of students.

```
CREATE TABLE Students (
    student_id VARCHAR(10) PRIMARY KEY,       -- Unique student ID
    first_name VARCHAR(50),                   -- Student's first name
    last_name VARCHAR(50),                    -- Student's last name
    dob DATE,                                 -- Date of birth
    email VARCHAR(100),                       -- Student's email
    phone VARCHAR(15),                        -- Contact number
    address VARCHAR(255)                      -- Residential address
);
```

---

### **2. Instructors Table**
Stores details of the instructors.

```
CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique instructor ID
    first_name VARCHAR(50),                       -- Instructor's first name
    last_name VARCHAR(50),                        -- Instructor's last name
    department VARCHAR(50),                       -- Department the instructor belongs to
    email VARCHAR(100)                            -- Instructor's email
);
```

---

### **3. Courses Table**
Contains information about the courses offered.

```
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,                    -- Unique course ID
    course_name VARCHAR(100),                     -- Course name
    department VARCHAR(50),                       -- Department offering the course
    credits INT,                                  -- Number of credits
    instructor_id INT,                            -- Foreign key to instructor
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);
```

---

### **4. Enrollments Table**
Tracks which student is enrolled in which course per semester.

```
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique enrollment ID
    student_id VARCHAR(10),                        -- Foreign key to Students
    course_id INT,                                 -- Foreign key to Courses
    semester VARCHAR(10),                          -- Semester (Fall, Spring, etc.)
    year INT,                                      -- Enrollment year
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
```

---

### **5. Grades Table**
Stores grades students receive for each course.

```
CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique grade record ID
    student_id VARCHAR(10),                    -- Foreign key to Students
    course_id INT,                             -- Foreign key to Courses
    grade CHAR(2),                             -- Grade (e.g., A, B, C, F)
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
```

---

### **6. Schedules Table**
Stores the schedule of each course.

```
CREATE TABLE Schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique schedule record ID
    course_id INT,                                -- Foreign key to Courses
    day_of_week VARCHAR(10),                     -- Day (e.g., Monday, Tuesday)
    start_time TIME,                              -- Start time
    end_time TIME,                                -- End time
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
```

---

## 🔗 Relationships Between Tables

- **Students → Enrollments**:  
  A student can enroll in multiple courses.  
- **Courses → Instructors**:  
  Each course is taught by one instructor, but instructors can teach multiple courses.  
- **Enrollments → Grades**:  
  Each student receives one grade per course.  
- **Courses → Schedules**:  
  Each course has a defined day and time.  

---

## ✅ Conclusion

This schema is designed for **efficiency and normalization**.  
It ensures:
- Data integrity with **foreign keys**  
- Easy scalability for large institutions  
- Support for essential academic operations (enrollment, grading, scheduling)



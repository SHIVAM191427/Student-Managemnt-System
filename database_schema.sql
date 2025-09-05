-- 1. Students Table
CREATE TABLE Students (
    student_id VARCHAR(10) PRIMARY KEY,       
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,                                 
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- 2. Instructors Table
CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,  
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    email VARCHAR(100)
);

-- 3. Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,                    
    course_name VARCHAR(100),
    department VARCHAR(50),
    credits INT,                                  
    instructor_id INT,                            
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

-- 4. Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,  
    student_id VARCHAR(10),                       
    course_id INT,                                 
    semester VARCHAR(10),                          
    year INT,                                      
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 5. Grades Table
CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,  
    student_id VARCHAR(10),                    
    course_id INT,                             
    grade CHAR(2),                             
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 6. Schedules Table
CREATE TABLE Schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,  
    course_id INT,                               
    day_of_week VARCHAR(10),                     
    start_time TIME,                             
    end_time TIME,                               
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

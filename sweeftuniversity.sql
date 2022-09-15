CREATE TABLE users (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(45) NOT NULL,
    surname varchar(45) NOT NULL,
    address varchar(45) NOT NULL,
    email varchar(45) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    phone_number varchar(45) NOT NULL UNIQUE,
    sex tinyint(2) NOT NULL,
    address_second varchar(45),
    apartment_number varchar(45),
    PRIMARY KEY (id)
);

CREATE TABLE lecturers (
    id int AUTO_INCREMENT,
    user_id int,
    bank_account  varchar(45) UNIQUE NOT NULL,
    rank tinyint(3) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)  REFERENCES users(id)
);

CREATE TABLE majors(
    id int AUTO_INCREMENT,
    name varchar(45) NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE courses(
    id int AUTO_INCREMENT,
    name varchar(45) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE classes(
    id int AUTO_INCREMENT,
    name varchar(45),
    mandatory boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (major_id)  REFERENCES majors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (lecturer_id) REFERENCES lecturers(id)
);
    CREATE TABLE students(
        id int AUTO_INCREMENT,
        user_id int,
        major_id int,
        course_id int,
        PRIMARY KEY (id),
        FOREIGN KEY (user_id)  REFERENCES Users(user_id),
        FOREIGN KEY (major_id)  REFERENCES majors(id),
        FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE class_student(
    class_id,
    student_id,
    FOREIGN KEY (class_id)  REFERENCES classes(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);


/*
 select what subjects student studies and who is teaching him

SELECT u.name, u.surname, c.name, ul.name, ul.surname, l.bank_account, l.study_rank from class_student as cs
        inner join classes c on cs.class_id = c.id
        inner join students s on cs.student_id = s.id
        inner join users u on s.user_id = u.id
        inner join lecturers l on c.lecturer_id = l.id
        inner join users ul on l.user_id = ul.id
*/
/*
See on which courses and majors students are in

SELECT u.name, u.surname, m.name, c.name FROM students as s
    inner join users u on s.user_id = u.id
    inner join courses c on s.course_id = c.id
    inner join majors m on s.major_id = m.id
*/


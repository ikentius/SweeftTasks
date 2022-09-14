CREATE TABLE users (
    id int NOT NULL,
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
)

CREATE TABLE lecturers (
    id int,
    user_id int,
    bank_account  varchar(45) UNIQUE NOT NULL,
    rank tinyint(3) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)  REFERENCES Users(user_id)
)

CREATE TABLE majors(
    id int,
    name varchar(45) NOT NULL UNIQUE,
    PRIMARY KEY(id)
)

CREATE TABLE courses(
    id int,
    name varchar(45) NOT NULL,
    PRIMARY KEY (id)
)

CREATE TABLE classes(
    id int,
    name varchar(45),
    mandatory boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (major_id)  REFERENCES majors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (lecturer_id) REFERENCES lecturers(id)


)
CREATE TABLE students(
    id int,
    user_id int,
    major_id int,
    course_id int,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)  REFERENCES Users(user_id),
    FOREIGN KEY (major_id)  REFERENCES majors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
)

CREATE TABLE class_student(
    class_id,
    student_id,
    FOREIGN KEY (class_id)  REFERENCES classes(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
)

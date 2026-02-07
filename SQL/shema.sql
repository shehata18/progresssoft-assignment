-- Create MyDepartment table
CREATE TABLE MyDepartment (
    Dept_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL
);

-- Create Gender table
CREATE TABLE Gender (
    Gender_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(20) NOT NULL,
    CONSTRAINT chk_gender_name CHECK (Name IN ('Male', 'Female'))
);

-- Create University table
CREATE TABLE University (
    ID NUMBER PRIMARY KEY,
    Name VARCHAR2(200) NOT NULL
);

-- Create MyEmployee table
CREATE TABLE MyEmployee (
    ID NUMBER PRIMARY KEY,
    LAST_NAME VARCHAR2(50) NOT NULL,
    FIRST_NAME VARCHAR2(50) NOT NULL,
    HIRE_DATE DATE NOT NULL,
    USERID NUMBER UNIQUE NOT NULL,
    SALARY NUMBER NOT NULL,
    DEPT_ID NUMBER,
    Gender_ID NUMBER NOT NULL,
    University_ID NUMBER,
    EMP_IMAGE BLOB,
    MANAGER_ID NUMBER,
    JOB_TITLE VARCHAR2(50),
    CONSTRAINT fk_dept FOREIGN KEY (DEPT_ID) REFERENCES MyDepartment(Dept_ID),
    CONSTRAINT fk_gender FOREIGN KEY (Gender_ID) REFERENCES Gender(Gender_ID),
    CONSTRAINT fk_university FOREIGN KEY (University_ID) REFERENCES University(ID),
    CONSTRAINT fk_manager FOREIGN KEY (MANAGER_ID) REFERENCES MyEmployee(ID),
    CONSTRAINT chk_salary CHECK (SALARY > 0)
);
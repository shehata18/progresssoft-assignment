INSERT INTO Gender (Gender_ID, Name) VALUES (1, 'Male');
INSERT INTO Gender (Gender_ID, Name) VALUES (2, 'Female');

-- Insert sample data into MyDepartment table
INSERT INTO MyDepartment (Dept_ID, Name) VALUES (10, 'IT');
INSERT INTO MyDepartment (Dept_ID, Name) VALUES (20, 'HR');
INSERT INTO MyDepartment (Dept_ID, Name) VALUES (30, 'Sales');
INSERT INTO MyDepartment (Dept_ID, Name) VALUES (40, 'Finance');

-- Insert sample data into University table
INSERT INTO University (ID, Name) VALUES (1, 'Harvard University');
INSERT INTO University (ID, Name) VALUES (2, 'MIT');
INSERT INTO University (ID, Name) VALUES (3, 'Stanford University');
INSERT INTO University (ID, Name) VALUES (4, 'University of Jordan');

-- Insert sample data into MyEmployee table for testing
INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, DEPT_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE)
VALUES (1, 'AHMED', 'MOHAMED', TO_DATE('01/01/2020', 'DD/MM/YYYY'), 1001, 5000, 10, 1, 1, NULL, 'Manager');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, DEPT_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE)
VALUES (2, 'ALI', 'HISHAM', TO_DATE('09/09/1987', 'DD/MM/YYYY'), 1002, 4500, 10, 1, 2, 1, 'Developer');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, DEPT_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE)
VALUES (3, 'SALY', 'SHAHEEN', TO_DATE('10/10/1980', 'DD/MM/YYYY'), 1003, 3800, 20, 1, 3, 1, 'HR Specialist');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, DEPT_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE)
VALUES (4, 'RAMI', 'KHALIL', TO_DATE('24/05/1986', 'DD/MM/YYYY'), 1004, 4200, 10, 1, 4, 2, 'Developer');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, DEPT_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE)
VALUES (5, 'SARA', 'MALEK', TO_DATE('15/03/2019', 'DD/MM/YYYY'), 1005, 3500, 30, 2, 1, 1, 'Sales Representative');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, DEPT_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE)
VALUES (6, 'HASSAN', 'HAKEEM', TO_DATE('20/07/2021', 'DD/MM/YYYY'), 1006, 3200, 30, 1, 2, 1, 'Sales Representative');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, DEPT_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE)
VALUES (7, 'MAHMOUD', 'KAMAL', TO_DATE('12/11/2018', 'DD/MM/YYYY'), 1007, 6000, 40, 2, 3, NULL, 'Finance Manager');

COMMIT;

-- ========================================
-- RETRIEVE EMPLOYEE DATA WITH JOINS
-- ========================================

SELECT 
    e.FIRST_NAME || ' ' || e.LAST_NAME AS "Employee Name",
    e.SALARY AS "Salary",
    d.Name AS "Department Name",
    m.FIRST_NAME || ' ' || m.LAST_NAME AS "Manager",
    g.Name AS "Gender",
    u.Name AS "Employee University"
FROM 
    MyEmployee e
LEFT JOIN 
    MyDepartment d ON e.DEPT_ID = d.Dept_ID
LEFT JOIN 
    MyEmployee m ON e.MANAGER_ID = m.ID
INNER JOIN 
    Gender g ON e.Gender_ID = g.Gender_ID
LEFT JOIN 
    University u ON e.University_ID = u.ID;

-- ========================================
-- TOTAL MONTHLY SALARY BY JOB TITLE
-- ========================================

SELECT 
    JOB_TITLE,
    SUM(SALARY) AS "Total Monthly Salary"
FROM 
    MyEmployee
WHERE 
    UPPER(JOB_TITLE) NOT LIKE '%SALES%'
GROUP BY 
    JOB_TITLE
HAVING 
    SUM(SALARY) > 2500
ORDER BY 
    "Total Monthly Salary" DESC;


-- ========================================
-- IDENTIFY CODING ERRORS
-- ========================================

/*
Original Statement:
SELECT empno, ename,
salary x 12 ANNUAL SALARY; FROM emp;

ERRORS IDENTIFIED:

1. Missing multiplication operator (*)
   - "salary x 12" should be "salary * 12"
   
2. Column alias needs quotes or underscore
   - "ANNUAL SALARY" should be "ANNUAL_SALARY" or "ANNUAL SALARY" (in quotes)
   
3. Semicolon in wrong position
   - Semicolon should be at the end, not before FROM
   
4. Incorrect statement structure
   - FROM clause should come before the semicolon

CORRECTED STATEMENT:
*/

SELECT 
    empno, 
    ename,
    salary * 12 AS ANNUAL_SALARY
FROM 
    emp;

-- Alternative with quoted alias:
SELECT 
    empno, 
    ename,
    salary * 12 AS "ANNUAL SALARY"
FROM 
    emp;
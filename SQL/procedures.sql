-- ========================================
-- ORACLE FUNCTION - F_HR_QUERY
-- ========================================

CREATE OR REPLACE FUNCTION F_HR_QUERY
RETURN SYS_REFCURSOR
IS
    v_scott_hire_date DATE;
    result_cursor SYS_REFCURSOR;
BEGIN
    -- Get SCOTT's hire date
    SELECT HIRE_DATE
    INTO v_scott_hire_date
    FROM MyEmployee
    WHERE UPPER(LAST_NAME) = 'SCOTT';
    
    -- Open cursor with employees hired after SCOTT
    OPEN result_cursor FOR
        SELECT 
            FIRST_NAME || ' ' || LAST_NAME AS Employee_Name,
            HIRE_DATE
        FROM 
            MyEmployee
        WHERE 
            HIRE_DATE > v_scott_hire_date
        ORDER BY 
            HIRE_DATE;
    
    RETURN result_cursor;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee SCOTT not found');
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END F_HR_QUERY;
/


/

-- How to test the function:
/*
DECLARE
    emp_cursor SYS_REFCURSOR;
    v_name VARCHAR2(100);
    v_hire_date DATE;
BEGIN
    emp_cursor := F_HR_QUERY;
    
    DBMS_OUTPUT.PUT_LINE('Employees hired after SCOTT:');
    DBMS_OUTPUT.PUT_LINE('----------------------------');
    
    LOOP
        FETCH emp_cursor INTO v_name, v_hire_date;
        EXIT WHEN emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Hire Date: ' || TO_CHAR(v_hire_date, 'DD/MM/YYYY'));
    END LOOP;
    
    CLOSE emp_cursor;
END;
/
*/

-- ========================================
-- ORACLE PROCEDURE - P_COPY_EMPLOYEE
-- ========================================

-- First, create the target table
CREATE TABLE MyEmployee_update AS
SELECT * FROM MyEmployee WHERE 1=0;  -- Creates structure without data

-- Create the procedure
CREATE OR REPLACE PROCEDURE P_COPY_EMPLOYEE
IS
    v_count NUMBER;
BEGIN
    -- Clear existing data in target table
    DELETE FROM MyEmployee_update;
    
    -- Copy all data from MyEmployee to MyEmployee_update
    INSERT INTO MyEmployee_update
    SELECT * FROM MyEmployee;
    
    -- Get count of inserted records
    v_count := SQL%ROWCOUNT;
    
    -- Commit the transaction
    COMMIT;
    
    -- Display success message
    DBMS_OUTPUT.PUT_LINE('Successfully copied ' || v_count || ' records from MyEmployee to MyEmployee_update');
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
        RAISE;
END P_COPY_EMPLOYEE;
/

-- How to execute the procedure:
-- EXEC P_COPY_EMPLOYEE;

-- Verify the copy:
-- SELECT COUNT(*) FROM MyEmployee_update;

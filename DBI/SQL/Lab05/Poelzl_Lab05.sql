--1
CREATE OR REPLACE FUNCTION GetManager(p_abteilung departments.department_id%TYPE)
RETURN VARCHAR2
AS
    v_first_name employees.first_name%TYPE;
    v_last_name employees.last_name%TYPE;
BEGIN
    SELECT first_name, last_name INTO v_first_name, v_last_name
    FROM departments INNER JOIN employees ON departments.manager_id = employees.employee_id
    WHERE departments.department_id like p_abteilung;
    RETURN  v_first_name || ' ' || v_last_name;
END;
/

SELECT GetManager(10)
FROM SYS.dual;

--2
CREATE OR REPLACE FUNCTION GetJobs(p_mitarbeiterNr employees.employee_id%TYPE)
RETURN INT
AS
    v_jobCount INT DEFAULT 0;
BEGIN
    SELECT COUNT(job_history.job_id) INTO v_jobCount 
    FROM employees INNER JOIN job_history on job_history.employee_id = employees.employee_id
    WHERE employees.employee_id like p_mitarbeiterNr;
    RETURN  v_jobCount;
END;
/

SELECT GetJobs(101)Prozeduren

FROM SYS.dual;

--3
CREATE OR REPLACE PROCEDURE Gehaltserhoehung (p_erhoehung DECIMAL, p_mitarbeiterID employees.employee_id%TYPE)
AS 
BEGIN
  UPDATE employees
  SET employees.salary = employees.salary + p_erhoehung
  WHERE employees.employee_id like p_mitarbeiterID;
END;
/

DECLARE
    v_mitarbeiterID employees.employee_id%TYPE := 200;
    v_gehalt employees.salary%TYPE;
    
BEGIN
    SELECT salary INTO v_gehalt FROM employees WHERE employee_id like v_mitarbeiterid;
    DBMS_OUTPUT.put_line(v_gehalt);
    Gehaltserhoehung(10, v_mitarbeiterid);
    SELECT salary INTO v_gehalt FROM employees WHERE employee_id like v_mitarbeiterid;
    DBMS_OUTPUT.put_line(v_gehalt);
END;
/

--4
CREATE OR REPLACE FUNCTION Lsubstr(p_eingabe varchar2, p_zeichen char)
RETURN VARCHAR2
AS
BEGIN
    RETURN  SUBSTR(p_eingabe, 0, INSTR(p_eingabe, p_zeichen)-1);
END;
/

SELECT phone_number, Lsubstr(phone_number, '.')
FROM employees;

set SERVEROUTPUT ON;

--1
CREATE OR REPLACE PROCEDURE Gehaltserhoehung (p_employeeID employees.employee_id%TYPE)
AS 
    v_years INT;
    v_increase DECIMAL(4,2);
BEGIN
    SELECT EXTRACT(YEAR FROM (CURRENT_DATE)) - EXTRACT(YEAR FROM (hire_date)) INTO v_years
    FROM employees 
    WHERE employee_id like p_employeeID;

    CASE
        WHEN v_years > 7 THEN
            v_increase := 1.25;
        WHEN v_years > 4 THEN
            v_increase := 1.12;
        ELSE
            v_increase := 1.09;
    END CASE;

    UPDATE employees
    SET employees.salary = employees.salary*v_increase
    WHERE employees.employee_id like p_employeeID;
END;
/

DECLARE
    v_employeeID employees.employee_id%TYPE := 101;
    v_salary employees.salary%TYPE;

BEGIN
    SELECT salary INTO v_salary FROM employees WHERE employee_id like v_employeeID;
    DBMS_OUTPUT.put_line('gehalt vorher: ' || v_salary);
    Gehaltserhoehung(v_employeeID);
    SELECT salary INTO v_salary FROM employees WHERE employee_id like v_employeeID;
    DBMS_OUTPUT.put_line('gehalt nachher: ' || v_salary);
END;
/

--2
CREATE OR REPLACE PROCEDURE Provisionsprozentsatz (p_employeeID employees.employee_id%TYPE)
AS 
    v_years INT;
    v_salary employees.salary%TYPE;
    v_increase DECIMAL(4,2);
BEGIN
    SELECT salary, EXTRACT(YEAR FROM (CURRENT_DATE)) - EXTRACT(YEAR FROM (hire_date)) INTO v_salary, v_years
    FROM employees 
    WHERE employee_id like p_employeeID;

    CASE
        WHEN v_salary > 9000 THEN
            v_increase := 0.45;
        WHEN v_years >= 7 THEN
            v_increase := 0.32;
        WHEN v_salary <= 2500  THEN
            v_increase := 0.24;
        ELSE
            v_increase := 0.09;
    END CASE;

    UPDATE employees
    SET employees.commission_pct = v_increase
    WHERE employees.employee_id like p_employeeID;
END;
/

DECLARE
    v_employeeID employees.employee_id%TYPE := 200;
    v_commission_pct employees.commission_pct%TYPE;
    v_salary employees.salary%TYPE;

BEGIN
    SELECT commission_pct, salary INTO v_commission_pct, v_salary FROM employees WHERE employee_id like v_employeeID;
    DBMS_OUTPUT.put_line('Gehalt: ' ||  v_salary);
    DBMS_OUTPUT.put_line(v_commission_pct);
    Provisionsprozentsatz(v_employeeID);
    SELECT commission_pct, salary INTO v_commission_pct, v_salary FROM employees WHERE employee_id like v_employeeID;
    DBMS_OUTPUT.put_line('Gehalt: ' || v_salary);
    DBMS_OUTPUT.put_line(v_commission_pct);
END;
/

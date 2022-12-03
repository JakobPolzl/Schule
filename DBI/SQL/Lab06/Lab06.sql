
--1
CREATE OR REPLACE PROCEDURE Gehaltserhoehung (p_erhoehung DECIMAL, p_mitarbeiterID employees.employee_id%TYPE)
AS 
BEGIN
    Select 
    CASE
            WHEN  > 7 THEN
                dbms_output.Put_line('25');
            WHEN v_jahr > 4 THEN
                dbms_output.Put_line('25');
            ELSE
                dbms_output.Put_line('9');
    END CASE;
  UPDATE employees
  SET employees.salary = employees.salary * p_erhoehung
  WHERE employees.employee_id like p_mitarbeiterID;
END;

DECLARE
    v_mId employees.employee_id%TYPE :=
    v_jahr INTEGER := 0;
    BEGIN
        CASE
            WHEN v_jahr > 7 THEN
                dbms_output.Put_line('25');
            WHEN v_jahr > 4 THEN
                dbms_output.Put_line('25');
            ELSE
                dbms_output.Put_line('9');
        END CASE;
END;
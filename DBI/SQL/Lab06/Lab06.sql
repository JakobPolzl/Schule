--1
CREATE OR REPLACE PROCEDURE Gehaltserhoehung (p_erhoehung DECIMAL, p_mitarbeiterID employees.employee_id%TYPE)
AS 
BEGIN
  UPDATE employees
  SET employees.salary = employees.salary * p_erhoehung
  WHERE employees.employee_id like p_mitarbeiterID;
END;

DECLARE
    v_jahr INTEGER := ;
    BEGIN
        CASE
            WHEN v_jahr < 5 THEN
                
            WHEN v_jahr < 20 THEN
                dbms_output.Put_line('Cold');
            ELSE
                dbms_output.Put_line('Warm');
        END CASE;
END;
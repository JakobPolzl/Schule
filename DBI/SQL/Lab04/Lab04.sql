Set SERVEROUTPUT ON;
--1
DECLARE
    firstName employees.first_name%TYPE;
    lastName employees.last_name%TYPE;
    hireDate employees.hire_date%TYPE := '13.01.2000';
BEGIN
    SELECT first_name, last_name
    INTO firstName, lastName
    FROM employees
    WHERE hire_date LIKE hireDate;
    dbms_output.Put_line('Mitarbeiter: ' || To_char(lastName)|| ' ' || To_char(firstName));
END;
/

--2
DECLARE
    countryName countries.country_name%TYPE := 'Argentina';
    regionName regions.region_name%TYPE;
BEGIN
    SELECT region_name
    INTO regionName
    FROM countries INNER JOIN regions on countries.region_id = regions.region_id
    WHERE country_name LIKE countryName;
    dbms_output.Put_line('Regionsbezeichnung vom ' || countryName || ': ' || regionName);
END;
/

--3
DECLARE
    countryName countries.country_name%TYPE := 'HongKong';
BEGIN
    DELETE 
    FROM countries
    WHERE country_name LIKE countryName;
END;
/

--4
DECLARE
    firstName employees.first_name%TYPE;
    lastName employees.last_name%TYPE;
BEGIN
    SELECT first_name, last_name
    INTO firstName, lastName
    FROM employees
    WHERE hire_date LIKE (SELECT min(hire_date) FROM employees);
    dbms_output.Put_line('Mitarbeiter: ' || To_char(lastName)|| ' ' || To_char(firstName));
END
;
/

--5
DECLARE
    managerFirstName employees.first_name%TYPE := 'Steven';
    managerLastName employees.last_name%TYPE := 'King';
BEGIN
    UPDATE employees
    SET salary = salary*1.1
    WHERE manager_id LIKE (SELECT manager_id FROM employees WHERE first_name LIKE managerFirstName and last_name LIKE managerLastName);
END;
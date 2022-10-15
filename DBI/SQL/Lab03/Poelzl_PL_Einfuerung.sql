SET SERVEROUTPUT ON
DECLARE 
    radius DECIMAL(8,3) := 10;
    umfang DECIMAL(10,3) := 0;
    flaeche DECIMAL(10,3) := 0;
BEGIN
   flaeche := radius * radius * 3.141592654;
   umfang := 2 * radius * 3.141592654;
   dbms_output.Put_line ('Fläche: ' || flaeche || '    Umfang: ' || umfang);
   
END
;







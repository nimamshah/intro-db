CREATE OR REPLACE PACKAGE Domination AS -- spec
  PROCEDURE GetThem (input_person VARCHAR2, percentage NUMBER);
END Domination;
/
 
CREATE OR REPLACE PACKAGE BODY Domination AS -- body
  PROCEDURE GetThem (input_person VARCHAR2, percentage NUMBER) IS
  BEGIN
    dbms_output.put_line('Yayyyy...');
  END;
END Domination;
/
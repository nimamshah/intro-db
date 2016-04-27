CREATE OR REPLACE PACKAGE Domination AS -- spec
  PROCEDURE GetThem (input_person VARCHAR2, percentage NUMBER);
END Domination;
/

CREATE OR REPLACE PACKAGE BODY Domination AS -- body
  PROCEDURE GetThem (input_person VARCHAR2, percentage NUMBER) AS
  /*DECLARE 
    CURSOR flowers_seen IS
      SELECT name
      FROM sightings
      WHERE person = input_person;*/
  CURSOR flowers_seen_cur IS
    SELECT name
    FROM sightings
    WHERE person = input_person;
  
  flowers_seen_t flowers_seen_cur%ROWTYPE;
  TYPE flowers_seen_ntt IS TABLE OF flowers_seen_t%TYPE;
  l_flowers_seen flowers_seen_ntt;
  /*SELECT name
  FROM sightings
  WHERE person = input_person
  
  INTERSECT 
  
  SELECT name
  FROM sightings*/
  
  
  BEGIN
    OPEN flowers_seen_cur;
    FETCH flowers_seen_cur BULK COLLECT INTO l_flowers_seen;
    CLOSE flowers_seen_cur;
    
    FOR i IN 1..l_flowers_seen.COUNT LOOP
      dbms_output.put_line(l_flowers_seen(i).name);
    END LOOP;
    
    /*SELECT
    INTO
    FROM sightings
    WHERE 
    SELECT name
    FROM sightings
    WHERE person = input_person;*/
    
  END;
END Domination;
/
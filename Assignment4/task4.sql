CREATE OR REPLACE PACKAGE Domination AS -- spec
  PROCEDURE GetThem (input_person VARCHAR2, percentage NUMBER);
END Domination;
/

CREATE OR REPLACE PACKAGE BODY Domination AS -- body
  PROCEDURE GetThem (input_person VARCHAR2, percentage NUMBER) AS
  CURSOR people_cur IS
    SELECT DISTINCT person
    FROM sightings;
  
  people_t people_cur%ROWTYPE;
  TYPE people_ntt IS TABLE OF people_t%TYPE;
  l_people people_ntt;
  
  matches NUMBER;
  individ NUMBER;
  
  BEGIN
    OPEN people_cur;
    FETCH people_cur BULK COLLECT INTO l_people;
    CLOSE people_cur;
    
    dbms_output.put_line('These people are ' || percentage*100 || '% dominated by ' || input_person || ':');
    FOR i IN 1..l_people.COUNT LOOP
      --dbms_output.put_line('Current person: ' || l_people(i).person);
      
      -- Count flowers in common for input_person and other people
      SELECT COUNT(name)
      INTO matches
      FROM
        (SELECT DISTINCT sightings.name, sightings.person
        FROM sightings
        INNER JOIN 
          (SELECT name
          FROM sightings
          WHERE person = input_person) curr_person_sightings
        ON sightings.name = curr_person_sightings.name)
      WHERE person = l_people(i).person;
      --dbms_output.put_line('Matches: ' || matches);
      
      SELECT COUNT(name)
      INTO individ
      FROM 
        (SELECT DISTINCT name, person
        FROM sightings)
      WHERE person = l_people(i).person;
      --dbms_output.put_line('Individual: ' || individ);
      
      IF matches/individ >= percentage THEN
        dbms_output.put_line(l_people(i).person);
      END IF;
      
    END LOOP;
    
  END;
END Domination;
/
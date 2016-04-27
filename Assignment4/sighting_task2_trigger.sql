CREATE OR REPLACE TRIGGER task2_insert_sighting
BEFORE INSERT ON sightings
FOR EACH ROW
DECLARE 
  comname_cnt number;
  genus_cnt number;
  species_cnt number;
  newGen flowers.genus%TYPE;
  newSpec flowers.species%TYPE;
  newCName flowers.comname%TYPE;
BEGIN
  SELECT COUNT(comname)
  INTO comname_cnt
  FROM flowers
  WHERE comname = :NEW.name;
  
  IF comname_cnt = 0 THEN
    newGen := SUBSTR(:NEW.name, 1, INSTR(:NEW.name, ' ')-1);
    newSpec := SUBSTR(:NEW.name, INSTR(:NEW.name, ' ')+1);
    
    SELECT COUNT(genus)
    INTO genus_cnt
    FROM flowers
    WHERE genus = newGen;
    
    SELECT COUNT(species)
    INTO species_cnt
    FROM flowers
    WHERE species = newSpec;
    
    IF genus_cnt > 0 AND species_cnt > 0 THEN
      BEGIN
        SELECT comname
        INTO newCName
        FROM flowers
        WHERE genus = newGen AND
              species = newSpec;
      END;
      dbms_output.put_line('Your insert into the SIGHTINGS table seemed to use the Latin name ' ||''''|| :NEW.name ||''''|| ' for the flower ' ||''''|| newCName ||''''|| '. I used the common name instead.');
      :NEW.name := newCName;
    END IF;
  END IF;    
END;
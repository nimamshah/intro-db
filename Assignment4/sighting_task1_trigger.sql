CREATE OR REPLACE TRIGGER task1_insert_sighting
BEFORE INSERT ON SIGHTINGS
FOR EACH ROW
DECLARE
  counter number;
BEGIN
  SELECT COUNT(location)
  INTO counter
  FROM features
  WHERE location = :NEW.location;
  
  IF counter = 0 THEN
    INSERT INTO features VALUES (:NEW.location, 'UNKNOWN', NULL, NULL, NULL, NULL);
    dbms_output.put_line('Warning: Insert into the SIGHTINGS table references location ' ||''''|| :NEW.location ||''''|| ' that is not found in the database');
  END IF;
END;
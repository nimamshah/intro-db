CREATE OR REPLACE TRIGGER task1_insert_sighting
BEFORE INSERT ON SIGHTINGS
FOR EACH ROW
DECLARE
  counter number;
  SpCh_loc features.location%TYPE;
BEGIN
  SELECT location
  INTO SpCh_loc
  FROM features
  GROUP BY location
  HAVING UTL_MATCH.EDIT_DISTANCE(location, :NEW.location) = 
    (SELECT MIN(UTL_MATCH.EDIT_DISTANCE(location, :NEW.location)) AS minDist
    FROM features) AND
    UTL_MATCH.EDIT_DISTANCE(location, :NEW.location) <= 2;

  SELECT COUNT(location)
  INTO counter
  FROM features
  WHERE location = SpCh_loc;
  
  IF counter = 0 THEN
    INSERT INTO features VALUES (SpCh_loc, 'UNKNOWN', NULL, NULL, NULL, NULL);
    dbms_output.put_line('Warning: Insert into the SIGHTINGS table references location ' ||''''|| :NEW.location ||''''|| ' that is not found in the database');
  ELSE
    :NEW.location := SpCh_loc;
  END IF;
END;
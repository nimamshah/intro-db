INSERT 
INTO SIGHTINGS 
VALUES ('Sky pilot', 'Person X', 'Grouse Meadow', TO_DATE('18-Aug-06', 'DD-MON-YY'));

INSERT 
INTO SIGHTINGS 
VALUES ('Hoar buckwheat', 'Person X', 'Grouse Meadow', TO_DATE('18-Aug-06', 'DD-MON-YY'));

INSERT 
INTO SIGHTINGS 
VALUES ('Zigadenus venenosus', 'Person X', 'Grouse Meadow', TO_DATE('18-Aug-06', 'DD-MON-YY'));

INSERT 
INTO SIGHTINGS 
VALUES ('Carex limosa', 'Person Y', 'Grouse Meadow', TO_DATE('18-Aug-06', 'DD-MON-YY'));

INSERT 
INTO SIGHTINGS 
VALUES ('Draperia', 'Person Z', 'Grouse Meadow', TO_DATE('18-Aug-06', 'DD-MON-YY'));


SELECT * 
FROM SIGHTINGS
WHERE PERSON = 'Person X' or PERSON = 'Person Y' or PERSON = 'Person Z';
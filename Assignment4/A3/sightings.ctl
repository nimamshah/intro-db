LOAD DATA INFILE 'sightings.dat' APPEND INTO TABLE SIGHTINGS FIELDS TERMINATED BY ','(NAME ENCLOSED BY "'", PERSON ENCLOSED BY "'", LOCATION ENCLOSED BY "'", SIGHTED DATE 'DD-MON-YY')
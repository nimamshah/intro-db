LOAD DATA INFILE 'features.dat' APPEND INTO TABLE FEATURES FIELDS TERMINATED BY ','(LOCATION ENCLOSED BY "'", CLASS ENCLOSED BY "'", LATITUDE, LONGITUDE, MAP ENCLOSED BY "'", ELEV)

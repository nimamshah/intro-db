LOAD DATA INFILE 'climbed.dat' APPEND INTO TABLE CLIMBED FIELDS TERMINATED BY ','(TRIP_ID,PEAK ENCLOSED BY "'",WHEN DATE 'MM/DD/YYYY')
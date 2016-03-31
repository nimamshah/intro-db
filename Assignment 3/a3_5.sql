SELECT DISTINCT peak.NAME
FROM climbed, participated, peak
WHERE participated.NAME = 'JOHN'             AND
      participated.TRIP_ID = climbed.TRIP_ID AND
      climbed.PEAK = peak.NAME               AND
      peak.ELEV > 14000;
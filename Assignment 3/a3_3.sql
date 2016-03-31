SELECT NAME
FROM participated
WHERE TRIP_ID = 
      (SELECT TRIP_ID
      FROM peak, climbed
      WHERE peak.DIFF = 5 AND
            peak.NAME = climbed.PEAK);
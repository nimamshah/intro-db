SELECT PEAK
FROM participated, climbed
WHERE participated.NAME = 'MARK' AND
      participated.TRIP_ID = climbed.TRIP_ID;
SELECT PEAK
FROM participated, climbed
WHERE participated.NAME = 'MARK' AND
      participated.TRIP_ID = climbed.TRIP_ID

INTERSECT

SELECT PEAK
FROM participated, climbed
WHERE participated.NAME = 'MARY' AND
      participated.TRIP_ID = climbed.TRIP_ID;
SELECT climber.NAME, COUNT(PEAK)
FROM climber, participated, climbed
WHERE climber.NAME = participated.NAME AND
      participated.TRIP_ID = climbed.TRIP_ID AND
      climbed.WHEN BETWEEN climbed.WHEN AND climbed.WHEN + 60
GROUP BY climber.NAME
HAVING COUNT(PEAK) > 20;
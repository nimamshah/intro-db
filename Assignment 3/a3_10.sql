SELECT participated.TRIP_ID, SUM(ELEV)
FROM participated
INNER JOIN
      (SELECT *
      FROM climbed, peak
      WHERE climbed.PEAK = peak.NAME) elevation
ON participated.TRIP_ID = elevation.TRIP_ID
GROUP BY participated.TRIP_ID
HAVING SUM(elev) >= 500000;

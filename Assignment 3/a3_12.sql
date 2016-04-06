SELECT NAME
FROM 
      (SELECT DISTINCT NAME, notMaria.PEAK AS NMPEAK, Maria.PEAK AS MPEAK
      FROM
            (SELECT DISTINCT climber.NAME, participated.TRIP_ID, PEAK
            FROM climber, participated, climbed
            WHERE climber.NAME <> 'MARIA' AND
                  climber.NAME = participated.NAME AND
                  participated.TRIP_ID = climbed.TRIP_ID) notMaria
      RIGHT JOIN
            (SELECT PEAK
            FROM climber, participated, climbed
            WHERE climber.NAME = 'MARIA' AND
                  climber.NAME = participated.NAME AND
                  participated.TRIP_ID = climbed.TRIP_ID) Maria
      ON notMaria.PEAK = Maria.PEAK) matches
GROUP BY matches.NAME
HAVING COUNT(matches.NMPEAK) = 5;
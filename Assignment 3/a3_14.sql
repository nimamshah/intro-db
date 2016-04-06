SELECT NAME1, NAME2, COUNT(PEAK) AS NUM_PEAKS
FROM climbed
INNER JOIN 
      (SELECT NAME1, NAME2, cr1.TRIP_ID
      FROM
            (SELECT climber.NAME AS NAME1, TRIP_ID
            FROM climber, participated
            WHERE climber.NAME = participated.NAME) cr1
      INNER JOIN
            (SELECT climber.NAME AS NAME2, TRIP_ID
            FROM climber, participated
            WHERE climber.NAME = participated.NAME) cr2
      ON cr1.NAME1 != cr2.NAME2 AND cr1.TRIP_ID = cr2.TRIP_ID) pairs
ON climbed.TRIP_ID = pairs.TRIP_ID
GROUP BY NAME1, NAME2
HAVING COUNT(PEAK) = (
      SELECT MAX(CNT)
      FROM (
            SELECT NAME1, NAME2, COUNT(PEAK) AS CNT
            FROM climbed
            INNER JOIN 
                  (SELECT NAME1, NAME2, cr1.TRIP_ID
                  FROM
                        (SELECT climber.NAME AS NAME1, TRIP_ID
                        FROM climber, participated
                        WHERE climber.NAME = participated.NAME) cr1
                  INNER JOIN
                        (SELECT climber.NAME AS NAME2, TRIP_ID
                        FROM climber, participated
                        WHERE climber.NAME = participated.NAME) cr2
                  ON cr1.NAME1 != cr2.NAME2 AND cr1.TRIP_ID = cr2.TRIP_ID) pairs
            ON climbed.TRIP_ID = pairs.TRIP_ID
            GROUP BY NAME1, NAME2));
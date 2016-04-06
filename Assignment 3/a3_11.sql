SELECT trips.SEX, peaksClimbed/gender
FROM 
      (SELECT SEX, COUNT(PEAK) AS peaksClimbed
      FROM climbed
      INNER JOIN
            (SELECT climber.NAME, SEX, TRIP_ID
            FROM climber, participated
            WHERE climber.NAME = participated.NAME) peaks
      ON climbed.TRIP_ID = peaks.TRIP_ID
      GROUP BY SEX) trips
INNER JOIN
      (SELECT SEX, COUNT(NAME) AS gender
      FROM climber
      GROUP BY SEX) people
ON trips.SEX = people.SEX;
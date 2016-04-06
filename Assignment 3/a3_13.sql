SELECT REGION, FRAC
FROM 
      (SELECT pks.REGION, peaksClimbed/peaksTotal AS FRAC
      FROM
            (SELECT REGION, COUNT(NAME) AS peaksTotal
            FROM peak
            GROUP BY REGION) pks
      INNER JOIN
            (SELECT REGION, COUNT(NAME) AS peaksClimbed
            FROM 
                  (SELECT DISTINCT REGION, NAME
                  FROM climbed, peak
                  WHERE climbed.PEAK = peak.NAME)
            GROUP BY REGION) cd_pk
      ON pks.REGION = cd_pk.REGION) all_reg
WHERE FRAC =
      (SELECT MAX(peaksClimbed/peaksTotal) AS MAX_FRAC
      FROM
            (SELECT REGION, COUNT(NAME) AS peaksTotal
            FROM peak
            GROUP BY REGION) pks
      INNER JOIN
            (SELECT REGION, COUNT(NAME) AS peaksClimbed
            FROM 
                  (SELECT DISTINCT REGION, NAME
                  FROM climbed, peak
                  WHERE climbed.PEAK = peak.NAME)
            GROUP BY REGION) cd_pk
      ON pks.REGION = cd_pk.REGION);
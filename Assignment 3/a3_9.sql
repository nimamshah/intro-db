SELECT peak.REGION, COUNT(peak.NAME)
FROM peak
INNER JOIN 
      (SELECT NAME
      FROM peak
      
      MINUS
      
      SELECT PEAK
      FROM climbed) diff
ON peak.NAME = diff.NAME
GROUP BY peak.REGION;

SELECT MAP, AVG(ELEV)
FROM peak
GROUP BY MAP
ORDER BY AVG(ELEV);
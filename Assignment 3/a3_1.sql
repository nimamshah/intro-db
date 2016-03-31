SELECT NAME
FROM climbed, participated
WHERE climbed.PEAK = 'Pilot Knob (S)' AND
      climbed.TRIP_ID = participated.TRIP_ID;
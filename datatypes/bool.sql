select year,
         format('%s %s', forename, surname) as name,
         count(*) as ran,
         count(*) filter(where position = 1) as won,
         count(*) filter(where position is not null) as finished,
         sum(points) as points
    from races
         join results using(raceid)
         join drivers using(driverid)
group by year, drivers.driverid
  having bool_and(position = 1) is true
order by year, points desc;


/*
The main thing about booleans is the set of operators to use with them:

    The = doesn’t work as we think it would.
    Use is to test against literal true, false, or null rather than =.
    Remember to use the is distinct from and is not distinct from operators when we need them.
    Booleans can be aggregated thanks to bool_and and bool_or.
*/


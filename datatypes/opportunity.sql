  select name,
         substring(timezone, '/(.*)') as tz,
         count(*)
    from hashtag
    
         left join lateral
         (
            select *
              from geonames
          order by location <-> hashtag.location
             limit 1
         )
         as geoname
         on true
  
   where hashtags @> array['#Hiring', '#Retail']
   
group by name, tz
order by count desc
   limit 10;



   /*  

   PostgreSQL arrays are very powerful, and GIN indexing support makes them efficient to work with. Nonetheless, it’s still not so efficient that we would replace a lookup table with an array in situations where we do a lot of lookups.

Also, some PostgreSQL array functions show a quadratic behavior: looping over array elements is inefficient, so learn to use unnest() instead and filter elements with a where clause. If we see ourselves doing that a lot, it might be a good sign that we really needed a lookup table!
*/
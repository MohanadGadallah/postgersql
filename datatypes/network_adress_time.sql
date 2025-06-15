/*
https://www.postgresql.org/docs/current/datatype-net-types.html

https://www.postgresql.org/docs/current/functions-net.html







we can use the set_masklen() function, which allows us to transform an IP address into an arbitrary CIDR network address:
*/

select distinct on (ip)
       ip,
       set_masklen(ip, 24) as inet_24,
       set_masklen(ip::cidr, 24) as cidr_24
  from access_log
 limit 10;

/*
Analyze data

Equipped with this set_masklen() function, it’s now easy to analyze our access logs using arbitrary CIDR network definitions.

*/
  select set_masklen(ip::cidr, 24) as network,
         count(*) as requests,
         array_length(array_agg(distinct ip), 1) as ipcount
    from access_log
group by network
  having array_length(array_agg(distinct ip), 1) > 1
order by requests desc, ipcount desc;
/*                     
8.1. Numeric Types
https://www.postgresql.org/docs/current/datatype-numeric.html

When using real or double precision data types, never use them to deal with money. Use either numeric, which provides arbitrary precision, or an integer-based representation of the money.


CREATE SEQUENCE

https://www.postgresql.org/docs/current/sql-createsequence.html

8.4. Binary Data Types

https://www.postgresql.org/docs/current/datatype-binary.html
*/
select pg_column_size(uuid '5255f326-cb5d-43fc-a822-52051e783408')
       as uuid_bytes,

       pg_column_size('5255f326-cb5d-43fc-a822-52051e783408')
       as uuid_string_bytes;



----- timezone


begin;

drop table if exists tstz;

create table tstz(ts timestamp, tstz timestamptz);

set timezone to 'Europe/Paris';
select now();
insert into tstz values(now(), now());

set timezone to 'Pacific/Tahiti';
select now();
insert into tstz values(now(), now());

set timezone to 'Europe/Paris';
table tstz;

set timezone to 'Pacific/Tahiti';
table tstz;

commit;
---- time inteerval 

set intervalstyle to postgres;

select interval '1 month',
       interval '2 weeks',
       2 * interval '1 week',
       78389 * interval '1 ms';


-- month

select d::date as month,

       (d + interval '1 month' - interval '1 day')::date as month_end,

       (d + interval '1 month')::date as next_month,

       (d + interval '1 month')::date - d::date as days

  from generate_series(
                       date '2017-01-01',
                       date '2017-12-01',
                       interval '1 month'
                      )
       as t(d);


--- checkthis https://www.postgresql.org/docs/current/functions-formatting.html
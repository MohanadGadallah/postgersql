with vars as (
 select DATE '2017-02-01' as start_date
),


computed_data as (
  select
    calendar.date::date as date,
    to_char(calendar.date, 'Dy') as day,
    coalesce(f.dollars, 0) as dollars,
    lag(f.dollars, 2) over (
    	partition by extract(ISODOW from calendar.date)
      order by calendar.date
    ) as dollars_two_weeks_before
  from vars,
       GENERATE_SERIES(
         vars.start_date - INTERVAL '2 weeks',
         vars.start_date + INTERVAL '1 month' - INTERVAL '1 day',
         INTERVAL '1 day'
       ) as calendar(date)
       left join factbook f using (date)
)

select
  date,
  day,
  to_char(coalesce(dollars, 0), 'L99G999G999G999') as dollars,
  case
    when dollars is not null and dollars <> 0 and dollars_two_weeks_before is not null then
      round(
        100.0 * (dollars - dollars_two_weeks_before) / dollars,
        2
      )
  end as "Fortnight %"
from computed_data
where date >= DATE '2017-02-01'
order by date;

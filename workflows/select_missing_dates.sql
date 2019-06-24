with days as
(
    -- Generate series of dates from start until now
    select dd, extract(DOW from dd) dw
    from generate_series('2019-04-1'::date, now()::date, '1 day'::interval) dd
)
select to_char(dd, 'YYYY-MM-DD') as date
from   days
where  dw not in (6,0) -- without weekends
AND (
  dd NOT IN (
    SELECT to_timestamp(to_char(trans_date, 'YYYY-MM-DD'), 'YYYY-MM-DD') as trans_date from transactions WHERE source_id=1 GROUP BY trans_date
  )
  OR dd NOT IN
  (
    SELECT to_timestamp(to_char(trans_date, 'YYYY-MM-DD'), 'YYYY-MM-DD') as trans_date from transactions WHERE source_id=2 GROUP BY trans_date
  )
)
;

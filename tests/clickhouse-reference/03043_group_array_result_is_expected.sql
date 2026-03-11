select
  groupArray(key) as keys,
  count() as c
from
  (
  select
    *,
    eventDate as key
  from
    (
    select
      eventDate
    from
      (
      select
        eventDate
      from
        fill_ex final
      where
        eventDate >= toDate('2021-07-01')
        and eventDate<toDate('2021-07-30')
      order by
        eventDate )
    order by
      eventDate with fill
    from
      toDate('2021-07-01') to toDate('2021-07-30') )
  order by
    eventDate );

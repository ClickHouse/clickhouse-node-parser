-- https://github.com/ClickHouse/ClickHouse/issues/27115
SET enable_analyzer=1;
create table fill_ex (
  eventDate Date ,
  storeId String
)
engine = ReplacingMergeTree()
partition by toYYYYMM(eventDate)
order by (storeId,eventDate);
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

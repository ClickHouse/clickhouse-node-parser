select startsWith(trimLeft(explain),'Resize') as resize from (explain pipeline select * from file(data_02723.csv)) where resize;
select match(arrayStringConcat(groupArray(explain), ''), '.*Resize 1 → 2 *URL 0 → 1 *$') from (explain pipeline select x, count() from url('https://example.com', Parquet, 'x Int64') group by x order by count() limit 10);

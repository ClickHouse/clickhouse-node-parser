select id from
(
    select distinct id from remote('127.0.0.1,127.0.0.2', currentDatabase(),t_distinct_limit) limit 10
)
order by id;

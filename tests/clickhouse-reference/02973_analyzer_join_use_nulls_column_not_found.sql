SET join_use_nulls = 1;
SELECT '--';
select c FROM (
    select
        d2.c
    from ( select 1 as a, 2 as b ) d1
    FULL join ( select 1 as a, 3 as c ) d2
        on (d1.a = d2.a)
)
;

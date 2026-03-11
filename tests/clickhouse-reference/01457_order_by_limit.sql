select a, b from order_by_another order by a asc nulls last, b asc limit 4;
select a, b from order_by_another order by a asc nulls first, b asc limit 4;
select a, b from order_by_another order by a desc nulls last, b asc limit 4;
select a, b from order_by_another order by a desc nulls first, b asc limit 4;
select a, b from order_by_another order by a asc nulls last, b desc limit 4;
select a, b from order_by_another order by a asc nulls first, b desc limit 4;
select a, b from order_by_another order by a desc nulls last, b desc limit 4;
select a, b from order_by_another order by a desc nulls first, b desc limit 4;

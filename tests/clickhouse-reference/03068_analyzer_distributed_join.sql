select
	O_ORDERPRIORITY,
	count(*) as order_count
from ORDERS JOIN (
	select L_ORDERKEY
	from
	LINEITEM_shard
	group by L_ORDERKEY
	having any(L_COMMITDATE < L_RECEIPTDATE)
) on O_ORDERKEY=L_ORDERKEY
group by O_ORDERPRIORITY
order by O_ORDERPRIORITY
limit 1;
select
	O_ORDERPRIORITY,
	count(*) as order_count
from ORDERS JOIN (
	select L_ORDERKEY
	from
	LINEITEM_shard
	group by L_ORDERKEY
	having any(L_COMMITDATE < L_RECEIPTDATE)
) AS x on O_ORDERKEY=L_ORDERKEY
group by O_ORDERPRIORITY
order by O_ORDERPRIORITY
limit 1;

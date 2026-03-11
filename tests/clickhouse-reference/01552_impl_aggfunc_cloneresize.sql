select
	dim ,
	sum(idnum)
from
	test_bm_join
right join(
	select
		dim,
		bitmapOrCardinality(ids,ids2) as idnum
	from
		(
		select
			dim,
			groupBitmapState(toUInt64(id)) as ids
		FROM
			test_bm
		where
			dim >2
		group by
			dim ) A all
	right join (
		select
			dim,
			groupBitmapState(toUInt64(id)) as ids2
		FROM
			test_bm
		where
			dim < 2
		group by
			dim ) B
	using(dim) ) C
using(dim)
group by dim;

-- Compare equal and unequal values of different precicion/scale
SELECT
	dt6, dt3,
	dt6 >  dt3,
	dt6 >= dt3,
	dt6 =  dt3,
	dt6 <= dt3,
	dt6 <  dt3,
	dt6 != dt3
FROM datetime64_cmp
ORDER BY
	dt6, dt3;

SELECT *
FROM agg_table;

SELECT if(xxx = 'x', ([2], 3), ([3], 4))
FROM agg_table;

SELECT if(xxx = 'x', ([2], 3), ([3], 4, 'q', 'w', 7))
FROM agg_table;
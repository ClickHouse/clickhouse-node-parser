SELECT formatQuerySingleLine('create materialized view mv_kek to {db:Identifier}.{target_table:Identifier} as select * from null_kek');

SELECT formatQuerySingleLine('create materialized view mv_kek to {target_table:Identifier} as select * from null_kek');

SELECT *
FROM dst_table
ORDER BY number ASC;

SELECT *
FROM dst_table
ORDER BY number ASC;
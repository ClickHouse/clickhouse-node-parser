SELECT uniq(d.val) FROM dist_table AS d GLOBAL LEFT JOIN numbers(100) AS t USING id; -- { serverError UNKNOWN_IDENTIFIER, 284 }
SELECT uniq(d.val) FROM dist_table AS d GLOBAL LEFT JOIN local_table AS t USING id;

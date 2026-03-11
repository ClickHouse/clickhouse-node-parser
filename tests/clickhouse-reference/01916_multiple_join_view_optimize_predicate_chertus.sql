SELECT * FROM a ANY LEFT OUTER JOIN j USING id ORDER BY a.id, a.val SETTINGS enable_optimize_predicate_expression = 1;
SELECT * FROM a ANY LEFT OUTER JOIN j USING id ORDER BY a.id, a.val SETTINGS enable_optimize_predicate_expression = 0;
SELECT * FROM (SELECT 0 id, 1 val) _ JOIN j USING id;

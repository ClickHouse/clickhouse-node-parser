SELECT __actionName();

SELECT __actionName('aaa', 'aaa', 'aaa');

SELECT __actionName('aaa', '')
SETTINGS enable_analyzer = 1;

SELECT __actionName('aaa', materialize('aaa'));

SELECT __actionName(materialize('aaa'), 'aaa');

SELECT __actionName('aaa', 'aaa');

SELECT concat(__actionName('aaa', toNullable('x')), '1')
GROUP BY __actionName('aaa', 'x');

SELECT __getScalar('aaa');

SELECT __getScalar();

SELECT __getScalar(1);

SELECT __getScalar(materialize('1'));

SELECT __getScalar(concat(toNullable(materialize(1))) - NULL);

SELECT __scalarSubqueryResult('1');

SELECT
    concat('a', __scalarSubqueryResult(a)),
    materialize('1') AS a;

SELECT
    __scalarSubqueryResult(a, a),
    materialize('1') AS a;

SELECT 1 AS __grouping_set;
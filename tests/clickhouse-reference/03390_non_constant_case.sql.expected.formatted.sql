SELECT
    number,
    caseWithExpression(number % 2, number % 3, 'Match Mod 3', number % 4, 'Match Mod 4', 'No Match') AS result
FROM numbers(10);

SELECT
    name,
    caseWithExpression(name, substring(name, 1, 1), 'First letter', reverse(name), 'Reversed match', 'No Match') AS result
FROM (
        SELECT arrayJoin(['Alice', 'Bob', 'Charlie', 'David', 'abba', 'A']) AS name
    );

SELECT
    event_date,
    caseWithExpression(event_date, toDate('2024-03-10'), 'Special day', toDate('2024-03-12'), 'Today', 'Normal Day') AS event_type
FROM (
        SELECT arrayJoin([toDate('2024-03-10'), toDate('2024-03-11'), toDate('2024-03-12')]) AS event_date
    );

SELECT count()
FROM numbers(1000000)
WHERE caseWithExpression(number % 2, number % 3, 1, number % 5, 1, 0) = 1;

SELECT DISTINCT caseWithExpression(1.1, toNullable(0.1), 'a', 1.1, 'b', materialize(2.1), toFixedString('c', 1), 'default') AS f;

SELECT
    caseWithExpression(NULL, materialize(NULL), NULL, NULL) AS f1,
    if(NULL, toDateTimeOrZero(NULL), NULL) AS f2
FROM numbers(1);

SELECT caseWithExpression(number, 1, number + 2, number * 2)
FROM numbers(3);

SELECT caseWithExpression(materialize(materialize(NULL)), materialize(NULL), NULL, NULL);

SELECT caseWithExpression(materialize(assumeNotNull(materialize(NULL))), materialize(NULL), NULL, NULL);

SELECT caseWithExpression('C', 'A', true, 'B', false);

SELECT caseWithExpression(1, assumeNotNull(materialize(NULL)), 1, 1);

SELECT count()
WHERE caseWithExpression(1, assumeNotNull(materialize(NULL)), 1, 1);
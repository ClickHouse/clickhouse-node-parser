CREATE TABLE bool_test
(
    value Bool,
    f String
)
ENGINE = Memory;

SELECT
    value,
    f
FROM bool_test
FORMAT JSONEachRow;

SELECT
    toUInt64(value),
    f
FROM bool_test;

SELECT
    value,
    f
FROM bool_test
WHERE value > 0;

SET bool_true_representation = 'True';

SET bool_false_representation = 'False';

SELECT
    value,
    f
FROM bool_test
ORDER BY value ASC
FORMAT TSV;

SET bool_true_representation = 'Yes';

SET bool_false_representation = 'No';

SET bool_true_representation = 'On';

SET bool_false_representation = 'Off';
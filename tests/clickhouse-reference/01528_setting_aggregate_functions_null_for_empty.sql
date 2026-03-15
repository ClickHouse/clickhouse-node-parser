CREATE TABLE defaults
(
	n Int8
)ENGINE = Memory();
SELECT sum(n) FROM defaults;
SELECT sumOrNull(n) FROM defaults;
SELECT count(n) FROM defaults;
SELECT countOrNull(n) FROM defaults;
SET aggregate_functions_null_for_empty=1;
SET aggregate_functions_null_for_empty=0;

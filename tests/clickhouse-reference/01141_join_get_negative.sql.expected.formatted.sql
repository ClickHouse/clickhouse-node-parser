SELECT joinGet('t1', '', number)
FROM numbers(2); -- { serverError NO_SUCH_COLUMN_IN_TABLE }

SELECT joinGet('t2', 's', number)
FROM numbers(2); -- { serverError INCOMPATIBLE_TYPE_OF_JOIN }
CREATE TABLE join_test
(
    id UInt16,
    num UInt16
)
ENGINE = Join(`ANY`, `LEFT`, id)
SETTINGS join_any_take_last_row = 1;

SELECT joinGet('join_test', 'num', 500);

SELECT joinGet('join_test', 'num', 500);
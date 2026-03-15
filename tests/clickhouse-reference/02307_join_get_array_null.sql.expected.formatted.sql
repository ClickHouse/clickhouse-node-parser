CREATE TABLE id_val
(
    id Int32,
    val Array(Int32)
)
ENGINE = Join(`ANY`, `LEFT`, id)
SETTINGS join_use_nulls = 1;

SELECT joinGet(id_val, 'val', toInt32(number))
FROM numbers(1);
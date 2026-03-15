CREATE TABLE test_joinGet
(
    user_id Nullable(Int32),
    name String
)
ENGINE = Join(`ANY`, `LEFT`, user_id);

SELECT toNullable(toInt32(2)) AS user_id
WHERE joinGet(test_joinGet, 'name', user_id) != '';

-- If the JOIN keys are Nullable fields, the rows where at least one of the keys has the value NULL are not joined.
SELECT CAST(NULL AS Nullable(Int32)) AS user_id
WHERE joinGet(test_joinGet, 'name', user_id) != '';
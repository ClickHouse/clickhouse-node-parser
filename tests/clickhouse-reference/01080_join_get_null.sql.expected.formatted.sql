SELECT toNullable(toInt32(2)) AS user_id
WHERE joinGet(test_joinGet, 'name', user_id) != '';

SELECT CAST(NULL AS Nullable(Int32)) AS user_id
WHERE joinGet(test_joinGet, 'name', user_id) != '';
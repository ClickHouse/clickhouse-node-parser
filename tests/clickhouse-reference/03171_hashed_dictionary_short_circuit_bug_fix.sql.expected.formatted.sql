SELECT
    hash_id,
    dictGetOrDefault(d1, 'user_result', toUInt64(hash_id), toFloat64(user_result)),
    dictGet(d1, 'user_result', toUInt64(hash_id))
FROM y;

SELECT
    hash_id,
    dictGetOrDefault(d2, 'user_result', toUInt64(hash_id), toFloat64(user_result)),
    dictGet(d2, 'user_result', toUInt64(hash_id))
FROM y;
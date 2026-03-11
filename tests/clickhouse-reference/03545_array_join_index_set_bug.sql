SELECT COUNT() AS x
FROM
(
    SELECT
        array_in_index,
        arrayJoin(array_not_in_index) AS array_not_in_index_joined
    FROM right
) AS T00J0
WHERE T00J0.array_not_in_index_joined = '' AND has(T00J0.array_in_index, 'abc');

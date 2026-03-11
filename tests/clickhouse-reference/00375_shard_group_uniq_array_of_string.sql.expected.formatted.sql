SELECT length(groupUniqArray(v))
FROM group_uniq_str
GROUP BY id
ORDER BY id ASC;

SELECT length(groupUniqArray(v))
FROM remote('127.0.0.{2,3,4,5}', currentDatabase(), 'group_uniq_str')
GROUP BY id
ORDER BY id ASC
SETTINGS max_rows_to_read = '100M';

SELECT length(groupUniqArray(10)(v))
FROM group_uniq_str
GROUP BY id
ORDER BY id ASC;

SELECT length(groupUniqArray(10000)(v))
FROM group_uniq_str
GROUP BY id
ORDER BY id ASC;
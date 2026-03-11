SELECT length(groupUniqArray(v)) FROM group_uniq_arr_str GROUP BY id ORDER BY id;
SELECT length(groupUniqArray(v)) FROM remote('127.0.0.{2,3,4,5}', currentDatabase(), 'group_uniq_arr_str') GROUP BY id ORDER BY id;

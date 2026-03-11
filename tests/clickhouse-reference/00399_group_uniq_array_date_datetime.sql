SELECT groupUniqArray(d), groupUniqArray(dt) FROM grop_uniq_array_date;
SELECT length(groupUniqArray(2)(d)), length(groupUniqArray(2)(dt)), length(groupUniqArray(d)), length(groupUniqArray(dt)) FROM grop_uniq_array_date GROUP BY id ORDER BY id;
SELECT length(groupUniqArray(10000)(d)), length(groupUniqArray(10000)(dt)) FROM grop_uniq_array_date GROUP BY id ORDER BY id;

SELECT groupUniqArray(v)
FROM values('id int, v Array(int)', (1, [2]), (1, []))
GROUP BY id;
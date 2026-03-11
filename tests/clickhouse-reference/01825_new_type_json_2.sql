SELECT id, data, JSONAllPathsWithTypes(data) FROM t_json_2 ORDER BY id;
SELECT id, data.k1, data.k2, data.k3 FROM t_json_2 ORDER BY id;
SELECT id, data.k1 FROM t_json_2 ORDEr BY id;
SELECT id, data.k1.k2, data.k1.k3, data.k1.k4 FROM t_json_2 ORDER BY id;

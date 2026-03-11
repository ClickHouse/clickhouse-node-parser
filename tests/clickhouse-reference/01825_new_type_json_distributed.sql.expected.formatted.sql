SELECT
    data,
    JSONAllPathsWithTypes(data)
FROM t_json_dist;

SELECT
    data.k1,
    data.k2.k3,
    data.k2.k4
FROM t_json_dist;
SELECT t1.id
FROM raw_data_parameterized(id_from = 0, id_to = 50000) t1
ORDER BY t1.id;

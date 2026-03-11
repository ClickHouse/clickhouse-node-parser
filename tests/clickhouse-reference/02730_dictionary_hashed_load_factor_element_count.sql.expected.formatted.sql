SELECT
    name,
    length(attribute.names),
    element_count,
    round(load_factor, 4)
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'dict_sharded';

SELECT
    name,
    length(attribute.names),
    element_count,
    round(load_factor, 4)
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'dict_sharded_multi';
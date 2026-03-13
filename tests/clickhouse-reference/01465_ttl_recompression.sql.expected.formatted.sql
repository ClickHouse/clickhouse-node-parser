SELECT COUNT()
FROM recompression_table;

SELECT
    substring(name, 1, length(name) - 2),
    default_compression_codec
FROM `system`.parts
WHERE table = 'recompression_table'
    AND active = 1
    AND database = currentDatabase()
ORDER BY name ASC;

SELECT
    substring(name, 1, length(name) - 4),
    default_compression_codec
FROM `system`.parts
WHERE table = 'recompression_table'
    AND active = 1
    AND database = currentDatabase()
ORDER BY name ASC;

SELECT
    substring(name, 1, length(name) - 4),
    recompression_ttl_info.expression
FROM `system`.parts
WHERE table = 'recompression_table'
    AND active = 1
    AND database = currentDatabase()
ORDER BY name ASC;

SELECT
    substring(name, 1, length(name) - 2),
    default_compression_codec
FROM `system`.parts
WHERE table = 'recompression_table_compact'
    AND active = 1
    AND database = currentDatabase()
ORDER BY name ASC;

-- merge level and mutation in part name is not important
SELECT
    substring(name, 1, length(name) - 4),
    default_compression_codec
FROM `system`.parts
WHERE table = 'recompression_table_compact'
    AND active = 1
    AND database = currentDatabase()
ORDER BY name ASC;
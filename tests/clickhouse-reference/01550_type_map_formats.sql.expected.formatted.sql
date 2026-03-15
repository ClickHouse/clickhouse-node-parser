-- Tags: log-engine
SET output_format_write_statistics = 0;

SET output_format_json_pretty_print = 0;

CREATE TABLE map_formats
(
    m Map(String, UInt32),
    m1 Map(String, Date),
    m2 Map(String, Array(UInt32))
)
ENGINE = Log;

SELECT *
FROM map_formats
ORDER BY m['k1'] ASC
FORMAT JSON;

SELECT *
FROM map_formats
ORDER BY m['k1'] ASC
FORMAT JSONEachRow;

SELECT *
FROM map_formats
ORDER BY m['k1'] ASC
FORMAT CSV;

SELECT *
FROM map_formats
ORDER BY m['k1'] ASC
FORMAT TSV;

SELECT *
FROM map_formats
ORDER BY m['k1'] ASC
FORMAT TSKV;
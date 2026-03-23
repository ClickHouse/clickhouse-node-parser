-- Tags: no-fasttest
INSERT INTO FUNCTION file(`02384_data`.arrow) SELECT toLowCardinality(toNullable('abc')) AS lc
SETTINGS
    output_format_arrow_low_cardinality_as_dictionary = 1,
    output_format_arrow_string_as_string = 0,
    engine_file_truncate_on_insert = 1;

SELECT *
FROM file(`02384_data`.arrow);

INSERT INTO FUNCTION file(`02384_data`.arrow) SELECT toLowCardinality(toNullable('abc')) AS lc
SETTINGS
    output_format_arrow_low_cardinality_as_dictionary = 1,
    output_format_arrow_string_as_string = 1,
    engine_file_truncate_on_insert = 1;
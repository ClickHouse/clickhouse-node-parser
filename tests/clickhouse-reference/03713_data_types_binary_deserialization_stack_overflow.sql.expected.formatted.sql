SELECT *
FROM format(RowBinaryWithNamesAndTypes, concat('x', repeat('', 1000000)))
SETTINGS input_format_binary_decode_types_in_binary_format = 1;
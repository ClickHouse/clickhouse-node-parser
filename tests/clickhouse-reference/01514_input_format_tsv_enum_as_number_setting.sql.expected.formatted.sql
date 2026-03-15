CREATE TABLE table_with_enum_column_for_tsv_insert
(
    Id Int32,
    Value Enum('ef' = 1, 'es' = 2)
)
ENGINE = Memory();

SET input_format_tsv_enum_as_number = 1;

SET input_format_tsv_enum_as_number = 0;
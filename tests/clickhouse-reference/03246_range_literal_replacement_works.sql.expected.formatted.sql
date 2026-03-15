SET input_format_values_interpret_expressions = 0;

SET input_format_values_accurate_types_of_literals = 0;

CREATE TABLE IF NOT EXISTS `03246_range_literal_replacement_works`
(
    id UInt8
)
ENGINE = Memory;

SELECT *
FROM `03246_range_literal_replacement_works`;
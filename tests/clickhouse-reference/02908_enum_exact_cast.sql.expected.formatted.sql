DROP TABLE IF EXISTS enum_table;

CREATE TABLE enum_table
(
    id UInt64,
    val Enum('first' = 1, 'second' = 2, 'third' = 3)
)
ENGINE = Memory;

SELECT '-- treat NULL as default value';

INSERT INTO enum_table; -- input_format_null_as_default is enabled by default

SELECT val
FROM enum_table;

INSERT INTO enum_table SETTINGS input_format_null_as_default = 0, async_insert = 1; -- { serverError TYPE_MISMATCH }

SET check_conversion_from_numbers_to_enum = 0; -- legacy behavior

INSERT INTO enum_table;

INSERT INTO enum_table;

INSERT INTO enum_table SELECT
    0,
    'first';

INSERT INTO enum_table SELECT
    0,
    'fifth'; -- { serverError UNKNOWN_ELEMENT_OF_ENUM }

INSERT INTO enum_table SELECT
    0,
    0;

SET check_conversion_from_numbers_to_enum = 1; -- default behavior

DROP TABLE enum_table;

DROP TABLE IF EXISTS nullable_enum_table;

CREATE TABLE nullable_enum_table
(
    id UInt64,
    val Nullable(Enum('first' = 1, 'second' = 2, 'third' = 3))
)
ENGINE = Memory;

INSERT INTO nullable_enum_table SETTINGS input_format_null_as_default = 1;

INSERT INTO nullable_enum_table SETTINGS input_format_null_as_default = 0;

SELECT val
FROM nullable_enum_table;

INSERT INTO nullable_enum_table;

INSERT INTO nullable_enum_table;

INSERT INTO nullable_enum_table;

DROP TABLE nullable_enum_table;

SELECT (('first'::String)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT (('second'::String)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT (('third'::String)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT (('fifth'::String)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64; -- { serverError UNKNOWN_ELEMENT_OF_ENUM }

SELECT ((9::Int8)::Enum('first' = 10, 'second' = 50, 'third' = 100))::UInt64;

SELECT ((9::UInt8)::Enum('first' = 10, 'second' = 50, 'third' = 100))::UInt64;

SELECT ((101::Int8)::Enum('first' = 10, 'second' = 50, 'third' = 100))::UInt64;

SELECT ((101::UInt8)::Enum('first' = 10, 'second' = 50, 'third' = 100))::UInt64;

SELECT ((4::Int8)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((4::Int16)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((4::Int32)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((4::Int64)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((4::UInt8)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((4::UInt16)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((4::UInt32)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((4::UInt64)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((4::Float32)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((4::Float64)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((10::Int8)::Enum('first' = 10, 'second' = 50, 'third' = 100))::UInt64;

SELECT ((10::UInt8)::Enum('first' = 10, 'second' = 50, 'third' = 100))::UInt64;

SELECT ((100::Int8)::Enum('first' = 10, 'second' = 50, 'third' = 100))::UInt64;

SELECT ((100::UInt8)::Enum('first' = 10, 'second' = 50, 'third' = 100))::UInt64;

SELECT ((2::Int8)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((2::Int16)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((2::Int32)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((2::Int64)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((2::UInt8)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((2::UInt16)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((2::UInt32)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((2::UInt64)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((2::Float32)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;

SELECT ((2::Float64)::Enum('first' = 1, 'second' = 2, 'third' = 3))::UInt64;
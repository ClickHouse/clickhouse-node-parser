-- Checks that no bad things happen when the table optimizes the row order to improve compressability during insert.


-- Below SELECTs intentionally only ORDER BY the table primary key and rely on read-in-order optimization
SET optimize_read_in_order = 1;
DROP TABLE IF EXISTS tab;
CREATE TABLE tab (
    name String,
    event Int8
) ENGINE = MergeTree
ORDER BY name
SETTINGS optimize_row_order = true;
INSERT INTO tab VALUES ('Igor', 3), ('Egor', 1), ('Egor', 2), ('Igor', 2), ('Igor', 1);
SELECT * FROM tab ORDER BY name SETTINGS max_threads=1;
DROP TABLE tab;
CREATE TABLE tab (
    name String,
    timestamp Int64,
    money UInt8,
    flag String
) ENGINE = MergeTree
ORDER BY ()
SETTINGS optimize_row_order = True;
INSERT INTO tab VALUES ('Bob', 4, 100, '1'), ('Nikita', 2, 54, '1'), ('Nikita', 1, 228, '1'), ('Alex', 4, 83, '1'), ('Alex', 4, 134, '1'), ('Alex', 1, 65, '0'), ('Alex', 4, 134, '1'), ('Bob', 2, 53, '0'), ('Alex', 4, 83, '0'), ('Alex', 1, 63, '1'), ('Bob', 2, 53, '1'), ('Alex', 4, 192, '1'), ('Alex', 2, 128, '1'), ('Nikita', 2, 148, '0'), ('Bob', 4, 177, '0'), ('Nikita', 1, 173, '0'), ('Alex', 1, 239, '0'), ('Alex', 1, 63, '0'), ('Alex', 2, 224, '1'), ('Bob', 4, 177, '0'), ('Alex', 2, 128, '1'), ('Alex', 4, 134, '0'), ('Alex', 4, 83, '1'), ('Bob', 4, 100, '0'), ('Nikita', 2, 54, '1'), ('Alex', 1, 239, '1'), ('Bob', 2, 187, '1'), ('Alex', 1, 65, '1'), ('Bob', 2, 53, '1'), ('Alex', 2, 224, '0'), ('Alex', 4, 192, '0'), ('Nikita', 1, 173, '1'), ('Nikita', 2, 148, '1'), ('Bob', 2, 187, '1'), ('Nikita', 2, 208, '1'), ('Nikita', 2, 208, '0'), ('Nikita', 1, 228, '0'), ('Nikita', 2, 148, '0');
SELECT * FROM tab SETTINGS max_threads=1;
CREATE TABLE tab (
    name FixedString(2),
    timestamp Float32,
    money Float64,
    flag Nullable(Int32)
) ENGINE = MergeTree
ORDER BY (flag, money)
SETTINGS optimize_row_order = True, allow_nullable_key = True;
INSERT INTO tab VALUES ('AB', 0, 42, Null), ('AB', 0, 42, Null), ('A', 1, 42, Null), ('AB', 1, 9.81, 0), ('B', 0, 42, Null), ('B', -1, 3.14, Null), ('B', 1, 2.7, 1), ('B', 0, 42, 1), ('A', 1, 42, 1), ('B', 1, 42, Null), ('B', 0, 2.7, 1), ('A', 0, 2.7, 1), ('B', 2, 3.14, Null), ('A', 0, 3.14, Null), ('A', 1, 2.7, 1), ('A', 1, 42, Null);
SELECT * FROM tab ORDER BY (flag, money) SETTINGS max_threads=1;
CREATE TABLE tab (
    fixed_str FixedString(6),
    event_date Date,
    vector_array Array(Float32),
    nullable_int Nullable(Int128),
    low_card_string LowCardinality(String),
    map_column Map(String, String),
    tuple_column Tuple(UInt256)
) ENGINE = MergeTree()
ORDER BY (fixed_str, event_date)
SETTINGS optimize_row_order = True;
INSERT INTO tab VALUES ('A', '2020-01-01', [0.0, 1.1], 10, 'some string', {'key':'value'}, (123)), ('A', '2020-01-01', [0.0, 1.1], NULL, 'example', {}, (26)), ('A', '2020-01-01', [2.2, 1.1], 1, 'some other string', {'key2':'value2'}, (5)), ('A', '2020-01-02', [0.0, 1.1], 10, 'some string', {'key':'value'}, (123)), ('A', '2020-01-02', [0.0, 2.2], 10, 'example', {}, (26)), ('A', '2020-01-02', [2.2, 1.1], 1, 'some other string', {'key2':'value2'}, (5)), ('B', '2020-01-04', [0.0, 1.1], 10, 'some string', {'key':'value'}, (123)), ('B', '2020-01-04', [0.0, 2.2], Null, 'example', {}, (26)), ('B', '2020-01-04', [2.2, 1.1], 1, 'some string', {'key2':'value2'}, (5)), ('B', '2020-01-05', [0.0, 1.1], 10, 'some string', {'key':'value'}, (123)), ('B', '2020-01-05', [0.0, 2.2], Null, 'example', {}, (26)), ('B', '2020-01-05', [2.2, 1.1], 1, 'some other string', {'key':'value'}, (5)), ('C', '2020-01-04', [0.0, 1.1], 10, 'some string', {'key':'value'}, (5)), ('C', '2020-01-04', [0.0, 2.2], Null, 'example', {}, (26)), ('C', '2020-01-04', [2.2, 1.1], 1, 'some other string', {'key2':'value2'}, (5));
SELECT * FROM tab ORDER BY (fixed_str, event_date) SETTINGS max_threads=1;

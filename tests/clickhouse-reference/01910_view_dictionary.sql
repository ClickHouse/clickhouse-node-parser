CREATE TABLE dictionary_source_en
(
    id UInt64,
    value String
) ENGINE = TinyLog;
CREATE TABLE dictionary_source_ru
(
    id UInt64,
    value String
) ENGINE = TinyLog;
CREATE VIEW dictionary_source_view AS
    SELECT id, dictionary_source_en.value as value_en, dictionary_source_ru.value as value_ru
    FROM dictionary_source_en LEFT JOIN dictionary_source_ru USING (id);
select * from dictionary_source_view ORDER BY id;
CREATE DICTIONARY flat_dictionary
(
    id UInt64,
    value_en String,
    value_ru String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(HOST 'localhost' PORT tcpPort() USER 'default' PASSWORD '' TABLE 'dictionary_source_view'))
LIFETIME(MIN 1 MAX 1000)
LAYOUT(FLAT());
SELECT
    dictGet(concat(currentDatabase(), '.flat_dictionary'), 'value_en', number + 1),
    dictGet(concat(currentDatabase(), '.flat_dictionary'), 'value_ru', number + 1)
FROM numbers(3);

-- Tags: no-parallel
DROP TABLE IF EXISTS date_table;

CREATE TABLE date_table
(
    CountryID UInt64,
    CountryKey String,
    StartDate Date,
    EndDate Date,
    Tax Float64
)
ENGINE = MergeTree()
ORDER BY CountryID;

INSERT INTO date_table;

INSERT INTO date_table;

INSERT INTO date_table;

DROP DICTIONARY IF EXISTS range_dictionary;

CREATE DICTIONARY range_dictionary
(
    CountryID UInt64,
    CountryKey String,
    StartDate Date,
    EndDate Date,
    Tax Float64 DEFAULT 0.2
)
PRIMARY KEY CountryID, CountryKey
SOURCE(clickhouse(TABLE 'date_table'))
LIFETIME(MIN 1 MAX 1000)
RANGE(MIN StartDate MAX EndDate)
LAYOUT(COMPLEX_KEY_RANGE_HASHED());

SELECT dictGet('range_dictionary', 'Tax', (toUInt64(1), '1'), toDate('2019-05-15'));

SELECT dictGet('range_dictionary', 'Tax', (toUInt64(1), '1'), toDate('2019-05-29'));

SELECT dictGet('range_dictionary', 'Tax', (toUInt64(2), '2'), toDate('2019-05-29'));

SELECT dictGet('range_dictionary', 'Tax', (toUInt64(2), '2'), toDate('2019-05-31'));

SELECT dictGetOrDefault('range_dictionary', 'Tax', (toUInt64(2), '2'), toDate('2019-05-31'), 0.4);

SELECT dictHas('range_dictionary', (toUInt64(1), '1'), toDate('2019-05-15'));

SELECT dictHas('range_dictionary', (toUInt64(1), '1'), toDate('2019-05-29'));

SELECT dictHas('range_dictionary', (toUInt64(2), '2'), toDate('2019-05-29'));

SELECT dictHas('range_dictionary', (toUInt64(2), '2'), toDate('2019-05-31'));

SELECT *
FROM range_dictionary
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT 1
FROM range_dictionary
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT
    CountryID,
    StartDate,
    Tax
FROM range_dictionary
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT Tax
FROM range_dictionary
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

DROP DICTIONARY range_dictionary;

DROP TABLE date_table;

CREATE TABLE date_table
(
    CountryID UInt64,
    CountryKey String,
    StartDate Date,
    EndDate Date,
    Tax Nullable(Float64)
)
ENGINE = MergeTree()
ORDER BY CountryID;

INSERT INTO date_table;

CREATE DICTIONARY range_dictionary_nullable
(
    CountryID UInt64,
    CountryKey String,
    StartDate Date,
    EndDate Date,
    Tax Nullable(Float64) DEFAULT 0.2
)
PRIMARY KEY CountryID, CountryKey
SOURCE(clickhouse(TABLE 'date_table'))
LIFETIME(MIN 1 MAX 1000)
RANGE(MIN StartDate MAX EndDate)
LAYOUT(COMPLEX_KEY_RANGE_HASHED());

SELECT dictGet('range_dictionary_nullable', 'Tax', (toUInt64(1), '1'), toDate('2019-05-15'));

SELECT dictGet('range_dictionary_nullable', 'Tax', (toUInt64(1), '1'), toDate('2019-05-29'));

SELECT dictGet('range_dictionary_nullable', 'Tax', (toUInt64(2), '2'), toDate('2019-05-29'));

SELECT dictGet('range_dictionary_nullable', 'Tax', (toUInt64(2), '2'), toDate('2019-05-31'));

SELECT dictGetOrDefault('range_dictionary_nullable', 'Tax', (toUInt64(2), '2'), toDate('2019-05-31'), 0.4);

SELECT dictHas('range_dictionary_nullable', (toUInt64(1), '1'), toDate('2019-05-15'));

SELECT dictHas('range_dictionary_nullable', (toUInt64(1), '1'), toDate('2019-05-29'));

SELECT dictHas('range_dictionary_nullable', (toUInt64(2), '2'), toDate('2019-05-29'));

SELECT dictHas('range_dictionary_nullable', (toUInt64(2), '2'), toDate('2019-05-31'));

SELECT *
FROM range_dictionary_nullable
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT 1
FROM range_dictionary_nullable
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT
    CountryID,
    StartDate,
    Tax
FROM range_dictionary_nullable
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT Tax
FROM range_dictionary_nullable
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

DROP DICTIONARY range_dictionary_nullable;
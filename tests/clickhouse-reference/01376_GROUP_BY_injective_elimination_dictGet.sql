-- Tags: no-parallel

-- https://github.com/ClickHouse/ClickHouse/issues/11469
SELECT dictGet('default.countryId', 'country', toUInt64(number)) AS country FROM numbers(2) GROUP BY country; -- { serverError BAD_ARGUMENTS }
SELECT dictGet('dictdb_01376.dict_exists', 'value', toUInt64(1)) as val FROM numbers(2) GROUP BY val;

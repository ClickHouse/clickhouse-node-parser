SELECT dictGet('default.countryId', 'country', toUInt64(number)) AS country
FROM numbers(2)
GROUP BY country;

SELECT dictGet('dictdb_01376.dict_exists', 'value', toUInt64(1)) AS val
FROM numbers(2)
GROUP BY val;
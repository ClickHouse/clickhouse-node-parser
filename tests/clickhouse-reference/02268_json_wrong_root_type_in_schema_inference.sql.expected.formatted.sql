SELECT *
FROM file(concat(currentDatabase(), '_02268_data.jsonl')); --{serverError CANNOT_EXTRACT_TABLE_STRUCTURE}

SELECT *
FROM file(concat(currentDatabase(), '_02268_data.jsonCompactEachRow')); --{serverError CANNOT_EXTRACT_TABLE_STRUCTURE}
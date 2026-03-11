SELECT *
FROM file(concat(currentDatabase(), '_02268_data.jsonl'));

SELECT *
FROM file(concat(currentDatabase(), '_02268_data.jsonCompactEachRow'));
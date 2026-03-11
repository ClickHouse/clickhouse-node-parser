SELECT *
FROM compression_codec_replicated1
ORDER BY id ASC;

SELECT *
FROM compression_codec_replicated2
ORDER BY id ASC;

SELECT count(*)
FROM compression_codec_replicated1
WHERE id = 2
GROUP BY id;

SELECT count(*)
FROM compression_codec_replicated2
WHERE id = 2
GROUP BY id;

SELECT *
FROM compression_codec_multiple_replicated2
ORDER BY id ASC;

SELECT *
FROM compression_codec_multiple_replicated1
ORDER BY id ASC;

SELECT count(*)
FROM compression_codec_multiple_replicated1;

SELECT count(*)
FROM compression_codec_multiple_replicated2;

SELECT countDistinct(data)
FROM compression_codec_multiple_replicated1;

SELECT countDistinct(data)
FROM compression_codec_multiple_replicated2;

SELECT floor(sum(somenum), 1)
FROM compression_codec_multiple_replicated1;

SELECT floor(sum(somenum), 1)
FROM compression_codec_multiple_replicated2;

SELECT sum(cityHash64(*))
FROM compression_codec_multiple_replicated2;

SELECT sum(cityHash64(*))
FROM compression_codec_multiple_replicated1;

SELECT *
FROM compression_codec_multiple_more_types_replicated
ORDER BY id ASC;

SELECT data
FROM compression_codec_multiple_with_key_replicated
WHERE and(greaterOrEquals(id, 3), lessOrEquals(id, 1112));

SELECT COUNTDistinct(data)
FROM compression_codec_multiple_with_key_replicated
WHERE id < 222;
SELECT *
FROM compression_codec
ORDER BY id ASC;

SELECT count(*)
FROM compression_codec
WHERE id = 2
GROUP BY id;

SELECT *
FROM compression_codec_multiple
ORDER BY id ASC;

SELECT count(*)
FROM compression_codec_multiple;

SELECT countDistinct(data)
FROM compression_codec_multiple;

SELECT floor(sum(somenum), 1)
FROM compression_codec_multiple;

SELECT sum(cityHash64(*))
FROM compression_codec_multiple;

SELECT *
FROM compression_codec_multiple_more_types
ORDER BY id ASC;

SELECT data
FROM compression_codec_multiple_with_key
WHERE and(greaterOrEquals(id, 3), lessOrEquals(id, 1112));

SELECT COUNTDistinct(data)
FROM compression_codec_multiple_with_key
WHERE id < 222;

SELECT data
FROM compression_codec_multiple_with_key
WHERE id = 2222;
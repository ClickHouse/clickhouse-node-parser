SELECT *
FROM compression_codec_log
ORDER BY id ASC;

SELECT count(*)
FROM compression_codec_log
WHERE id = 2
GROUP BY id;

SELECT *
FROM compression_codec_multiple_log
ORDER BY id ASC;

SELECT count(*)
FROM compression_codec_multiple_log;

SELECT countDistinct(data)
FROM compression_codec_multiple_log;

SELECT floor(sum(somenum), 1)
FROM compression_codec_multiple_log;

SELECT sum(cityHash64(*))
FROM compression_codec_multiple_log;

SELECT *
FROM compression_codec_tiny_log
ORDER BY id ASC;

SELECT count(*)
FROM compression_codec_tiny_log
WHERE id = 2
GROUP BY id;

SELECT *
FROM compression_codec_multiple_tiny_log
ORDER BY id ASC;

SELECT count(*)
FROM compression_codec_multiple_tiny_log;

SELECT countDistinct(data)
FROM compression_codec_multiple_tiny_log;

SELECT floor(sum(somenum), 1)
FROM compression_codec_multiple_tiny_log;

SELECT sum(cityHash64(*))
FROM compression_codec_multiple_tiny_log;
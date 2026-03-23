SET send_logs_level = 'fatal';

SET allow_suspicious_codecs = 1;

DROP TABLE IF EXISTS delta_codec_for_alter;

CREATE TABLE delta_codec_for_alter
(
    date Date,
    x UInt32 CODEC(Delta),
    s FixedString(128)
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT compression_codec
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'delta_codec_for_alter'
    AND name = 'x';
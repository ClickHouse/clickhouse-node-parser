SET send_logs_level = 'fatal';
SET allow_suspicious_codecs = 1;
CREATE TABLE delta_codec_for_alter (date Date, x UInt32 Codec(Delta), s FixedString(128)) ENGINE = MergeTree ORDER BY tuple();
SELECT compression_codec FROM system.columns WHERE database = currentDatabase() AND table = 'delta_codec_for_alter' AND name = 'x';

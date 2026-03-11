select id from remote('127.0.0.{1,3}', currentDatabase(), sample_prewhere) SAMPLE 1 where toDateTime(time) = '2019-07-20 00:00:00';

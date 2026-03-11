SELECT count()
FROM sample_final;

SELECT count()
FROM sample_final FINAL;

SELECT count()
FROM sample_final SAMPLE 1/2;

SELECT count()
FROM sample_final FINAL SAMPLE 1/2;

SELECT count()
FROM remote('127.0.0.{2|3}', currentDatabase(), sample_final) FINAL;
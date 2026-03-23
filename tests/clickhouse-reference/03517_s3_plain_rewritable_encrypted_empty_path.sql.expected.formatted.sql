CREATE TABLE t0
(
    c0 Int32
)
ENGINE = MergeTree()
ORDER BY c0
SETTINGS disk = 'disk_encrypted_03517';

INSERT INTO t0;

SELECT *
FROM t0;
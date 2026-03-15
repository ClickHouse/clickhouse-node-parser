CREATE TABLE t0
(
    vkey UInt32,
    PRIMARY KEY(vkey)
)
ENGINE = MergeTree;

CREATE VIEW t3
AS
SELECT DISTINCT ref_0.vkey AS c_2_c16_0
FROM t0 AS ref_0;
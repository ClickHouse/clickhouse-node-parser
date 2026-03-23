SYSTEM DROP  TABLE IF EXISTS merge_a;

SYSTEM DROP  TABLE IF EXISTS merge_b;

SYSTEM DROP  TABLE IF EXISTS merge_ab;

CREATE TABLE merge_a
(
    x UInt8
)
ENGINE = StripeLog;

CREATE TABLE merge_b
(
    x UInt8
)
ENGINE = StripeLog;

CREATE TABLE merge_ab AS merge(currentDatabase(), '^merge_[ab]$');

SELECT name
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'merge_ab';

SYSTEM DROP  TABLE merge_a;

SYSTEM DROP  TABLE merge_b;

SYSTEM DROP  TABLE merge_ab;
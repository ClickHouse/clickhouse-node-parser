CREATE TABLE A1
(
    a DateTime
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE A_M AS A1
ENGINE = Merge(currentDatabase(), '^A1$');

SET optimize_move_to_prewhere = 0;

SELECT arrayJoin([(1, 1)]).1
FROM A_M
PREWHERE (1, 1).1 = 1;

SELECT arrayJoin([(1, 1)]).1
FROM A_M
WHERE (1, 1).1 = 1;

SELECT arrayJoin([(1, 1)]).1
FROM A1
PREWHERE (1, 1).1 = 1;
-- Tags: no-parallel
CREATE TABLE mut
(
    n int
)
ENGINE = ReplicatedMergeTree('/test/02440/{database}/mut', '1')
ORDER BY tuple();

SET insert_keeper_fault_injection_probability = 0;

INSERT INTO mut;

SELECT
    mutation_id,
    command,
    parts_to_do_names,
    is_done
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'mut';

-- merges (and mutations) will start again after detach/attach, we need to avoid this somehow...
CREATE TABLE tmp
(
    n int
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1;

INSERT INTO tmp SELECT *
FROM numbers(1000);

SELECT sleepEachRow(2) AS higher_probablility_of_reproducing_the_issue
FORMAT Null;

-- mutation should not be finished yet
SELECT *
FROM mut;

SELECT
    mutation_id,
    command,
    parts_to_do_names
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'mut';

DROP TABLE tmp; -- btw, it will check that mutation can be cancelled between blocks on shutdown
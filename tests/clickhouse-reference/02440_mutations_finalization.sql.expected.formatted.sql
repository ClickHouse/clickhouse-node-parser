SELECT
    mutation_id,
    command,
    parts_to_do_names,
    is_done
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'mut';

SELECT sleepEachRow(2) AS higher_probablility_of_reproducing_the_issue
FORMAT Null;

SELECT *
FROM mut;

SELECT
    mutation_id,
    command,
    parts_to_do_names
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'mut';
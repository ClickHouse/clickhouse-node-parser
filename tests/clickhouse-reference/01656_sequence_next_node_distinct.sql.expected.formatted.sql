SET allow_experimental_funnel_functions = 1;

CREATE TABLE events_demo
(
    id UInt32,
    dt DateTime,
    action Nullable(String)
)
ENGINE = MergeTree()
ORDER BY (id, dt);

INSERT INTO events_demo (id, dt, action);

SELECT DISTINCT
    '(forward, head, A->B)',
    id,
    sequenceNextNodeDistinct('forward', 'head', 4)(dt, action, action = 'A', toNullable(isNotNull(1))
    AND (NOT toNullable(isNullable(1)))) AS next_node
FROM events_demo
GROUP BY *
WITH ROLLUP
WITH TOTALS
ORDER BY `ALL` ASC;
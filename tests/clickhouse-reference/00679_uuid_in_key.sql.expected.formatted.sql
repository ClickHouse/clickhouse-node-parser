CREATE TABLE IF NOT EXISTS uuid
(
    created_at DateTime,
    id UUID
)
ENGINE = MergeTree
ORDER BY (created_at, id)
PARTITION BY toDate(created_at);

SELECT count()
FROM uuid
WHERE id = '00000000-0000-03f8-9cb8-cb1b82fb3900';

SELECT count()
FROM uuid
WHERE id != '00000000-0000-03f8-9cb8-cb1b82fb3900';

SELECT count()
FROM uuid
WHERE id < '00000000-0000-03f8-9cb8-cb1b82fb3900';

SELECT count()
FROM uuid
WHERE id > '00000000-0000-03f8-9cb8-cb1b82fb3900';

SELECT count()
FROM uuid
WHERE id <= '00000000-0000-03f8-9cb8-cb1b82fb3900';

SELECT count()
FROM uuid
WHERE id >= '00000000-0000-03f8-9cb8-cb1b82fb3900';
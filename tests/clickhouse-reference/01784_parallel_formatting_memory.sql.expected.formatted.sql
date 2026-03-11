SELECT range(65535)
FROM
    `system`.one
ARRAY JOIN range(65536) AS number;
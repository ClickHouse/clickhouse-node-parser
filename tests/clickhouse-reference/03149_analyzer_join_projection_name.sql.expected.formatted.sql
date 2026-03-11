SELECT
    u.uid,
    u.name,
    u.gid,
    u.gname
FROM
    users AS u
LEFT JOIN groups_dict AS g
    USING (gid, gname)
FORMAT PrettyCompactMonoBlock;

SELECT
    u.uid,
    u.name,
    u.gid,
    u.gname
FROM
    users AS u
LEFT JOIN `groups` AS g
    USING (gid, gname)
FORMAT PrettyCompactMonoBlock;
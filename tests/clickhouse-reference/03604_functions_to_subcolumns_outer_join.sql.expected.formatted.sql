SYSTEM DROP  TABLE IF EXISTS users;

SYSTEM DROP  TABLE IF EXISTS users_ext;

CREATE TABLE users
(
    uid Int16,
    name String,
    age Int16
)
ENGINE = Memory;

INSERT INTO users;

CREATE TABLE users_ext
(
    uid Int16,
    nullableStringCol Nullable(String)
)
ENGINE = Memory;

INSERT INTO users_ext;

SELECT isNotNull(nullableStringCol)
FROM
    users
LEFT JOIN users_ext
    ON users_ext.uid = users.uid;

SELECT count(nullableStringCol)
FROM
    users
LEFT JOIN users_ext
    ON users_ext.uid = users.uid;

SELECT isNull(nullableStringCol)
FROM
    users
LEFT JOIN users_ext
    ON users_ext.uid = users.uid;

SELECT isNull(nullableStringCol)
FROM
    users
INNER JOIN users AS users2
    ON users.uid = users2.uid
LEFT JOIN users_ext
    ON users_ext.uid = users.uid;

SELECT isNull(nullableStringCol)
FROM
    users_ext
RIGHT JOIN users AS users2
    ON users_ext.uid = users2.uid
LEFT JOIN users
    ON users2.uid = users.uid;

SELECT isNull(nullableStringCol)
FROM
    users_ext
INNER JOIN users AS users2
    ON users_ext.uid = users2.uid
FULL JOIN users
    ON users2.uid = users.uid;

SELECT
    isNull(t1.nullableStringCol),
    isNull(t2.nullableStringCol),
    isNull(t3.nullableStringCol)
FROM
    users_ext AS t1
FULL JOIN users_ext AS t2
    ON t1.uid = t2.uid
FULL JOIN users_ext AS t3
    ON t1.uid = t3.uid;
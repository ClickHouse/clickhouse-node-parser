SELECT '--- Data ---';

SYSTEM DROP  VIEW IF EXISTS V_DELTA;

SYSTEM DROP  TABLE IF EXISTS users;

CREATE TABLE users
(
    uid Int16,
    name String,
    age Int16
)
ENGINE = Memory;

INSERT INTO users;

INSERT INTO users;

INSERT INTO users;

SELECT *
FROM users
ORDER BY uid ASC;

-- set params
SET param_a1 = '10';

SET param_a2 = '50';

SET param_a3 = '10';

SET param_a4 = '40';

--check
SELECT
    {a1:Int32},
    {a2:Int32},
    {a3:Int32},
    {a4:Int32};

-- using 4 param in the select of the view work here.
CREATE OR REPLACE VIEW V_DELTA
AS
SELECT DISTINCT uid
FROM (
        SELECT
            uid,
            name,
            age
        FROM users
        WHERE age >= {a1:Int32}
            OR age >= {a2:Int32}
            OR age >= {a3:Int32}
            OR age >= {a4:Int32}
    )
ORDER BY uid ASC;

SELECT *
FROM V_DELTA(a1 = 10, a2 = 50, a3 = 10, a4 = 40);

-- check individual query before the next part
SELECT DISTINCT uid
FROM (
        SELECT
            uid,
            name,
            age
        FROM users
        WHERE age >= {a1:Int32}
            AND age <= {a2:Int32}
EXCEPT
        SELECT
            uid,
            name,
            age
        FROM users
        WHERE age >= {a3:Int32}
            AND age <= {a4:Int32}
    )
ORDER BY uid ASC;

-- using 4 param in the select of the view do not work here.
CREATE OR REPLACE VIEW V_DELTA
AS
SELECT DISTINCT uid
FROM (
        SELECT
            uid,
            name,
            age
        FROM users
        WHERE age >= {a1:Int32}
            AND age <= {a2:Int32}
EXCEPT
        SELECT
            uid,
            name,
            age
        FROM users
        WHERE age >= {a3:Int32}
            AND age <= {a4:Int32}
    )
ORDER BY uid ASC;

SYSTEM DROP  VIEW V_DELTA;

SYSTEM DROP  TABLE users;
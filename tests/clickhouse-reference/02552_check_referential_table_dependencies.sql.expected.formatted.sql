SYSTEM DROP  TABLE IF EXISTS mv;

SYSTEM DROP  TABLE IF EXISTS src;

SYSTEM DROP  TABLE IF EXISTS dst;

CREATE TABLE src
(
    x UInt8
)
ENGINE = Memory;

CREATE TABLE dst
(
    x UInt8
)
ENGINE = Memory;

CREATE MATERIALIZED VIEW mv
TO dst
AS
SELECT x
FROM src;

SET check_referential_table_dependencies = 1;

-- Can't drop because of referential dependencies
SYSTEM DROP  TABLE src; -- { serverError HAVE_DEPENDENT_OBJECTS }

SYSTEM DROP  TABLE dst; -- { serverError HAVE_DEPENDENT_OBJECTS }

-- Ok to drop in the correct order
SYSTEM DROP  TABLE mv;

SET check_referential_table_dependencies = 0;
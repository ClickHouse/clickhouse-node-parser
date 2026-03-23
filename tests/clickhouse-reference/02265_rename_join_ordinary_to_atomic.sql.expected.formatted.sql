-- Tags: no-parallel
SET send_logs_level = 'fatal';

SET allow_deprecated_database_ordinary = 1;

CREATE DATABASE `02265_atomic_db`
ENGINE = Atomic;

CREATE DATABASE `02265_ordinary_db`
ENGINE = Ordinary;

CREATE TABLE `02265_ordinary_db`.join_table
(
    a Int64
)
ENGINE = Join(`ALL`, `LEFT`, a);

INSERT INTO `02265_ordinary_db`.join_table;

SELECT *
FROM `02265_atomic_db`.join_table;
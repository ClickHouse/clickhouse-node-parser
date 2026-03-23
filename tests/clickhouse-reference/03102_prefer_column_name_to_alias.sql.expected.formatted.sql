-- https://github.com/ClickHouse/ClickHouse/issues/54954
DROP TABLE IF EXISTS loans;

CREATE TABLE loans
(
    loan_number int,
    security_id text
)
ENGINE = Memory;

SET enable_analyzer = 1;

INSERT INTO loans;

INSERT INTO loans;
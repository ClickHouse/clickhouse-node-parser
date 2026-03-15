SELECT '-----------------------------------------';

CREATE TABLE raw_data
(
    id UInt32,
    data String
)
ENGINE = MergeTree
ORDER BY id;

CREATE VIEW parameterized_view_one_param
AS
SELECT *
FROM raw_data
WHERE id = {id:UInt32};

SELECT
    name,
    engine,
    parameterized_view_parameters
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'parameterized_view_one_param';

CREATE VIEW parameterized_view_multiple_params
AS
SELECT *
FROM raw_data
WHERE and(greaterOrEquals(id, {id_from:UInt32}), lessOrEquals(id, {id_to:UInt32}));

SELECT
    name,
    engine,
    parameterized_view_parameters
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'parameterized_view_multiple_params';

CREATE TEMPORARY TABLE raw_temporary_data
(
    id UInt32,
    data String
);

CREATE TEMPORARY TABLE alter_test
(
    CounterID UInt32,
    StartDate Date,
    UserID UInt32,
    VisitID UInt32
);

CREATE VIEW parameterized_view_one_param_temporary
AS
SELECT *
FROM raw_data
WHERE id = {id:UInt32};

SELECT
    name,
    engine,
    parameterized_view_parameters
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'parameterized_view_one_param_temporary';

CREATE VIEW parameterized_view_multiple_params_temporary
AS
SELECT *
FROM raw_data
WHERE and(greaterOrEquals(CounterID, {counter_id_from:UInt32}), lessOrEquals(CounterID, {counter_id_to:UInt32}))
    AND and(greaterOrEquals(StartDate, {date_from:Date}), lessOrEquals(StartDate, {date_to:UInt32}))
    AND UserId = {UserId:UInt32};

SELECT
    name,
    engine,
    parameterized_view_parameters
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'parameterized_view_multiple_params_temporary';
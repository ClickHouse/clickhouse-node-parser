-- Tags: no-parallel
SYSTEM DROP  FUNCTION IF EXISTS 02126_function;

CREATE FUNCTION `02126_function` AS x -> x;

SELECT `02126_function`(1);

SYSTEM DROP  FUNCTION 02126_function;

CREATE FUNCTION `02126_function` AS () -> x;

SELECT `02126_function`(); --{ serverError UNKNOWN_IDENTIFIER }

CREATE FUNCTION `02126_function` AS () -> 5;
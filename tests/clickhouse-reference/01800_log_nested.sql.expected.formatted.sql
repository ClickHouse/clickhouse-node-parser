CREATE TABLE nested_01800_tiny_log
(
    column Nested(name String, names Array(String), types Array(Enum8('PU' = 1, 'US' = 2, 'OTHER' = 3)))
)
ENGINE = TinyLog;

SELECT 10
FROM nested_01800_tiny_log
FORMAT Null;

CREATE TABLE nested_01800_stripe_log
(
    column Nested(name String, names Array(String), types Array(Enum8('PU' = 1, 'US' = 2, 'OTHER' = 3)))
)
ENGINE = StripeLog;

SELECT 10
FROM nested_01800_stripe_log
FORMAT Null;

CREATE TABLE nested_01800_log
(
    column Nested(name String, names Array(String), types Array(Enum8('PU' = 1, 'US' = 2, 'OTHER' = 3)))
)
ENGINE = Log;

SELECT 10
FROM nested_01800_log
FORMAT Null;
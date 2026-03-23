CREATE TABLE nullable_00465
(
    id Nullable(UInt32),
    cat String
)
ENGINE = Log;

INSERT INTO nullable_00465 (cat);

SELECT *
FROM nullable_00465;
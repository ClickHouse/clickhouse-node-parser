CREATE TABLE histogram
(
    num Int64
)
ENGINE = TinyLog;

SELECT histogram(2)(num)
FROM histogram;
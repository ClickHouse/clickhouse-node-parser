CREATE TABLE file
(
    number UInt64
)
ENGINE = File(TSV);

SELECT *
FROM file; -- { serverError FILE_DOESNT_EXIST }
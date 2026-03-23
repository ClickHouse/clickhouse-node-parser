DROP TABLE IF EXISTS file;

CREATE TABLE file
(
    number UInt64
)
ENGINE = File(TSV);

SELECT *
FROM file; -- { serverError FILE_DOESNT_EXIST }

INSERT INTO file;

DROP TABLE file;
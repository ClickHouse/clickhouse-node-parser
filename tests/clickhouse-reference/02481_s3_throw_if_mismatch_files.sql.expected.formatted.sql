SELECT
    a,
    b
FROM s3(s3_conn, filename = 'test_02481_mismatch_filesxxx*', `format` = Parquet); -- { serverError CANNOT_EXTRACT_TABLE_STRUCTURE }

SELECT
    a,
    b
FROM s3(s3_conn, filename = 'test_02481_mismatch_filesxxx*', `format` = Parquet)
SETTINGS s3_throw_on_zero_files_match = 1; -- { serverError FILE_DOESNT_EXIST }
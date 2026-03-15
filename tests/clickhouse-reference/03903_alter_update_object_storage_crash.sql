CREATE TABLE t_object_storage_update (c0 Int32)
ENGINE = S3(s3_conn, filename = currentDatabase() || '_test_03903_alter_update.parquet', format = Parquet);

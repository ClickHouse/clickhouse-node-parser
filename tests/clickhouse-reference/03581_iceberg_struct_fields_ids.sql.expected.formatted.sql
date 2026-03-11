SELECT *
FROM icebergS3(s3_conn, filename = 'field_ids_struct_test' SETTINGS iceberg_metadata_table_uuid = '149ecc15-7afc-4311-86b3-3a4c8d4ec08e')
ORDER BY `ALL` ASC;

SELECT *
FROM icebergS3(s3_conn, filename = 'field_ids_complex_test' SETTINGS iceberg_metadata_table_uuid = 'd4b695ca-ceeb-4537-8a2a-eee90dc6e313')
ORDER BY `ALL` ASC;
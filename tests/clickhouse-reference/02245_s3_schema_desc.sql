SELECT * FROM s3(decodeURLComponent(NULL), [NULL]);  --{serverError BAD_ARGUMENTS}

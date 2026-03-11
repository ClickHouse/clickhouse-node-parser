SELECT
    name,
    table,
    hash_of_all_files,
    hash_of_uncompressed_files,
    uncompressed_hash_of_compressed_files
FROM system.parts
WHERE table = 'test_00961' and database = currentDatabase();

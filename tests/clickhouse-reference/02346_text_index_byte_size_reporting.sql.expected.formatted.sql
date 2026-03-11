SELECT if(sum(secondary_indices_compressed_bytes) <= sum(secondary_indices_uncompressed_bytes), 'OK', format('FAILED (compressed: {}, uncompressed: {})', sum(secondary_indices_compressed_bytes), sum(secondary_indices_uncompressed_bytes)))
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'tab'
    AND active;
SELECT sum(data_compressed_bytes), sum(data_uncompressed_bytes)
    FROM system.parts
    WHERE table = 'codecs' AND database = currentDatabase();
SELECT sum(id), sum(val), max(s) FROM codecs;

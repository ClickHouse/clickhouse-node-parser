-- One granule, (_part_offset (8 bytes) + <one minimal physical column> (4 bytes)) * 8192 + <other two physical columns>(8 bytes) * 1 = 98312
SELECT *
FROM x
PREWHERE _part_offset = 0
SETTINGS max_bytes_to_read = 98312;
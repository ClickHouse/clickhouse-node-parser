-- One granule, (_part_offset (8 bytes) + <one minimal physical column> (4 bytes)) * 8192 + <other two physical columns>(8 bytes) * 1 = 98312
select * from x prewhere _part_offset = 0 settings max_bytes_to_read = 98312;

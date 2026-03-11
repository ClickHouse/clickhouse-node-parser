SELECT sum(secondary_indices_compressed_bytes) > 0 FROM system.parts WHERE database = currentDatabase() AND table = 'tab' AND active;
SELECT count() FROM tab WHERE data.a = 'aaa' SETTINGS force_data_skipping_indices = 'a_idx';
SELECT count() FROM tab WHERE data.b::String = 'bbb' SETTINGS force_data_skipping_indices = 'b_idx';
SELECT column FROM system.parts_columns WHERE database = currentDatabase() AND table = 'tab' AND active;
-- Check that column 'data' was materialized on MATERIALIZE INDEX query.
SELECT column FROM system.parts_columns WHERE database = currentDatabase() AND table = 'tab' AND active ORDER BY column;

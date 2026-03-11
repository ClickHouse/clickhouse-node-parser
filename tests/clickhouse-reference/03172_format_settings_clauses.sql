
-- Take the following example:
SELECT 1 UNION ALL SELECT 2 FORMAT TSV;
-- A single query with output is parsed in the same way as the UNION ALL chain:
SELECT getSetting('max_block_size') SETTINGS max_block_size = 1 FORMAT TSV SETTINGS max_block_size = 3;
-- So while these forms have a slightly different meaning, they both exist:
SELECT getSetting('max_block_size') SETTINGS max_block_size = 1 FORMAT TSV;
SELECT getSetting('max_block_size') FORMAT TSV SETTINGS max_block_size = 3;
-- Inevitably, we allow this:
SELECT getSetting('max_block_size') SETTINGS max_block_size = 1 SETTINGS max_block_size = 3 FORMAT TSV;

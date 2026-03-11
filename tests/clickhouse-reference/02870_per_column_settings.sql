SELECT count() FROM tab;
SELECT formatQuery('ALTER TABLE tab MODIFY COLUMN long_string MODIFY SETTING min_compress_block_size = 8192;');
SELECT formatQuery('ALTER TABLE tab MODIFY COLUMN long_string RESET SETTING min_compress_block_size;');
SELECT formatQuery('ALTER TABLE tab MODIFY COLUMN long_string REMOVE SETTINGS;');
SELECT formatQuery('ALTER TABLE tab MODIFY COLUMN long_string String SETTINGS (min_compress_block_size = 163840, max_compress_block_size = 163840);');
SELECT '---';
SELECT tup FROM tab ORDER BY tup LIMIT 10;

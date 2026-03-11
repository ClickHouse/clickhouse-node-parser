SELECT 1
UNION ALL
SELECT 2
FORMAT TSV;

SELECT getSetting('max_block_size')
SETTINGS max_block_size = 1
FORMAT TSV
SETTINGS max_block_size = 3;

SELECT getSetting('max_block_size')
SETTINGS max_block_size = 1
FORMAT TSV;

SELECT getSetting('max_block_size')
FORMAT TSV
SETTINGS max_block_size = 3;

SELECT getSetting('max_block_size')
SETTINGS max_block_size = 1
SETTINGS max_block_size = 3
FORMAT TSV;
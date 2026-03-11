SELECT a = '1' FROM tab WHERE a = '1' and b='a';
-- Fuzzed
SELECT * FROM tab WHERE (a = '1') AND 0 AND (b = 'a');

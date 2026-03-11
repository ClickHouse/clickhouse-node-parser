SELECT column, type, substreams, filenames FROM system.parts_columns where database=currentDatabase() and table = 'test' and active;
SELECT '-------------------------------------------------------------------------';

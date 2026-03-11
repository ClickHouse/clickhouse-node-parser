SELECT count() FROM null_subcolumns WHERE n.null;
SELECT count() FROM null_subcolumns PREWHERE n.null;
SELECT count() FROM map_subcolumns WHERE has(m.keys, 'a');
SELECT count() FROM map_subcolumns PREWHERE has(m.keys, 'b');
SELECT count() FROM map_subcolumns WHERE arrayMax(m.values) > 3;
SELECT count() FROM map_subcolumns PREWHERE arrayMax(m.values) > 3;
SELECT id, m.size0 FROM map_subcolumns;
SELECT count() FROM map_subcolumns WHERE m.size0 > 2;

select trimLeft(explain) from (EXPLAIN indexes = 1 SELECT auid FROM alpha__day WHERE auid = 1) where explain like '%Condition:%' or explain like '%Granules:%' SETTINGS enable_analyzer = 1;

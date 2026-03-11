SELECT count() FROM x WHERE A or B or (B and C) SETTINGS optimize_extract_common_expressions = 0;
SELECT count() FROM x WHERE A or B or (B and C) SETTINGS optimize_extract_common_expressions = 1;
SELECT count() FROM x WHERE (A and B) or (B and C) or (B and D and A) SETTINGS optimize_extract_common_expressions = 1;
SELECT count() FROM x WHERE (A and B) or (B and C) or (B and D and A) SETTINGS optimize_extract_common_expressions = 0;
SELECT count() FROM x WHERE (A and B) or (A and B and C) or (D and E) SETTINGS optimize_extract_common_expressions = 1;
SELECT count() FROM x WHERE (A and B) or (A and B and C) or (D and E) SETTINGS optimize_extract_common_expressions = 0;
SELECT count() FROM x WHERE (A and B) or (A and B and C) or (B and C) SETTINGS optimize_extract_common_expressions = 1;
SELECT count() FROM x WHERE (A and B) or (A and B and C) or (B and C) SETTINGS optimize_extract_common_expressions = 0;

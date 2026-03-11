SELECT a, b FROM a1 LEFT JOIN (SELECT a, b FROM a2) js2 USING a ORDER BY b SETTINGS join_default_strictness='ANY';
SELECT a, b FROM a1 LEFT JOIN (SELECT a, b FROM a2) js2 USING a ORDER BY b; -- default SETTINGS join_default_strictness='ALL';

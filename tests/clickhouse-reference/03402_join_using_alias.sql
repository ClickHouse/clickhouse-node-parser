SELECT c0 FROM remote('localhost', currentDatabase(), 't0') tx JOIN t0 USING (c1) ORDER BY c0;
SELECT c0 FROM t1_dist tx JOIN t0 USING (c1) ORDER BY c0;
-- Cannot join using alias column defined in Distributed table
SELECT c0 FROM t1_dist tx JOIN t0 USING (c2); -- { serverError UNKNOWN_IDENTIFIER }

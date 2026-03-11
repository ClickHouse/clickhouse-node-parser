SELECT * FROM summing_composite_key ORDER BY d, k, FirstMap.k1, FirstMap.k2ID, FirstMap.s, SecondMap.k1ID, SecondMap.k2Key, SecondMap.k3Type, SecondMap.s;
SELECT d, k, m.k1, m.k2ID, m.s FROM summing_composite_key ARRAY JOIN FirstMap AS m ORDER BY d, k, m.k1, m.k2ID, m.s, SecondMap.k1ID, SecondMap.k2Key, SecondMap.k3Type, SecondMap.s;
SELECT d, k, m.k1, m.k2ID, sum(m.s) FROM summing_composite_key ARRAY JOIN FirstMap AS m GROUP BY d, k, m.k1, m.k2ID ORDER BY d, k, m.k1, m.k2ID;
SELECT d, k, m.k1, m.k2ID, m.s FROM summing_composite_key FINAL ARRAY JOIN FirstMap AS m ORDER BY d, k, m.k1, m.k2ID, m.s;
SELECT d, k, m.k1ID, m.k2Key, m.k3Type, m.s FROM summing_composite_key ARRAY JOIN SecondMap AS m ORDER BY d, k, m.k1ID, m.k2Key, m.k3Type, m.s;
SELECT d, k, m.k1ID, m.k2Key, m.k3Type, sum(m.s) FROM summing_composite_key ARRAY JOIN SecondMap AS m GROUP BY d, k, m.k1ID, m.k2Key, m.k3Type ORDER BY d, k, m.k1ID, m.k2Key, m.k3Type;
SELECT d, k, m.k1ID, m.k2Key, m.k3Type, m.s FROM summing_composite_key FINAL ARRAY JOIN SecondMap AS m ORDER BY d, k, m.k1ID, m.k2Key, m.k3Type, m.s;
SELECT d, k, m.k1, m.k2ID, m.s FROM summing_composite_key ARRAY JOIN FirstMap AS m ORDER BY d, k, m.k1, m.k2ID, m.s;

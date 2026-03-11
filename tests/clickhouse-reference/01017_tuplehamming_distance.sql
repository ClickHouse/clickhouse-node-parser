SELECT tupleHammingDistance((1, 2), (3, 4));
SELECT tupleHammingDistance((120, 243), (120, 434));
SELECT tupleHammingDistance((-12, 434), (434, 434));
SELECT tupleHammingDistance((12, 43), t1) FROM defaults;
SELECT tupleHammingDistance(t2, (546, 456)) FROM defaults;
SELECT tupleHammingDistance(t2, t3) FROM defaults;

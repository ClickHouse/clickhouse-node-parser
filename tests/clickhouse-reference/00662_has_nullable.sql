SELECT a, has([0, 1], a) FROM 00662_has_nullable;
SELECT a, has([NULL, 1, 2], a) FROM 00662_has_nullable;
SELECT a, has([NULL, NULL], a) FROM 00662_has_nullable;

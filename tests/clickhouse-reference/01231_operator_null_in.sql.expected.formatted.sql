SELECT count() == 2
FROM null_in
WHERE i IN (1, 3, NULL);

SELECT count() == 2
FROM null_in
WHERE i IN (range(4));

SELECT count() == 2
FROM null_in
WHERE s IN ('1', '3', NULL);

SELECT count() == 2
FROM null_in
WHERE i GLOBAL IN (1, 3, NULL);

SELECT count() == 2
FROM null_in
WHERE i GLOBAL IN (range(4));

SELECT count() == 2
FROM null_in
WHERE s GLOBAL IN ('1', '3', NULL);

SELECT count() == 1
FROM null_in
WHERE i NOT IN (1, 3, NULL);

SELECT count() == 1
FROM null_in
WHERE i NOT IN (range(4));

SELECT count() == 1
FROM null_in
WHERE s NOT IN ('1', '3', NULL);

SELECT count() == 1
FROM null_in
WHERE i GLOBAL NOT IN (1, 3, NULL);

SELECT count() == 1
FROM null_in
WHERE i GLOBAL NOT IN (range(4));

SELECT count() == 1
FROM null_in
WHERE s GLOBAL NOT IN ('1', '3', NULL);

SELECT count() == 4
FROM null_in
WHERE i IN (1, 3, NULL);

SELECT count() == 4
FROM null_in
WHERE s IN ('1', '3', NULL);

SELECT count() == 4
FROM null_in
WHERE i GLOBAL IN (1, 3, NULL);

SELECT count() == 4
FROM null_in
WHERE s GLOBAL IN ('1', '3', NULL);

SELECT count() == 3
FROM null_in
WHERE i NOT IN (range(4));

SELECT count() == 3
FROM null_in
WHERE i GLOBAL NOT IN (range(4));

SELECT count() == 3
FROM null_in
WHERE i NOT IN (1, 3);

SELECT count() == 3
FROM null_in
WHERE s NOT IN ('1', '3');

SELECT count() == 3
FROM null_in
WHERE i GLOBAL NOT IN (1, 3);

SELECT count() == 3
FROM null_in
WHERE s GLOBAL NOT IN ('1', '3');

SELECT count() == 1
FROM null_in
WHERE i IN (test_set);

SELECT count() == 2
FROM null_in
WHERE i NOT IN (test_set);

SELECT count() == 1
FROM null_in
WHERE i GLOBAL IN (test_set);

SELECT count() == 2
FROM null_in
WHERE i GLOBAL NOT IN (test_set);

SELECT count() == 3
FROM null_in
WHERE i IN (test_set);

SELECT count() == 3
FROM null_in
WHERE i GLOBAL IN (test_set);

SELECT count() == 1
FROM null_in
WHERE i IN (test_set2);

SELECT count() == 2
FROM null_in
WHERE i NOT IN (test_set2);

SELECT count() == 1
FROM null_in
WHERE i GLOBAL IN (test_set2);

SELECT count() == 2
FROM null_in
WHERE i GLOBAL NOT IN (test_set2);

SELECT count() == 3
FROM null_in
WHERE i IN (test_set2);

SELECT count() == 3
FROM null_in
WHERE i GLOBAL IN (test_set2);
SELECT accurateCast(100000000000000000000, 'DateTime');

SELECT accurateCast(-100000000000000000000, 'DateTime');

SELECT accurateCast(4294967295, 'DateTime');

SELECT accurateCast(0, 'DateTime');

SELECT accurateCast(4294967296, 'DateTime');

SELECT accurateCast(-1, 'DateTime');
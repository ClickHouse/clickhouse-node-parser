SELECT indexOfAssumeSorted(numbers, 4) FROM test WHERE id = 1;
SELECT indexOfAssumeSorted(numbers, 5) FROM test WHERE id = 2;
SELECT indexOfAssumeSorted(numbers, 5) FROM test WHERE id = 3;
SELECT indexOfAssumeSorted(numbers, 1) FROM test WHERE id = 4;
SELECT indexOfAssumeSorted(numbers, 1) FROM test WHERE id = 5;
SELECT indexOfAssumeSorted([1, 2, 2, 2, 3, 3, 3, 4, 4], 4);
SELECT indexOfAssumeSorted([10, 10, 10], 1);
SELECT indexOfAssumeSorted([1, 1, 1], 10);

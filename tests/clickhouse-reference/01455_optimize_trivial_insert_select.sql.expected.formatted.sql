-- If data was inserted by more threads, we will probably see data out of order.
SELECT DISTINCT
    blockSize(),
    runningDifference(x)
FROM t;
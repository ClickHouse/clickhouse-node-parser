SELECT {q1:QBit(Float32, 4)};

SELECT {q2:QBit(Float64, 4)};

SELECT {q3:QBit(BFloat16, 8)};

SELECT {q4:QBit(Float32, 2)};

SELECT {q5:QBit(Float32, 16)};

SELECT L2DistanceTransposed({q6:QBit(Float32, 4)}, [1, 2, 3, 4], 32);

SELECT
    id,
    L2DistanceTransposed(vec, {q7:Array(Float32)}, 4) AS dist
FROM qbit_param_test
ORDER BY id ASC;
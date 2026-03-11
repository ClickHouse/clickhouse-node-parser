SELECT id
FROM tab_f64
ORDER BY L2Distance(vec, constF64()) ASC
LIMIT 1;

SELECT id
FROM tab_f64
ORDER BY L2Distance(vec, constF32()) ASC
LIMIT 1;

SELECT id
FROM tab_f64
ORDER BY L2Distance(vec, constBF16()) ASC
LIMIT 1;

SELECT id
FROM tab_f32
ORDER BY L2Distance(vec, constF64()) ASC
LIMIT 1;

SELECT id
FROM tab_f32
ORDER BY L2Distance(vec, constF32()) ASC
LIMIT 1;

SELECT id
FROM tab_f32
ORDER BY L2Distance(vec, constBF16()) ASC
LIMIT 1;

SELECT id
FROM tab_bf16
ORDER BY L2Distance(vec, constF64()) ASC
LIMIT 1;

SELECT id
FROM tab_bf16
ORDER BY L2Distance(vec, constF32()) ASC
LIMIT 1;

SELECT id
FROM tab_bf16
ORDER BY L2Distance(vec, constBF16()) ASC
LIMIT 1;

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab_f64
        ORDER BY L2Distance(vec, constF64()) ASC
        LIMIT 1
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab_f64
        ORDER BY L2Distance(vec, constF32()) ASC
        LIMIT 1
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab_f64
        ORDER BY L2Distance(vec, constBF16()) ASC
        LIMIT 1
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab_f32
        ORDER BY L2Distance(vec, constF64()) ASC
        LIMIT 1
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab_f32
        ORDER BY L2Distance(vec, constF32()) ASC
        LIMIT 1
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab_f32
        ORDER BY L2Distance(vec, constBF16()) ASC
        LIMIT 1
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab_bf16
        ORDER BY L2Distance(vec, constF64()) ASC
        LIMIT 1
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab_bf16
        ORDER BY L2Distance(vec, constF32()) ASC
        LIMIT 1
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab_bf16
        ORDER BY L2Distance(vec, constBF16()) ASC
        LIMIT 1
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab_f32
        ORDER BY L2Distance(vec, nonConstF32(rand())) ASC
        LIMIT 1
    )
WHERE like(`explain`, '%vector_similarity%');
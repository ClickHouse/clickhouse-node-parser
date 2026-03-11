SELECT
    mapConcat(map(1, 2)),
    mapApply((x, y) -> (map(1, 2), x + 1), map(1, 0));
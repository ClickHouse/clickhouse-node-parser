SELECT JSONMergePatch(REPEAT('{"c":', 1000000));

SELECT JSONMergePatch(REPEAT('{"c":', 100000));

SELECT JSONMergePatch(REPEAT('{"c":', 10000));

SELECT JSONMergePatch(REPEAT('{"c":', 1000));

SELECT JSONMergePatch(REPEAT('{"c":', 100));

SELECT JSONMergePatch(REPEAT('{"c":', 10));

SELECT JSONMergePatch(REPEAT('{"c":', 1));
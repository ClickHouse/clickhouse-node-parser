SELECT
    [] AS arr,
    if(empty(arr), 0, arr[-1]);

SELECT
    [] AS arr,
    multiIf(empty(arr), 0, length(arr) > 1, arr[-1], 0);
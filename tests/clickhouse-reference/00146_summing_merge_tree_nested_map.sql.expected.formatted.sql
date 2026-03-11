SELECT
    `SomeMap.ID`,
    `SomeMap.Num`
FROM nested_map;

SELECT
    SomeIntExcluded,
    `SomeMap.ID`,
    `SomeMap.Num`
FROM nested_map_explicit;
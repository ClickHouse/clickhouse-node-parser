SELECT
    if(CAST(NULL, 'Nullable(UInt8)') = 1, CAST(NULL, 'Nullable(UInt8)'), -1) AS x,
    toTypeName(x),
    dumpColumnStructure(x);
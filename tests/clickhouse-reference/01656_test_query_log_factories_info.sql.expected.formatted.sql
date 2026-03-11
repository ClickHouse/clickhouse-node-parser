SELECT
    uniqArray([1, 1, 2]),
    SUBSTRING('Hello, world', 7, 5),
    POW(1, 2),
    ROUND(TANh(1)),
    CrC32(''),
    SUM(number),
    MAX(number),
    flatten([[[BIT_AND(123)]], [[mod(3, 2)], [CAST('1' AS INTEGER)]]]),
    week(toDate('2000-12-05')),
    CAST(arrayJoin([NULL, NULL]) AS Nullable(TEXT)),
    avgOrDefaultIf(number, number % 2),
    sumOrNull(number),
    toTypeName(sumOrNull(number)),
    countIf(toDate('2000-12-05') + number AS d, toDayOfYear(d) % 2)
FROM numbers(100);

SELECT repeat('aa', number)
FROM numbers(10e3)
SETTINGS
    max_memory_usage = 4e6,
    max_block_size = 100
FORMAT Null;

SELECT arraySort(used_aggregate_functions)
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND (like(query, '%toDate(''2000-12-05'')%'))
ORDER BY query_start_time DESC
LIMIT 1
FORMAT TabSeparatedWithNames;

SELECT arraySort(used_aggregate_function_combinators)
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND (like(query, '%toDate(''2000-12-05'')%'))
ORDER BY query_start_time DESC
LIMIT 1
FORMAT TabSeparatedWithNames;

SELECT arraySort(used_table_functions)
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND (like(query, '%toDate(''2000-12-05'')%'))
ORDER BY query_start_time DESC
LIMIT 1
FORMAT TabSeparatedWithNames;

SELECT arraySort(arrayMap(x -> if(x == 'crc32', 'CRC32', x), arrayFilter(x -> x != 'arrayJoin', used_functions))) AS `arraySort(used_functions)`
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND (like(query, '%toDate(''2000-12-05'')%'))
ORDER BY query_start_time DESC
LIMIT 1
FORMAT TabSeparatedWithNames;

SELECT used_functions
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type != 'QueryStart'
    AND (like(query, '%repeat%'))
ORDER BY query_start_time DESC
LIMIT 1
FORMAT TabSeparatedWithNames;

SELECT arraySort(used_data_type_families)
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND (like(query, '%toDate(''2000-12-05'')%'))
ORDER BY query_start_time DESC
LIMIT 1
FORMAT TabSeparatedWithNames;

SELECT used_database_engines
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type == 'QueryFinish'
    AND (like(query, '%database test_query_log_factories_info%'))
ORDER BY query_start_time DESC
LIMIT 1
FORMAT TabSeparatedWithNames;

SELECT
    arraySort(used_data_type_families),
    used_storages
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type == 'QueryFinish'
    AND (like(query, '%TABLE test%'))
ORDER BY query_start_time DESC
LIMIT 1
FORMAT TabSeparatedWithNames;
SET enable_json_type = 1;
set enable_analyzer = 1;
set output_format_native_write_json_as_string=0;
create table test (json JSON(max_dynamic_paths=2, max_dynamic_types=2, a UInt32, b String, SKIP c)) engine=Memory;
select
    json::JSON(max_dynamic_paths=2, max_dynamic_types=1, a UInt32, b String, SKIP c) as json2,
    JSONDynamicPaths(json2),
    JSONSharedDataPaths(json2),
    dynamicType(json2.k2),
    isDynamicElementInSharedData(json2.k2),
    dynamicType(json2.k4),
    isDynamicElementInSharedData(json2.k4)
from test;
select
    json::JSON(max_dynamic_paths=2, max_dynamic_types=4, a UInt32, b String, SKIP c) as json2,
    JSONDynamicPaths(json2),
    JSONSharedDataPaths(json2),
    dynamicType(json2.k2),
    isDynamicElementInSharedData(json2.k2),
    dynamicType(json2.k4),
    isDynamicElementInSharedData(json2.k4)
from test;
select
    json::JSON(max_dynamic_paths=4, max_dynamic_types=2, a UInt32, b String, SKIP c) as json2,
    JSONDynamicPaths(json2),
    JSONSharedDataPaths(json2),
    dynamicType(json2.k2),
    isDynamicElementInSharedData(json2.k2),
    dynamicType(json2.k4),
    isDynamicElementInSharedData(json2.k4)
from test;
select
    json::JSON(max_dynamic_paths=4, max_dynamic_types=1, a UInt32, b String, SKIP c) as json2,
    JSONDynamicPaths(json2),
    JSONSharedDataPaths(json2),
    dynamicType(json2.k2),
    isDynamicElementInSharedData(json2.k2),
    dynamicType(json2.k4),
    isDynamicElementInSharedData(json2.k4)
from test;
select
    json::JSON(max_dynamic_paths=4, max_dynamic_types=4, a UInt32, b String, SKIP c) as json2,
    JSONDynamicPaths(json2),
    JSONSharedDataPaths(json2),
    dynamicType(json2.k2),
    isDynamicElementInSharedData(json2.k2),
    dynamicType(json2.k4),
    isDynamicElementInSharedData(json2.k4)
from test;
select
    json::JSON(max_dynamic_paths=1, max_dynamic_types=2, a UInt32, b String, SKIP c) as json2,
    JSONDynamicPaths(json2),
    JSONSharedDataPaths(json2),
    dynamicType(json2.k2),
    isDynamicElementInSharedData(json2.k2),
    dynamicType(json2.k4),
    isDynamicElementInSharedData(json2.k4)
from test;
select
    json::JSON(max_dynamic_paths=1, max_dynamic_types=1, a UInt32, b String, SKIP c) as json2,
    JSONDynamicPaths(json2),
    JSONSharedDataPaths(json2),
    dynamicType(json2.k2),
    isDynamicElementInSharedData(json2.k2),
    dynamicType(json2.k4),
    isDynamicElementInSharedData(json2.k4)
from test;
select
    json::JSON(max_dynamic_paths=1, max_dynamic_types=4, a UInt32, b String, SKIP c) as json2,
    JSONDynamicPaths(json2),
    JSONSharedDataPaths(json2),
    dynamicType(json2.k2),
    isDynamicElementInSharedData(json2.k2),
    dynamicType(json2.k4),
    isDynamicElementInSharedData(json2.k4)
from test;

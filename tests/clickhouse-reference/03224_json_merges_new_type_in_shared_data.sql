select distinct dynamicType(json.b) as type, isDynamicElementInSharedData(json.b) from test order by type;

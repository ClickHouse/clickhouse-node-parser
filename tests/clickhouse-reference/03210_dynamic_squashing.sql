select distinct dynamicType(d) as type, isDynamicElementInSharedData(d) as flag from test order by type;

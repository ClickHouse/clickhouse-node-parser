select d1, dynamicType(d1), isDynamicElementInSharedData(d1) from test order by d1 nulls first;
select d1, dynamicType(d1), isDynamicElementInSharedData(d1) from test order by d1 nulls last;
select d2, dynamicType(d2), isDynamicElementInSharedData(d2) from test order by d2 nulls first;
select d2, dynamicType(d2), isDynamicElementInSharedData(d2) from test order by d2 nulls last;
select d1, d2, dynamicType(d1), isDynamicElementInSharedData(d1), dynamicType(d2), isDynamicElementInSharedData(d2) from test order by d1, d2 nulls first;
select d1, d2, dynamicType(d1), isDynamicElementInSharedData(d1), dynamicType(d2), isDynamicElementInSharedData(d2) from test order by d1, d2 nulls last;
select d1, d2, dynamicType(d1), isDynamicElementInSharedData(d1), dynamicType(d2), isDynamicElementInSharedData(d2) from test order by d2, d1 nulls first;
select d1, d2, dynamicType(d1), isDynamicElementInSharedData(d1), dynamicType(d2), isDynamicElementInSharedData(d2) from test order by d2, d1 nulls last;

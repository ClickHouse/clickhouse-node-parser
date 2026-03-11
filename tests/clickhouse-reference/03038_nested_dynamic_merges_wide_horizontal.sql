select count(), dynamicType(d) || ':' || dynamicType(d.`Tuple(a Dynamic(max_types=2))`.a) as type, isDynamicElementInSharedData(d.`Tuple(a Dynamic(max_types=2))`.a) as flag from test group by type, flag order by count(), type;
select '---------------------';

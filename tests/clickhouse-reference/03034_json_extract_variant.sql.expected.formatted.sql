SELECT
    JSONExtract('{"a" : 42}', 'a', 'Variant(String, UInt32)') AS v,
    variantType(v);

SELECT
    JSONExtract('{"a" : "Hello"}', 'a', 'Variant(String, UInt32)') AS v,
    variantType(v);

SELECT
    JSONExtract('{"a" : [1, 2, 3]}', 'a', 'Variant(String, Array(UInt32))') AS v,
    variantType(v);

SELECT JSONExtract('{"obj" : {"a" : 42, "b" : "Hello", "c" : [1,2,3]}}', 'obj', 'Map(String, Variant(UInt32, String, Array(UInt32)))');

SELECT
    JSONExtractKeysAndValues('{"a" : 42, "b" : "Hello", "c" : [1,2,3]}', 'Variant(UInt32, String, Array(UInt32))') AS v,
    toTypeName(v);
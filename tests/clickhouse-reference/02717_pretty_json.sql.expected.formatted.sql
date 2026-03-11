SELECT
    42 AS num,
    [42, 42] AS arr,
    [[[42, 42], [42, 42]], [[42, 42]]] AS nested_arr,
    tuple(42, 42)::Tuple(a UInt32, b UInt32) AS tuple,
    tuple(tuple(tuple(42, 42), 42), 42)::Tuple(a Tuple(b Tuple(c UInt32, d UInt32), e UInt32), f UInt32) AS nested_tuple,
    map(42, 42, 24, 24) AS map,
    map(42, map(42, map(42, 42))) AS nested_map,
    [tuple(map(42, 42), [42, 42]), tuple(map(42, 42), [42, 42])]::Array(Tuple(Map(UInt32, UInt32), Array(UInt32))) AS nested_types
FORMAT PrettyNDJSON;
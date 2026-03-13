SELECT hasAll([], []);

SELECT hasAll([], [1]);

SELECT hasAll([], [NULL]);

SELECT hasAll([Null], [Null]);

SELECT hasAll([Null], [Null, 1]);

SELECT hasAll([1], []);

SELECT hasAll([1], [Null]);

SELECT hasAll([1, Null], [Null]);

SELECT hasAny([], []);

SELECT hasAny([], [1]);

SELECT hasAny([], [NULL]);

SELECT hasAny([Null], [Null]);

SELECT hasAny([Null], [Null, 1]);

SELECT hasAny([1], []);

SELECT hasAny([1], [Null]);

SELECT hasAny([1, Null], [Null]);

SELECT hasAll([1], emptyArrayUInt8());

SELECT hasAny([1], emptyArrayUInt8());

SELECT hasAny([1, 2, 3, 4], [5, 6]);

SELECT hasAny([1, 2, 3, 4], [1, 3, 5]);

SELECT hasAny([1, 2, 3, 4], [1, 3]);

SELECT hasAll([1, 2, 3, 4], [1, 3]);

SELECT hasAll([1, 2, 3, 4], [1, 3, 5]);

SELECT hasAny([-128, 1., 512], [1.]);

SELECT hasAny([-128, 1.0, 512], [.3]);

SELECT hasAll([-128, 1.0, 512], [1.0]);

SELECT hasAll([-128, 1.0, 512], [1.0, 513]);

SELECT hasAny(['a'], ['a']);

SELECT hasAll(['a'], ['a']);

SELECT hasAny(['a', 'b'], ['a', 'c']);

SELECT hasAll(['a', 'b'], ['a', 'c']);

SELECT hasAny([1], ['a']); -- { serverError NO_COMMON_TYPE }

SELECT hasAll([1], ['a']); -- { serverError NO_COMMON_TYPE }

SELECT hasAll([[1, 2], [3, 4]], ['a', 'c']); -- { serverError NO_COMMON_TYPE }

SELECT hasAny([[1, 2], [3, 4]], ['a', 'c']); -- { serverError NO_COMMON_TYPE }

SELECT hasAll([[1, 2], [3, 4]], [[1, 2], [3, 5]]);

SELECT hasAll([[1, 2], [3, 4]], [[1, 2], [1, 2]]);

SELECT hasAny([[1, 2], [3, 4]], [[1, 2], [3, 5]]);

SELECT hasAny([[1, 2], [3, 4]], [[1, 3], [4, 2]]);
SELECT hasSubstr([], []);

SELECT hasSubstr([], [1]);

SELECT hasSubstr([], [NULL]);

SELECT hasSubstr([Null], [Null]);

SELECT hasSubstr([Null], [Null, 1]);

SELECT hasSubstr([1], []);

SELECT hasSubstr([1], [Null]);

SELECT hasSubstr([1, Null], [Null]);

SELECT hasSubstr([1, Null, 3, 4, Null, 5, 7], [3, 4, Null]);

SELECT hasSubstr([1, Null], [3, 4, Null]);

SELECT hasSubstr([1], emptyArrayUInt8());

SELECT hasSubstr([1, 2, 3, 4], [1, 3]);

SELECT hasSubstr([1, 2, 3, 4], [1, 3, 5]);

SELECT hasSubstr([-128, 1., 512], [1.]);

SELECT hasSubstr([-128, 1.0, 512], [.3]);

SELECT hasSubstr(['a'], ['a']);

SELECT hasSubstr(['a', 'b'], ['a', 'c']);

SELECT hasSubstr(['a', 'c', 'b'], ['a', 'c']);

SELECT hasSubstr([1], ['a']); -- { serverError NO_COMMON_TYPE }

SELECT hasSubstr([[1, 2], [3, 4]], ['a', 'c']); -- { serverError NO_COMMON_TYPE }

SELECT hasSubstr([[1, 2], [3, 4], [5, 8]], [[3, 4]]);

SELECT hasSubstr([[1, 2], [3, 4], [5, 8]], [[3, 4], [5, 8]]);

SELECT hasSubstr([[1, 2], [3, 4], [5, 8]], [[1, 2], [5, 8]]);
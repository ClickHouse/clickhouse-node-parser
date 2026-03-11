SELECT arrayFilter(x -> (isNotNull(x)), []);

SELECT arrayFilter(x -> (isNotNull(x)), [NULL]);

SELECT arrayFilter(x -> (isNotNull(x)), [1]);

SELECT arrayFilter(x -> (isNull(x)), []);

SELECT arrayFilter(x -> (isNull(x)), [NULL]);

SELECT arrayFilter(x -> (isNull(x)), [1]);
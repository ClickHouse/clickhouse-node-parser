SELECT arrayLevenshteinDistance(lhs, rhs)
FROM simple_levenshtein;

SELECT
    arrayLevenshteinDistance(['1', '2'], ['1']),
    arrayLevenshteinDistance([toFixedString('1', 16), toFixedString('2', 16)], [toFixedString('1', 16)]),
    arrayLevenshteinDistance([toUInt16(1)], [toUInt16(2), 1]),
    arrayLevenshteinDistance([toFloat32(1.1), 2], [toFloat32(1.1)]),
    arrayLevenshteinDistance([toFloat64(1.1), 2], [toFloat64(1.1)]),
    arrayLevenshteinDistance([toDate('2025-01-01'), toDate('2025-01-02')], [toDate('2025-01-01')]);

SELECT arrayLevenshteinDistanceWeighted(lhs, rhs, lhs_weights, rhs_weights)
FROM weighted_levenshtein;

SELECT
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [1., 2], [1.]),
    arrayLevenshteinDistanceWeighted([toFixedString('1', 16), toFixedString('2', 16)], [toFixedString('1', 16)], [1., 2], [1.]),
    arrayLevenshteinDistanceWeighted([toUInt16(1)], [toUInt16(2), 1], [1.], [2., 1]),
    arrayLevenshteinDistanceWeighted([toFloat32(1.1), 2], [toFloat32(1.1)], [1., 2], [1.]),
    arrayLevenshteinDistanceWeighted([toFloat64(1.1), 2], [toFloat64(1.1)], [1., 2], [1.]),
    arrayLevenshteinDistanceWeighted([toDate('2025-01-01'), toDate('2025-01-02')], [toDate('2025-01-01')], [1., 2], [1.]);

SELECT
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toUInt8(1), 2], [toUInt8(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toUInt16(1), 2], [toUInt16(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toUInt32(1), 2], [toUInt32(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toUInt64(1), 2], [toUInt64(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toUInt128(1), 2], [toUInt128(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toUInt256(1), 2], [toUInt256(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toInt8(1), toInt8(2)], [toInt8(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toInt16(1), 2], [toInt16(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toInt32(1), 2], [toInt32(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toInt64(1), 2], [toInt64(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toInt128(1), 2], [toInt128(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toInt256(1), 2], [toInt256(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toFloat32(1), 2], [toFloat32(1)]),
    arrayLevenshteinDistanceWeighted(['1', '2'], ['1'], [toFloat64(1), 2], [toFloat64(1)]);

SELECT round(arraySimilarity(lhs, rhs, lhs_weights, rhs_weights), 5)
FROM weighted_levenshtein;

SELECT
    arraySimilarity(['1', '2'], ['1'], [1., 2], [1.]),
    arraySimilarity([toFixedString('1', 16), toFixedString('2', 16)], [toFixedString('1', 16)], [1., 2], [1.]),
    arraySimilarity([toUInt16(1)], [toUInt16(2), 1], [1.], [2., 1]),
    arraySimilarity([toFloat32(1.1), 2], [toFloat32(1.1)], [1., 2], [1.]),
    arraySimilarity([toFloat64(1.1), 2], [toFloat64(1.1)], [1., 2], [1.]),
    arraySimilarity([toDate('2025-01-01'), toDate('2025-01-02')], [toDate('2025-01-01')], [1., 2], [1.]);

SELECT
    arraySimilarity(['1', '2'], ['1'], [toUInt8(1), 2], [toUInt8(1)]),
    arraySimilarity(['1', '2'], ['1'], [toUInt16(1), 2], [toUInt16(1)]),
    arraySimilarity(['1', '2'], ['1'], [toUInt32(1), 2], [toUInt32(1)]),
    arraySimilarity(['1', '2'], ['1'], [toUInt64(1), 2], [toUInt64(1)]),
    arraySimilarity(['1', '2'], ['1'], [toUInt128(1), 2], [toUInt128(1)]),
    arraySimilarity(['1', '2'], ['1'], [toUInt256(1), 2], [toUInt256(1)]),
    arraySimilarity(['1', '2'], ['1'], [toInt8(1), toInt8(2)], [toInt8(1)]),
    arraySimilarity(['1', '2'], ['1'], [toInt16(1), 2], [toInt16(1)]),
    arraySimilarity(['1', '2'], ['1'], [toInt32(1), 2], [toInt32(1)]),
    arraySimilarity(['1', '2'], ['1'], [toInt64(1), 2], [toInt64(1)]),
    arraySimilarity(['1', '2'], ['1'], [toInt128(1), 2], [toInt128(1)]),
    arraySimilarity(['1', '2'], ['1'], [toInt256(1), 2], [toInt256(1)]),
    arraySimilarity(['1', '2'], ['1'], [toFloat32(1), 2], [toFloat32(1)]),
    arraySimilarity(['1', '2'], ['1'], [toFloat64(1), 2], [toFloat64(1)]);

SELECT arrayLevenshteinDistance(lhs, rhs, lhs_weights, rhs_weights)
FROM weighted_levenshtein;

SELECT arrayLevenshteinDistanceWeighted(lhs, rhs)
FROM simple_levenshtein;

SELECT round(arraySimilarity(lhs, rhs), 5)
FROM simple_levenshtein;

SELECT arrayLevenshteinDistance(1, [1]);

SELECT arrayLevenshteinDistanceWeighted([1], 1, [1, 2], [1]);

SELECT arraySimilarity([1, 2], 1, [1, 2], [1]);

SELECT arrayLevenshteinDistanceWeighted([1, 2], [1], [1., 2], [1., 2]);

SELECT arraySimilarity([1, 2], [1], [1., 2], [1., 2]);
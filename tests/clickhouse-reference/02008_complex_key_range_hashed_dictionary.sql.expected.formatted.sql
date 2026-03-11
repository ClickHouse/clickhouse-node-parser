SELECT dictGet('range_dictionary', 'Tax', (toUInt64(1), '1'), toDate('2019-05-15'));

SELECT dictGet('range_dictionary', 'Tax', (toUInt64(1), '1'), toDate('2019-05-29'));

SELECT dictGet('range_dictionary', 'Tax', (toUInt64(2), '2'), toDate('2019-05-29'));

SELECT dictGet('range_dictionary', 'Tax', (toUInt64(2), '2'), toDate('2019-05-31'));

SELECT dictGetOrDefault('range_dictionary', 'Tax', (toUInt64(2), '2'), toDate('2019-05-31'), 0.4);

SELECT dictHas('range_dictionary', (toUInt64(1), '1'), toDate('2019-05-15'));

SELECT dictHas('range_dictionary', (toUInt64(1), '1'), toDate('2019-05-29'));

SELECT dictHas('range_dictionary', (toUInt64(2), '2'), toDate('2019-05-29'));

SELECT dictHas('range_dictionary', (toUInt64(2), '2'), toDate('2019-05-31'));

SELECT *
FROM range_dictionary
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT 1
FROM range_dictionary
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT
    CountryID,
    StartDate,
    Tax
FROM range_dictionary
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT Tax
FROM range_dictionary
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT dictGet('range_dictionary_nullable', 'Tax', (toUInt64(1), '1'), toDate('2019-05-15'));

SELECT dictGet('range_dictionary_nullable', 'Tax', (toUInt64(1), '1'), toDate('2019-05-29'));

SELECT dictGet('range_dictionary_nullable', 'Tax', (toUInt64(2), '2'), toDate('2019-05-29'));

SELECT dictGet('range_dictionary_nullable', 'Tax', (toUInt64(2), '2'), toDate('2019-05-31'));

SELECT dictGetOrDefault('range_dictionary_nullable', 'Tax', (toUInt64(2), '2'), toDate('2019-05-31'), 0.4);

SELECT dictHas('range_dictionary_nullable', (toUInt64(1), '1'), toDate('2019-05-15'));

SELECT dictHas('range_dictionary_nullable', (toUInt64(1), '1'), toDate('2019-05-29'));

SELECT dictHas('range_dictionary_nullable', (toUInt64(2), '2'), toDate('2019-05-29'));

SELECT dictHas('range_dictionary_nullable', (toUInt64(2), '2'), toDate('2019-05-31'));

SELECT *
FROM range_dictionary_nullable
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT 1
FROM range_dictionary_nullable
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT
    CountryID,
    StartDate,
    Tax
FROM range_dictionary_nullable
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;

SELECT Tax
FROM range_dictionary_nullable
ORDER BY
    CountryID ASC,
    StartDate ASC,
    EndDate ASC;
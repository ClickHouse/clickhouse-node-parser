SELECT JSONExtractKeysAndValuesRaw(arrayJoin([]));

SELECT JSONHas(arrayJoin([]));

SELECT isValidJSON(arrayJoin([]));

SELECT concat(arrayJoin([]), arrayJoin([NULL, '']));

SELECT plus(arrayJoin([]), arrayJoin([NULL, 1]));

SELECT sipHash64(arrayJoin([]), [NULL], arrayJoin(['', NULL, '', NULL]));

SELECT [concat(NULL, arrayJoin([]))];
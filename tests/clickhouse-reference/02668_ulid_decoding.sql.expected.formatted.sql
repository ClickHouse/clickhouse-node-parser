SELECT dateDiff('minute', ULIDStringToDateTime(generateULID()), now()) <= 1;

SELECT toTimezone(ULIDStringToDateTime('01GWJWKW30MFPQJRYEAF4XFZ9E'), 'America/Costa_Rica');

SELECT ULIDStringToDateTime('01GWJWKW30MFPQJRYEAF4XFZ9E', 'America/Costa_Rica');

SELECT ULIDStringToDateTime('01GWJWKW30MFPQJRYEAF4XFZ9', 'America/Costa_Rica');

SELECT ULIDStringToDateTime('01GWJWKW30MFPQJRYEAF4XFZ9E', 'America/Costa_Ric');

SELECT ULIDStringToDateTime('01GWJWKW30MFPQJRYEAF4XFZ9E0');

SELECT ULIDStringToDateTime(1);

SELECT ULIDStringToDateTime(1, 2);
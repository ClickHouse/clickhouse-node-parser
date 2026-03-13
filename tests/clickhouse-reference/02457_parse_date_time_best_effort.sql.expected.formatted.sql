SELECT parseDateTimeBestEffort('01/12/2017, 18:31:44');

SELECT parseDateTimeBestEffortUS('01/12/2017, 18:31:44');

SELECT parseDateTimeBestEffort('01/12/2017,18:31:44');

SELECT parseDateTimeBestEffortUS('01/12/2017,18:31:44');

SELECT parseDateTimeBestEffort('01/12/2017 ,   18:31:44');

SELECT parseDateTimeBestEffortUS('01/12/2017    ,18:31:44');

SELECT parseDateTimeBestEffortUS('18:31:44, 31/12/2015');

SELECT parseDateTimeBestEffortUS('18:31:44  , 31/12/2015');

SELECT parseDateTimeBestEffort('18:31:44, 31/12/2015');

SELECT parseDateTimeBestEffort('18:31:44  , 31/12/2015');

SELECT parseDateTimeBestEffort('01/12/2017,'); -- { serverError CANNOT_PARSE_DATETIME }

SELECT parseDateTimeBestEffortUS('18:31:44,,,, 31/12/2015'); -- { serverError CANNOT_PARSE_DATETIME }

SELECT parseDateTimeBestEffortUS('18:31:44, 31/12/2015,'); -- { serverError CANNOT_PARSE_TEXT }

SELECT parseDateTimeBestEffort('01/12/2017, 18:31:44,'); -- { serverError CANNOT_PARSE_TEXT }

SELECT parseDateTimeBestEffort('01/12/2017, ,,,18:31:44'); -- { serverError CANNOT_PARSE_DATETIME }

SELECT parseDateTimeBestEffort('18:31:44  ,,,,, 31/12/2015'); -- { serverError CANNOT_PARSE_DATETIME }
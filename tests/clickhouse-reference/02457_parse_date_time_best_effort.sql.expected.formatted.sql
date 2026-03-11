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

SELECT parseDateTimeBestEffort('01/12/2017,');

SELECT parseDateTimeBestEffortUS('18:31:44,,,, 31/12/2015');

SELECT parseDateTimeBestEffortUS('18:31:44, 31/12/2015,');

SELECT parseDateTimeBestEffort('01/12/2017, 18:31:44,');

SELECT parseDateTimeBestEffort('01/12/2017, ,,,18:31:44');

SELECT parseDateTimeBestEffort('18:31:44  ,,,,, 31/12/2015');
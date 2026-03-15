-- { echoOn }
SELECT JSONArrayLength(NULL);

SELECT JSONArrayLength('');

SELECT JSONArrayLength('[]');

SELECT JSONArrayLength('[1,2,3]');

SELECT JSONArrayLength('[[1,2],[5,6,7]]');

SELECT JSONArrayLength('[{"a":123},{"b":"hello"}]');

SELECT JSONArrayLength('[1,2,3,[33,44],{"key":[2,3,4]}]');

SELECT JSONArrayLength('{"key":"not a json array"}');

SELECT JSONArrayLength('[1,2,3,4,5');

SELECT JSON_ARRAY_LENGTH('[1,2,3,4,5');

SELECT JSON_ARRAY_LENGTH('[1,2,3,4,5]');

SELECT JSONArrayLength(2); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT JSONArrayLength(); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
SELECT toFixedString(unhex('202005295555'), 15) > unhex('20200529') AS r;

SELECT materialize(toFixedString(unhex('202005295555'), 15)) > unhex('20200529') AS r;
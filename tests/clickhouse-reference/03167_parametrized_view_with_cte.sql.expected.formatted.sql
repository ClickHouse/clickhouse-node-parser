SET enable_analyzer = 1;

CREATE OR REPLACE VIEW param_test
AS
SELECT {test_str:String} AS s_result;
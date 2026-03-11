SELECT count() FROM regression_for_in_operator_view WHERE g = '5';
SELECT count() FROM regression_for_in_operator_view WHERE g IN ('5');
SELECT count() FROM regression_for_in_operator_view WHERE g IN ('5','6');
SELECT count() FROM regression_for_in_operator_view WHERE g = '5' OR g = '6';
SELECT count() FROM regression_for_in_operator_view WHERE g = '5' OR g = '6' SETTINGS enable_analyzer = 1;

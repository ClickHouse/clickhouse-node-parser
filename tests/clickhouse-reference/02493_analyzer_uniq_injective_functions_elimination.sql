SET enable_analyzer = 1, optimize_injective_functions_inside_uniq = 1;
SELECT uniqCombined(tuple('')) FROM numbers(1);
SELECT uniqCombined(tuple(materialize(toString(number)))) FROM numbers(10);

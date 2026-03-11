SELECT uniqCombined(tuple('')) FROM numbers(1);
SELECT uniqCombined(tuple(materialize(toString(number)))) FROM numbers(10);

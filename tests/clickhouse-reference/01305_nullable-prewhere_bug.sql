SELECT field, countIf(num_field > 6.0) FROM data PREWHERE (num_field>6.0) GROUP BY field;

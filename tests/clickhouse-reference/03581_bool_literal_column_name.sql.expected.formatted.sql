SELECT
    toTypeName(0),
    toTypeName(false);

SELECT
    toTypeName(1),
    toTypeName(true);

SELECT
    toTypeName(true) AS bool_true_type,
    toTypeName(false) AS bool_false_type,
    toTypeName(0) AS int_zero_type,
    toTypeName(1) AS int_one_type;
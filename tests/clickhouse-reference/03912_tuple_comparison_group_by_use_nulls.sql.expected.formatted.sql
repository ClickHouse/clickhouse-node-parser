SELECT tuple(2) = tuple(materialize(1))
GROUP BY 1
WITH ROLLUP
SETTINGS
    group_by_use_nulls = 1,
    enable_positional_arguments = 1;

SELECT tuple(2) = tuple(materialize(1))
GROUP BY 1
WITH ROLLUP
WITH TOTALS
SETTINGS
    group_by_use_nulls = 1,
    enable_positional_arguments = 1;

SELECT tuple(2) = tuple(materialize(1))
GROUP BY 1
WITH CUBE
SETTINGS
    group_by_use_nulls = 1,
    enable_positional_arguments = 1;

SELECT tuple(2) != tuple(materialize(1))
GROUP BY 1
WITH ROLLUP
SETTINGS
    group_by_use_nulls = 1,
    enable_positional_arguments = 1;

SELECT (1, 2) = (materialize(1), materialize(2))
GROUP BY 1
WITH ROLLUP
SETTINGS
    group_by_use_nulls = 1,
    enable_positional_arguments = 1;

SELECT tuple(toNullable(2)) = tuple(materialize(1))
GROUP BY 1
WITH ROLLUP
SETTINGS
    group_by_use_nulls = 1,
    enable_positional_arguments = 1;

SELECT tuple(2) = tuple(materialize(1))
GROUP BY 1
WITH ROLLUP
SETTINGS
    group_by_use_nulls = 1,
    enable_positional_arguments = 1;
create table dict_table
(
    `strField` String,
    `dateField` Date,
    `float64Field` Float64
) Engine Log();
create dictionary dict
(
    `strField` String,
    `dateField` Date,
    `float64Field` Float64
)
PRIMARY KEY strField, dateField
SOURCE (CLICKHOUSE(TABLE 'dict_table'))
LIFETIME(MIN 300 MAX 360)
LAYOUT (COMPLEX_KEY_HASHED());
create table data_table
(
    `float64Field1` Float64,
    `float64Field2` Float64,
    `strField1` String,
    `strField2` String
) Engine Log();
select round(
        float64Field1 * if(strField1 != '', 1.0, dictGetFloat64('dict', 'float64Field', (strField1, toDate('2021-01-01'))))
        + if(strField2 != '', 1.0, dictGetFloat64('dict', 'float64Field', (strField2, toDate('2021-01-01')))) * if(isFinite(float64Field2), float64Field2, 0),
    2)
from data_table;

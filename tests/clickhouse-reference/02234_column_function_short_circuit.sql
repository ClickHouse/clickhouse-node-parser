select round(
        float64Field1 * if(strField1 != '', 1.0, dictGetFloat64('dict', 'float64Field', (strField1, toDate('2021-01-01'))))
        + if(strField2 != '', 1.0, dictGetFloat64('dict', 'float64Field', (strField2, toDate('2021-01-01')))) * if(isFinite(float64Field2), float64Field2, 0),
    2)
from data_table;

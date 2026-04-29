-- Tags: no-fasttest
DESCRIBE TABLE format(JSONEachRow, '{"x" : 1, "y" : "String", "z" : "0.0.0.0" }') SETTINGS schema_inference_hints = 'x UInt8, z IPv4';

DESCRIBE TABLE format(JSONEachRow, '{"x" : 1, "y" : "String"}\n{"z" : "0.0.0.0", "y" : "String2"}\n{"x" : 2}') SETTINGS schema_inference_hints = 'x UInt8, z IPv4';

DESCRIBE TABLE format(JSONEachRow, '{"x" : null}') SETTINGS schema_inference_hints = 'x Nullable(UInt32)';

DESCRIBE TABLE format(JSONEachRow, '{"x" : []}') SETTINGS schema_inference_hints = 'x Array(UInt32)';

DESCRIBE TABLE format(JSONEachRow, '{"x" : {}}') SETTINGS schema_inference_hints = 'x Map(String, String)';

DESCRIBE TABLE format(CSV, '1,"String","0.0.0.0"') SETTINGS schema_inference_hints = 'c1 UInt8, c3 IPv4';

DESCRIBE TABLE format(CSV, '1,"String","0.0.0.0"') SETTINGS schema_inference_hints = 'x UInt8, z IPv4', column_names_for_schema_inference = 'x, y, z';

DESCRIBE TABLE format(CSV, '\\N') SETTINGS schema_inference_hints = 'x Nullable(UInt32)', column_names_for_schema_inference = 'x';
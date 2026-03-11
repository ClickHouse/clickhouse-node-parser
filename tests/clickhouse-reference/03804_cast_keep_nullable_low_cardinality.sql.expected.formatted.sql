SELECT NULL::LowCardinality(Nullable(String))::text;

SELECT toTypeName(NULL::LowCardinality(Nullable(String))::text);

SELECT 'hello'::LowCardinality(Nullable(String))::text;

SELECT toTypeName('hello'::LowCardinality(Nullable(String))::text);

SELECT NULL::Nullable(String)::text;

SELECT toTypeName(NULL::Nullable(String)::text);
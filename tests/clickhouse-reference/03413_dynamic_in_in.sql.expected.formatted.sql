SELECT 42::Dynamic IN (42);

SELECT materialize(42)::Dynamic IN (42);

SELECT [42::Dynamic] IN ([42]);

SELECT [materialize(42)::Dynamic] IN ([42]);

SELECT tuple(map(42, 42::Dynamic)) IN (tuple(map(42, 42)));

SELECT tuple(map(42, materialize(42)::Dynamic)) IN (tuple(map(42, 42)));

SELECT '{}'::JSON IN ('{}');

SELECT materialize('{}'::JSON)::Dynamic IN ('{}');

SELECT ['{}'::JSON] IN (['{}']);

SELECT [materialize('{}')::JSON] IN (['{}']);

SELECT tuple(map(42, '{}'::JSON)) IN (tuple(map(42, '{}')));

SELECT tuple(map(42, materialize('{}')::JSON)) IN (tuple(map(42, '{}')));
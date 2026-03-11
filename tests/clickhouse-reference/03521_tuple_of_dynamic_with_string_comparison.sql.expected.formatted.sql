SELECT tuple('a'::Dynamic) = '(''a'')';

SELECT tuple(materialize('a')::Dynamic) = '(''a'')';
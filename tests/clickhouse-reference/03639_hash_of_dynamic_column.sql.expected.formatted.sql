SELECT sipHash64(42::Dynamic);

SELECT sipHash64(42::Dynamic(max_types=0));

SELECT sipHash64(43::Dynamic);

SELECT sipHash64(43::Dynamic(max_types=0));

SELECT sipHash64('str1'::Dynamic);

SELECT sipHash64('str1'::Dynamic(max_types=0));

SELECT sipHash64('str2'::Dynamic);

SELECT sipHash64('str2'::Dynamic(max_types=0));

SELECT sipHash64(NULL::Dynamic);

SELECT sipHash64(NULL::Dynamic(max_types=0));

SELECT sipHash64(tuple(42)::Dynamic);

SELECT sipHash64(tuple(42)::Dynamic(max_types=0));
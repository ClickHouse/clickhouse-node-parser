CREATE TABLE A(k UInt32, t DateTime, a Float64) ENGINE = MergeTree() ORDER BY (k, t);
CREATE TABLE B(k UInt32, t DateTime, b Float64) ENGINE = MergeTree() ORDER BY (k, t);
SELECT A.k, toString(A.t, 'UTC'), A.a, B.b, toString(B.t, 'UTC'), B.k FROM A ASOF LEFT JOIN B USING(k,t) ORDER BY (A.k, A.t);
SELECT A.k, toString(A.t, 'UTC'), A.a, B.b, toString(B.t, 'UTC'), B.k FROM A ASOF INNER JOIN B ON A.k == B.k AND A.t >= B.t ORDER BY (A.k, A.t);
SELECT A.k, toString(A.t, 'UTC'), A.a, B.b, toString(B.t, 'UTC'), B.k FROM A ASOF JOIN B USING(k,t) ORDER BY (A.k, A.t);
SET join_algorithm = 'full_sorting_merge';

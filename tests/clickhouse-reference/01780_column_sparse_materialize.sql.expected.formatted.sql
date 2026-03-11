SELECT dumpColumnStructure(id)
FROM sparse_t;

SELECT dumpColumnStructure(materialize(id))
FROM sparse_t;

SELECT dumpColumnStructure(u)
FROM sparse_t;

SELECT dumpColumnStructure(materialize(u))
FROM sparse_t;

SELECT dumpColumnStructure(s)
FROM sparse_t;

SELECT dumpColumnStructure(materialize(s))
FROM sparse_t;

SELECT dumpColumnStructure(arr1)
FROM sparse_t;

SELECT dumpColumnStructure(materialize(arr1))
FROM sparse_t;

SELECT dumpColumnStructure(arr2)
FROM sparse_t;

SELECT dumpColumnStructure(materialize(arr2))
FROM sparse_t;

SELECT dumpColumnStructure(t)
FROM sparse_t;

SELECT dumpColumnStructure(materialize(t))
FROM sparse_t;

SELECT dumpColumnStructure(t.a)
FROM sparse_t;

SELECT dumpColumnStructure(materialize(t.a))
FROM sparse_t;

SELECT dumpColumnStructure(t.s)
FROM sparse_t;

SELECT dumpColumnStructure(materialize(t.s))
FROM sparse_t;
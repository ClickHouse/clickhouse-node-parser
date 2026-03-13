SELECT
    JSONExtract('{"hello":[{"world":"wtf"}]}', 'Tuple(hello Array(Tuple(world String)))') AS x,
    x.hello,
    tupleElement(x.hello[1], 'world');

SELECT
    JSONExtract('{"hello":[{" wow ":"wtf"}]}', 'Tuple(hello Array(Tuple(` wow ` String)))') AS x,
    x.hello,
    tupleElement(x.hello[1], ' wow ');

SELECT
    JSONExtract('{"hello":[{" wow ":"wtf"}]}', 'Tuple(hello Array(Tuple(` wow ` String)))') AS x,
    x.hello,
    tupleElement(x.hello[1], 'wow'); -- { serverError NOT_FOUND_COLUMN_IN_BLOCK }

SELECT tupleElement(tuple('Hello' AS world), 'world');

SELECT
    tuple('Hello' AS world) AS t,
    t.world,
    tupleElement((t), 'world'),
    tupleElement(identity(t), 'world');
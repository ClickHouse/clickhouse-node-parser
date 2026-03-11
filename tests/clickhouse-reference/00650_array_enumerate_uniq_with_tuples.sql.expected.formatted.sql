SELECT arrayEnumerateUniq(n.x)
FROM tab_00650;

SELECT arrayEnumerateUniq(n.y)
FROM tab_00650;

SELECT arrayEnumerateUniq(n.x, n.y)
FROM tab_00650;

SELECT arrayEnumerateUniq(arrayMap((a, b) -> (a, b), n.x, n.y))
FROM tab_00650;

SELECT arrayEnumerateUniq(arrayMap((a, b) -> (a, b), n.x, n.y), n.x)
FROM tab_00650;

SELECT arrayEnumerateUniq(arrayMap((a, b) -> (a, b), n.x, n.y), arrayMap((a, b) -> (b, a), n.x, n.y))
FROM tab_00650;
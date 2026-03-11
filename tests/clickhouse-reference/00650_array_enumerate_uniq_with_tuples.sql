select arrayEnumerateUniq(n.x) from tab_00650;
select arrayEnumerateUniq(n.y) from tab_00650;
select arrayEnumerateUniq(n.x, n.y) from tab_00650;
select arrayEnumerateUniq(arrayMap((a, b) -> (a, b), n.x, n.y)) from tab_00650;
select arrayEnumerateUniq(arrayMap((a, b) -> (a, b), n.x, n.y), n.x) from tab_00650;
select arrayEnumerateUniq(arrayMap((a, b) -> (a, b), n.x, n.y), arrayMap((a, b) -> (b, a), n.x, n.y)) from tab_00650;

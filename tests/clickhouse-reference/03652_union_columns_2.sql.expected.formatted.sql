CREATE TABLE `left`
(
    g UInt32,
    i UInt32
)
ORDER BY (g, i);

CREATE TABLE `right`
(
    g UInt32,
    i UInt32
)
ORDER BY (g, i);

SET enable_analyzer = 1;
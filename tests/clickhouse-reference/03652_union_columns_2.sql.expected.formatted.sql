CREATE TABLE `left`
(
    g UInt32,
    i UInt32
)
ORDER BY (g, i);

INSERT INTO `left`;

CREATE TABLE `right`
(
    g UInt32,
    i UInt32
)
ORDER BY (g, i);

INSERT INTO `right`;

SET enable_analyzer = 1;
SELECT arrayROCAUC([], []);

SELECT arrayROCAUC([1], [1]);

SELECT arrayROCAUC([1], []);

SELECT arrayROCAUC([], [1]);

SELECT arrayROCAUC([1, 2], [3]);

SELECT arrayROCAUC([1], [2, 3]);

SELECT arrayROCAUC([1, 1], [1, 1]);

SELECT arrayROCAUC([1, 1], [0, 0]);

SELECT arrayROCAUC([1, 1], [0, 1]);

SELECT arrayROCAUC([0, 1], [0, 1]);

SELECT arrayROCAUC([1, 0], [0, 1]);

SELECT arrayROCAUC([0, 0, 1], [0, 1, 1]);

SELECT arrayROCAUC([0, 1, 1], [0, 1, 1]);

SELECT arrayROCAUC([0, 1, 1], [0, 0, 1]);

SELECT arrayROCAUC([], [], true);

SELECT arrayROCAUC([1], [1], true);

SELECT arrayROCAUC([1], [], true);

SELECT arrayROCAUC([], [1], true);

SELECT arrayROCAUC([1, 2], [3], true);

SELECT arrayROCAUC([1], [2, 3], true);

SELECT arrayROCAUC([1, 1], [1, 1], true);

SELECT arrayROCAUC([1, 1], [0, 0], true);

SELECT arrayROCAUC([1, 1], [0, 1], true);

SELECT arrayROCAUC([0, 1], [0, 1], true);

SELECT arrayROCAUC([1, 0], [0, 1], true);

SELECT arrayROCAUC([0, 0, 1], [0, 1, 1], true);

SELECT arrayROCAUC([0, 1, 1], [0, 1, 1], true);

SELECT arrayROCAUC([0, 1, 1], [0, 0, 1], true);

SELECT arrayROCAUC([], [], false);

SELECT arrayROCAUC([1], [1], false);

SELECT arrayROCAUC([1], [], false);

SELECT arrayROCAUC([], [1], false);

SELECT arrayROCAUC([1, 2], [3], false);

SELECT arrayROCAUC([1], [2, 3], false);

SELECT arrayROCAUC([1, 1], [1, 1], false);

SELECT arrayROCAUC([1, 1], [0, 0], false);

SELECT arrayROCAUC([1, 1], [0, 1], false);

SELECT arrayROCAUC([0, 1], [0, 1], false);

SELECT arrayROCAUC([1, 0], [0, 1], false);

SELECT arrayROCAUC([0, 0, 1], [0, 1, 1], false);

SELECT arrayROCAUC([0, 1, 1], [0, 1, 1], false);

SELECT arrayROCAUC([0, 1, 1], [0, 0, 1], false);

SELECT arrayROCAUC([0, 1, 1], [0, 0, 1], false, [0, 0, 0], true);

SELECT arrayROCAUC([0, 1, 1]);

SELECT arrayROCAUC([0, 1, 1], [0, 0, 1], 'false');

SELECT arrayROCAUC([0, 1, 1], [0, 0, 1], 4);
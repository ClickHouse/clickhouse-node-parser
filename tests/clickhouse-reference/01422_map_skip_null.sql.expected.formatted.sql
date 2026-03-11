SELECT minMap(arrayJoin([([1], [null]), ([1], [null])]));

SELECT maxMap(arrayJoin([([1], [null]), ([1], [null])]));

SELECT sumMap(arrayJoin([([1], [null]), ([1], [null])]));

SELECT sumMapWithOverflow(arrayJoin([([1], [null]), ([1], [null])]));

SELECT minMap(arrayJoin([([1, 2], [null, 11]), ([1, 2], [null, 22])]));

SELECT maxMap(arrayJoin([([1, 2], [null, 11]), ([1, 2], [null, 22])]));

SELECT sumMap(arrayJoin([([1, 2], [null, 11]), ([1, 2], [null, 22])]));

SELECT sumMapWithOverflow(arrayJoin([([1, 2], [null, 11]), ([1, 2], [null, 22])]));
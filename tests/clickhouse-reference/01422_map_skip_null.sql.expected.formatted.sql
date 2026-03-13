SELECT minMap(arrayJoin([([1], [null]), ([1], [null])])); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT maxMap(arrayJoin([([1], [null]), ([1], [null])])); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT sumMap(arrayJoin([([1], [null]), ([1], [null])])); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT sumMapWithOverflow(arrayJoin([([1], [null]), ([1], [null])])); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT minMap(arrayJoin([([1, 2], [null, 11]), ([1, 2], [null, 22])]));

SELECT maxMap(arrayJoin([([1, 2], [null, 11]), ([1, 2], [null, 22])]));

SELECT sumMap(arrayJoin([([1, 2], [null, 11]), ([1, 2], [null, 22])]));

SELECT sumMapWithOverflow(arrayJoin([([1, 2], [null, 11]), ([1, 2], [null, 22])]));
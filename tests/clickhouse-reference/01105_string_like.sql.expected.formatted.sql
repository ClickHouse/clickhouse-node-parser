SELECT like(arrayJoin(['hello', 'world']), 'hello');

SELECT like(arrayJoin(['hello', 'world']), 'world');

SELECT like(arrayJoin(['hello', 'world']), 'xyz');

SELECT like(arrayJoin(['hello', 'world']), 'hell');

SELECT like(arrayJoin(['hello', 'world']), 'orld');

SELECT like(arrayJoin(['hello', 'world']), '%hello%');

SELECT like(arrayJoin(['hello', 'world']), '%world%');

SELECT like(arrayJoin(['hello', 'world']), '%xyz%');

SELECT like(arrayJoin(['hello', 'world']), '%hell%');

SELECT like(arrayJoin(['hello', 'world']), '%orld%');

SELECT like(arrayJoin(['hello', 'world']), '%hello');

SELECT like(arrayJoin(['hello', 'world']), '%world');

SELECT like(arrayJoin(['hello', 'world']), '%xyz');

SELECT like(arrayJoin(['hello', 'world']), '%hell');

SELECT like(arrayJoin(['hello', 'world']), '%orld');

SELECT like(arrayJoin(['hello', 'world']), 'hello%');

SELECT like(arrayJoin(['hello', 'world']), 'world%');

SELECT like(arrayJoin(['hello', 'world']), 'xyz%');

SELECT like(arrayJoin(['hello', 'world']), 'hell%');

SELECT like(arrayJoin(['hello', 'world']), 'orld%');

SELECT like(arrayJoin(['hello', 'world']), '%he%o%');

SELECT like(arrayJoin(['hello', 'world']), '%w%ld%');

SELECT like(arrayJoin(['hello', 'world']), '%x%z%');

SELECT like(arrayJoin(['hello', 'world']), '%hell_');

SELECT like(arrayJoin(['hello', 'world']), '_orld%');

SELECT like(arrayJoin(['hello', 'world']), '%he__o%');

SELECT like(arrayJoin(['hello', 'world']), '%w__ld%');

SELECT like(arrayJoin(['hello', 'world']), 'hell_');

SELECT like(arrayJoin(['hello', 'world']), '_orld');

SELECT like(arrayJoin(['hello', 'world']), 'helloworld');

SELECT like(arrayJoin(['hello', 'world']), '%helloworld%');

SELECT like(arrayJoin(['hello', 'world']), '%elloworl%');

SELECT like(arrayJoin(['hello', 'world']), '%ow%');

SELECT like(arrayJoin(['hello', 'world']), '%o%w%');

SELECT like(arrayJoin(['hello', 'world']), '%o%');

SELECT like(arrayJoin(['hello', 'world']), '%l%');

SELECT like(arrayJoin(['hello', 'world']), '%l%o%');

SELECT like(arrayJoin(['hello', 'world']), '%o%l%');
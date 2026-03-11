SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), 'hello');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), 'world');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), 'xyz');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), 'hell');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), 'orld');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%hello%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%world%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%xyz%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%hell%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%orld%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%hello');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%world');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%xyz');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%hell');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%orld');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), 'hello%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), 'world%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), 'xyz%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), 'hell%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), 'orld%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%he%o%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%w%ld%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%x%z%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%hell_');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '_orld%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%he__o%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%w__ld%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), 'hell_');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '_orld');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), 'helloworld');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%helloworld%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%elloworl%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%ow%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%o%w%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%o%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%l%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%l%o%');

SELECT like(arrayJoin(CAST(['hello', 'world'] AS Array(FixedString(5)))), '%o%l%');
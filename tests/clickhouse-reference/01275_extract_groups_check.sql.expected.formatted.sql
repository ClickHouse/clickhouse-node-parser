SELECT extractGroups('hello', '');

SELECT extractAllGroups('hello', '');

SELECT extractGroups('hello', ' ');

SELECT extractAllGroups('hello', ' ');

SELECT extractGroups('hello', '\0');

SELECT extractAllGroups('hello', '\0');

SELECT extractGroups('hello', 'world');

SELECT extractAllGroups('hello', 'world');

SELECT extractGroups('hello', 'hello|world');

SELECT extractAllGroups('hello', 'hello|world');
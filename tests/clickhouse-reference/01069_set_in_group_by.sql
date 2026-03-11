SELECT arrayJoin([CounterID NOT IN (2)]) AS counter FROM testmt WHERE CounterID IN (2) GROUP BY counter;

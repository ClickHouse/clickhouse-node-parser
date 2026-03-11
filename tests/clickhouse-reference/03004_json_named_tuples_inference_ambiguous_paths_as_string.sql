select * from format(JSONEachRow, '{"obj" : {"a" : 42}}, {"obj" : {"a" : {"b" : 42}}}');

select * from file(02422_data.msgpack, auto, 'x Int32'); -- {serverError ILLEGAL_COLUMN}

SYSTEM drop  table if exists data_01817;

SYSTEM drop  table if exists buffer_01817;

CREATE TABLE data_01817
(
    key Int
)
ENGINE = Null();

-- w/ flush_*
CREATE TABLE buffer_01817
(
    key Int
)
ENGINE = Buffer(currentDatabase(), data_01817, 1, 1, 86400, 1e9, 1e6, 0, 4e6, 86400, 10, 0);

SYSTEM drop  table buffer_01817;

-- w/o flush_*
CREATE TABLE buffer_01817
(
    key Int
)
ENGINE = Buffer(currentDatabase(), data_01817, 1, 1, 86400, 1e9, 1e6, 0, 4e6);

-- not enough args
CREATE TABLE buffer_01817
(
    key Int
)
ENGINE = Buffer(currentDatabase(), data_01817, 1, 1, 86400, 1e9, 1e6, 0); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

-- too much args
CREATE TABLE buffer_01817
(
    key Int
)
ENGINE = Buffer(currentDatabase(), data_01817, 1, 1, 86400, 1e9, 1e6, 0, 4e6, 86400, 10, 0, 0); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SYSTEM drop  table data_01817;
CREATE DATABASE db_filesystem
ENGINE = Filesystem('/etc'); -- { serverError BAD_ARGUMENTS }

CREATE DATABASE db_filesystem
ENGINE = Filesystem('../../../../../../../../etc'); -- { serverError BAD_ARGUMENTS }
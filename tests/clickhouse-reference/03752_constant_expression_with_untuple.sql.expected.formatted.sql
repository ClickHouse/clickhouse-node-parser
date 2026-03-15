-- untuple is not available without analyzer
SET enable_analyzer = 1;

CREATE TABLE test
ENGINE = Merge(default, untuple((1,1))); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
-- untuple is not available without analyzer
SET enable_analyzer=1;
CREATE TABLE test Engine=Merge(default, untuple((1,1))); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT tupleConcat(); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT tupleConcat((1, 'y'), 1); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT tupleConcat((1, 'y'), (2, 'n'));

SELECT tupleConcat((1, 'y'), (2, 'n'), (3, 'n'));
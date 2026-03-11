SELECT * FROM numbers([tuple(1, 2), NULL], 2); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

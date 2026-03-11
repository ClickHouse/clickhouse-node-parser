SELECT '--- Wrong arguments';
SELECT colorOKLCHToSRGB(); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
SELECT colorOKLCHToSRGB(1, 2); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT colorOKLCHToSRGB((1, 2)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT colorOKLCHToSRGB((1, 'a', 3)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT colorOKLCHToSRGB((1, 2, 3), 'a'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

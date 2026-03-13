SELECT '--- Wrong arguments';

SELECT colorOKLABToSRGB(); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT colorOKLABToSRGB(1, 2); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT colorOKLABToSRGB((1, 2)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT colorOKLABToSRGB((1, 'a', 3)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT colorOKLABToSRGB((1, 2, 3), 'a'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT colorOKLABToSRGB((1, 2, 3), (4, 5, 6)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT colorOKLABToSRGB((1, 2, 3, 4)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
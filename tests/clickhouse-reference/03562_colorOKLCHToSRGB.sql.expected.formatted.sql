SELECT '--- Wrong arguments';

SELECT colorOKLCHToSRGB();

SELECT colorOKLCHToSRGB(1, 2);

SELECT colorOKLCHToSRGB((1, 2));

SELECT colorOKLCHToSRGB((1, 'a', 3));

SELECT colorOKLCHToSRGB((1, 2, 3), 'a');
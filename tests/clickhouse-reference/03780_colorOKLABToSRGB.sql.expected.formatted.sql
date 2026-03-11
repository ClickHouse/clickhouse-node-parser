SELECT '--- Wrong arguments';

SELECT colorOKLABToSRGB();

SELECT colorOKLABToSRGB(1, 2);

SELECT colorOKLABToSRGB((1, 2));

SELECT colorOKLABToSRGB((1, 'a', 3));

SELECT colorOKLABToSRGB((1, 2, 3), 'a');

SELECT colorOKLABToSRGB((1, 2, 3), (4, 5, 6));

SELECT colorOKLABToSRGB((1, 2, 3, 4));
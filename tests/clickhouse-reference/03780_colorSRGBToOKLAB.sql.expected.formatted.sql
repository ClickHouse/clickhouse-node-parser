SELECT '--- Wrong arguments';

SELECT colorSRGBToOKLAB();

SELECT colorSRGBToOKLAB(1, 2);

SELECT colorSRGBToOKLAB((1, 2));

SELECT colorSRGBToOKLAB((1, 'a', 3));

SELECT colorSRGBToOKLAB((1, 2, 3), 'a');

SELECT colorSRGBToOKLAB((1, 2, 3), (4, 5, 6));

SELECT colorSRGBToOKLAB((1, 2, 3, 4));
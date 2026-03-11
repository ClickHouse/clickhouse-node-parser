SELECT '--- Wrong arguments';

SELECT colorSRGBToOKLCH();

SELECT colorSRGBToOKLCH(1, 2);

SELECT colorSRGBToOKLCH((1, 2));

SELECT colorSRGBToOKLCH((1, 'a', 3));

SELECT colorSRGBToOKLCH((1, 2, 3), 'a');
SELECT '----- START -----';

SELECT mortonEncode(1, 2, 3, 4);

SELECT mortonDecode(4, 2149);

SELECT mortonEncode(65534, 65533);

SELECT mortonDecode(2, 4294967286);

SELECT mortonEncode(4294967286);

SELECT mortonDecode(1, 4294967286);
SELECT '----- START -----';

SELECT mortonEncode((1,2,3,1), 1, 2, 3, 4);

SELECT mortonDecode((1, 2, 3, 1), 4205569);

SELECT mortonEncode((1,1), 65534, 65533);

SELECT mortonDecode((1,1), 4294967286);

SELECT mortonEncode(tuple(1), 4294967286);

SELECT mortonDecode(tuple(1), 4294967286);

SELECT mortonEncode(tuple(4), 128);

SELECT mortonDecode(tuple(4), 2147483648);

SELECT mortonEncode((4,4,4,4), 128, 128, 128, 128);
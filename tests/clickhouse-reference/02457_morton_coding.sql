SELECT '----- START -----';
select mortonEncode(1,2,3,4);
select mortonDecode(4, 2149);
select mortonEncode(65534, 65533);
select mortonDecode(2, 4294967286);
select mortonEncode(4294967286);
select mortonDecode(1, 4294967286);

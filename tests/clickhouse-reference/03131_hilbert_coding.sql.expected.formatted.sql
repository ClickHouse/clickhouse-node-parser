SELECT '----- START -----';

SELECT hilbertEncode(133);

SELECT hilbertEncode(3, 4);

SELECT hilbertDecode(2, 31);

SELECT hilbertEncode();

SELECT hilbertEncode(1, 2, 3);

SELECT hilbertDecode();

SELECT hilbertEncode('text');

SELECT hilbertDecode('text', 'text');

SELECT hilbertEncode((1, 2), 3);
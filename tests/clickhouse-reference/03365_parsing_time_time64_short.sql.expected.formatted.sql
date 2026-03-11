SELECT toTime('45:30');

SELECT toTime('00:01');

SELECT toTime('59:59');

SELECT toTime('5:30');

SELECT toTime('9:59');

SELECT toTime('0:01');

SELECT toTime('45');

SELECT toTime('01');

SELECT toTime('59');

SELECT toTime('5');

SELECT toTime('9');

SELECT toTime('0');

SELECT toTime('-45:30');

SELECT toTime('-00:01');

SELECT toTime('-59:59');

SELECT toTime('-5:30');

SELECT toTime('-9:59');

SELECT toTime('-0:01');

SELECT toTime('-45');

SELECT toTime('-01');

SELECT toTime('-59');

SELECT toTime('-5');

SELECT toTime('-9');

SELECT toTime('-0');

SELECT toTime('99:99');

SELECT toTime64('45:30', 0);

SELECT toTime64('00:01', 0);

SELECT toTime64('59:59', 0);

SELECT toTime64('5:30', 0);

SELECT toTime64('9:59', 0);

SELECT toTime64('0:01', 0);

SELECT toTime64('45', 0);

SELECT toTime64('01', 0);

SELECT toTime64('59', 0);

SELECT toTime64('5', 0);

SELECT toTime64('9', 0);

SELECT toTime64('0', 0);

SELECT toTime64('45:30.123', 3);

SELECT toTime64('00:01.456', 3);

SELECT toTime64('59:59.999', 3);

SELECT toTime64('5:30.123', 3);

SELECT toTime64('9:59.456', 3);

SELECT toTime64('0:01.789', 3);

SELECT toTime64('45.123', 3);

SELECT toTime64('01.456', 3);

SELECT toTime64('59.999', 3);

SELECT toTime64('5.123', 3);

SELECT toTime64('9.456', 3);

SELECT toTime64('0.789', 3);

SELECT toTime64('-45:30.123', 3);

SELECT toTime64('-00:01.456', 3);

SELECT toTime64('-59:59.999', 3);

SELECT toTime64('-5:30.123', 3);

SELECT toTime64('-9:59.456', 3);

SELECT toTime64('-0:01.789', 3);

SELECT toTime64('-45.123', 3);

SELECT toTime64('-01.456', 3);

SELECT toTime64('-59.999', 3);

SELECT toTime64('-5.123', 3);

SELECT toTime64('-9.456', 3);

SELECT toTime64('-0.789', 3);

SELECT toTime64('45:30.123456', 6);

SELECT toTime64('00:01.456789', 6);

SELECT toTime64('59:59.987654', 6);

SELECT toTime64('5:30.123456', 6);

SELECT toTime64('9:59.456789', 6);

SELECT toTime64('0:01.987654', 6);

SELECT toTime64('45.123456', 6);

SELECT toTime64('01.456789', 6);

SELECT toTime64('59.987654', 6);

SELECT toTime64('5.123456', 6);

SELECT toTime64('9.456789', 6);

SELECT toTime64('0.987654', 6);

SELECT toTime64('45:30.123456789', 9);

SELECT toTime64('00:01.123456789', 9);

SELECT toTime64('59:59.987654321', 9);

SELECT toTime64('5:30.123456789', 9);

SELECT toTime64('9:59.123456789', 9);

SELECT toTime64('0:01.987654321', 6);

SELECT toTime64('45.123456789', 9);

SELECT toTime64('01.123456789', 9);

SELECT toTime64('59.987654321', 9);

SELECT toTime64('5.123456789', 9);

SELECT toTime64('9.123456789', 9);

SELECT toTime64('0.987654321', 9);

SELECT toTime('A:30');

SELECT toTime('45:A');

SELECT toTime('45:30:15');

SELECT toTime64('A:30', 3);

SELECT toTime64('45:A.123', 3);

SELECT toTime64('45:30:15.123', 3);
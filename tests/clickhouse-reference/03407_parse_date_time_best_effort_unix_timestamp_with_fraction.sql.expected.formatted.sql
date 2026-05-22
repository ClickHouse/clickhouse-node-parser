SET session_timezone = 'UTC';

SELECT parseDateTime64BestEffort('1744042005.1', 1);

SELECT parseDateTime64BestEffort('1744042005.12', 2);

SELECT parseDateTime64BestEffort('1744042005.123', 3);

SELECT parseDateTime64BestEffort('1744042005.1234', 4);

SELECT parseDateTime64BestEffort('1744042005.12345', 5);

SELECT parseDateTime64BestEffort('1744042005.123456', 6);

SELECT parseDateTime64BestEffort('1744042005.1234567', 7);

SELECT parseDateTime64BestEffort('1744042005.12345678', 8);

SELECT parseDateTime64BestEffort('1744042005.123456789', 9);

SELECT parseDateTime64BestEffort('174404200.1', 1);

SELECT parseDateTime64BestEffort('174404200.12', 2);

SELECT parseDateTime64BestEffort('174404200.123', 3);

SELECT parseDateTime64BestEffort('174404200.1234', 4);

SELECT parseDateTime64BestEffort('174404200.12345', 5);

SELECT parseDateTime64BestEffort('174404200.123456', 6);

SELECT parseDateTime64BestEffort('174404200.1234567', 7);

SELECT parseDateTime64BestEffort('174404200.12345678', 8);

SELECT parseDateTime64BestEffort('174404200.123456789', 9);
SELECT toDayOfMonth(toDate('2017-06-15'));

SELECT toMonth(toDate('2017-06-15'));

SELECT toYear(toDate('2017-06-15'));

SELECT toSecond(toDateTime('2017-12-31 18:59:58'));

SELECT toMinute(toDateTime('2017-12-31 18:59:58'));

SELECT toHour(toDateTime('2017-12-31 18:59:58'));

SELECT toDayOfMonth(toDateTime('2017-12-31 18:59:58'));

SELECT toMonth(toDateTime('2017-12-31 18:59:58'));

SELECT toYear(toDateTime('2017-12-31 18:59:58'));

CREATE TABLE Orders
(
    OrderId UInt64,
    OrderName String,
    OrderDate DateTime
)
ENGINE = Log;

INSERT INTO Orders;

SELECT
    toYear(OrderDate) AS OrderYear,
    toMonth(OrderDate) AS OrderMonth,
    toDayOfMonth(OrderDate) AS OrderDay,
    toHour(OrderDate),
    toMinute(OrderDate),
    toSecond(OrderDate)
FROM Orders
WHERE OrderId = 1;
-- When we use SingleValueDataBaseMemoryBlock we must ensure we call the class destructor on destroy
SELECT argMax((number, number), (number, number))
FROM numbers(100000)
FORMAT Null;

SELECT argMin((number, number), (number, number))
FROM numbers(100000)
FORMAT Null;

SELECT anyHeavy((number, number))
FROM numbers(100000)
FORMAT Null;

SELECT singleValueOrNull(number::Date32)
FROM numbers(100000)
FORMAT Null;

SELECT anyArgMax(number, (number, number))
FROM numbers(100000)
FORMAT Null;

SELECT anyArgMin(number, (number, number))
FROM numbers(100000)
FORMAT Null;
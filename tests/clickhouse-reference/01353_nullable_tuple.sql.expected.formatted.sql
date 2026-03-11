SELECT tuple(number) = tuple(number)
FROM numbers(1);

SELECT tuple(number) = tuple(number + 1)
FROM numbers(1);

SELECT tuple(toNullable(number)) = tuple(number)
FROM numbers(1);

SELECT tuple(toNullable(number)) = tuple(number + 1)
FROM numbers(1);

SELECT tuple(toNullable(number)) = tuple(toNullable(number))
FROM numbers(1);

SELECT tuple(toNullable(number)) = tuple(toNullable(number + 1))
FROM numbers(1);

SELECT tuple(toNullable(number)) < tuple(number + 1)
FROM numbers(1);

SELECT tuple(number) < tuple(toNullable(number + 1))
FROM numbers(1);

SELECT tuple(toNullable(number)) < tuple(toNullable(number + 1))
FROM numbers(1);

SELECT tuple(toNullable(number)) > tuple(number + 1)
FROM numbers(1);

SELECT tuple(number) > tuple(toNullable(number + 1))
FROM numbers(1);

SELECT tuple(toNullable(number)) > tuple(toNullable(number + 1))
FROM numbers(1);

SELECT tuple(toNullable(number + 1)) < tuple(number)
FROM numbers(1);

SELECT tuple(number + 1) < tuple(toNullable(number))
FROM numbers(1);

SELECT tuple(toNullable(number + 1)) < tuple(toNullable(number + 1))
FROM numbers(1);

SELECT tuple(toNullable(number + 1)) > tuple(number)
FROM numbers(1);

SELECT tuple(number + 1) > tuple(toNullable(number))
FROM numbers(1);

SELECT tuple(toNullable(number + 1)) > tuple(toNullable(number))
FROM numbers(1);

SELECT tuple(toNullable(number)) <= tuple(number + 1)
FROM numbers(1);

SELECT tuple(number) <= tuple(toNullable(number + 1))
FROM numbers(1);

SELECT tuple(toNullable(number)) <= tuple(toNullable(number + 1))
FROM numbers(1);

SELECT tuple(toNullable(number)) >= tuple(number + 1)
FROM numbers(1);

SELECT tuple(toNullable(number)) >= tuple(toNullable(number + 1))
FROM numbers(1);

SELECT tuple(toNullable(number + 1)) <= tuple(number)
FROM numbers(1);

SELECT tuple(number + 1) <= tuple(toNullable(number))
FROM numbers(1);

SELECT tuple(toNullable(number + 1)) <= tuple(toNullable(number + 1))
FROM numbers(1);

SELECT tuple(toNullable(number + 1)) >= tuple(number)
FROM numbers(1);

SELECT tuple(number + 1) >= tuple(toNullable(number))
FROM numbers(1);

SELECT tuple(toNullable(number + 1)) >= tuple(toNullable(number))
FROM numbers(1);

SELECT tuple(toNullable(number)) <= tuple(number)
FROM numbers(1);

SELECT tuple(number) <= tuple(toNullable(number))
FROM numbers(1);

SELECT tuple(toNullable(number)) <= tuple(toNullable(number))
FROM numbers(1);

SELECT tuple(toNullable(number)) >= tuple(number)
FROM numbers(1);

SELECT tuple(number) >= tuple(toNullable(number))
FROM numbers(1);

SELECT tuple(toNullable(number)) >= tuple(toNullable(number))
FROM numbers(1);

SELECT tuple(number) = tuple(materialize(toUInt64OrNull('')))
FROM numbers(1);

SELECT tuple(materialize(toUInt64OrNull(''))) = tuple(materialize(toUInt64OrNull('')))
FROM numbers(1);

SELECT tuple(number) <= tuple(materialize(toUInt64OrNull('')))
FROM numbers(1);

SELECT tuple(materialize(toUInt64OrNull(''))) <= tuple(materialize(toUInt64OrNull('')))
FROM numbers(1);

SELECT tuple(number) >= tuple(materialize(toUInt64OrNull('')))
FROM numbers(1);

SELECT tuple(materialize(toUInt64OrNull(''))) >= tuple(materialize(toUInt64OrNull('')))
FROM numbers(1);

SELECT tuple(toNullable(number), number) = tuple(number, number)
FROM numbers(1);

SELECT tuple(toNullable(number), toNullable(number)) = tuple(number, number)
FROM numbers(1);

SELECT tuple(toNullable(number), toNullable(number)) = tuple(toNullable(number), number)
FROM numbers(1);

SELECT tuple(toNullable(number), toNullable(number)) = tuple(toNullable(number), toNullable(number))
FROM numbers(1);

SELECT tuple(number, toNullable(number)) = tuple(toNullable(number), toNullable(number))
FROM numbers(1);

SELECT tuple(number, toNullable(number)) = tuple(toNullable(number), number)
FROM numbers(1);

SELECT tuple(toNullable(number), number) < tuple(number, number)
FROM numbers(1);

SELECT tuple(toNullable(number), toNullable(number)) < tuple(number, number)
FROM numbers(1);

SELECT tuple(toNullable(number), toNullable(number)) < tuple(toNullable(number), number)
FROM numbers(1);

SELECT tuple(toNullable(number), toNullable(number)) < tuple(toNullable(number), toNullable(number))
FROM numbers(1);

SELECT tuple(number, toNullable(number)) < tuple(toNullable(number), toNullable(number))
FROM numbers(1);

SELECT tuple(number, toNullable(number)) < tuple(toNullable(number), number)
FROM numbers(1);

SELECT tuple(toNullable(number), number) < tuple(number, number + 1)
FROM numbers(1);

SELECT tuple(toNullable(number), toNullable(number)) < tuple(number, number + 1)
FROM numbers(1);

SELECT tuple(toNullable(number), toNullable(number)) < tuple(toNullable(number + 1), number)
FROM numbers(1);

SELECT tuple(toNullable(number), toNullable(number)) < tuple(toNullable(number + 1), toNullable(number))
FROM numbers(1);

SELECT tuple(number, toNullable(number)) < tuple(toNullable(number), toNullable(number + 1))
FROM numbers(1);

SELECT tuple(number, toNullable(number)) < tuple(toNullable(number), number + 1)
FROM numbers(1);

SELECT tuple(materialize(toUInt64OrNull('')), number) = tuple(number, number)
FROM numbers(1);

SELECT tuple(materialize(toUInt64OrNull('')), number) = tuple(number, toUInt64OrNull(''))
FROM numbers(1);

SELECT tuple(materialize(toUInt64OrNull('')), toUInt64OrNull('')) = tuple(toUInt64OrNull(''), toUInt64OrNull(''))
FROM numbers(1);

SELECT tuple(number, materialize(toUInt64OrNull(''))) < tuple(number, number)
FROM numbers(1);

SELECT tuple(number, materialize(toUInt64OrNull(''))) <= tuple(number, number)
FROM numbers(1);

SELECT tuple(number, materialize(toUInt64OrNull(''))) < tuple(number + 1, number)
FROM numbers(1);

SELECT tuple(number, materialize(toUInt64OrNull(''))) > tuple(number, number)
FROM numbers(1);

SELECT tuple(number, materialize(toUInt64OrNull(''))) >= tuple(number, number)
FROM numbers(1);

SELECT tuple(number, materialize(toUInt64OrNull(''))) > tuple(number + 1, number)
FROM numbers(1);

SELECT tuple(toNullable(number), number, number) = tuple(number, number, number)
FROM numbers(1);

SELECT tuple(toNullable(number), materialize('a'), number) = tuple(number, materialize('a'), number)
FROM numbers(1);

SELECT tuple(toNullable(number), materialize('a'), number) = tuple(number, materialize('a'), number + 1)
FROM numbers(1);

SELECT tuple(toNullable(number), number, number) < tuple(number, number, number)
FROM numbers(1);

SELECT tuple(toNullable(number), number, number) <= tuple(number, number, number)
FROM numbers(1);

SELECT tuple(toNullable(number), materialize('a'), number) < tuple(number, materialize('a'), number)
FROM numbers(1);

SELECT tuple(toNullable(number), materialize('a'), number) < tuple(number, materialize('a'), number + 1)
FROM numbers(1);

SELECT tuple(toNullable(number), number, materialize(toUInt64OrNull(''))) = tuple(number, number, number)
FROM numbers(1);

SELECT tuple(toNullable(number), materialize('a'), materialize(toUInt64OrNull(''))) = tuple(number, materialize('a'), number)
FROM numbers(1);

SELECT tuple(toNullable(number), materialize('a'), materialize(toUInt64OrNull(''))) = tuple(number, materialize('a'), number + 1)
FROM numbers(1);

SELECT tuple(toNullable(number), number, materialize(toUInt64OrNull(''))) <= tuple(number, number, number)
FROM numbers(1);

SELECT tuple(toNullable(number), materialize('a'), materialize(toUInt64OrNull(''))) <= tuple(number, materialize('a'), number)
FROM numbers(1);

SELECT tuple(toNullable(number), materialize('a'), materialize(toUInt64OrNull(''))) <= tuple(number, materialize('a'), number + 1)
FROM numbers(1);
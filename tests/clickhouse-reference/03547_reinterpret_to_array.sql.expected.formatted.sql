SELECT toTypeName(reinterpret('', 'Array(Int32)'));

SELECT toTypeName(reinterpret('', 'Array(UInt32)'));

SELECT toTypeName(reinterpret('', 'Array(Float32)'));

SELECT toTypeName(reinterpret('', 'Array(Int64)'));

SELECT toTypeName(reinterpret('', 'Array(UInt64)'));

SELECT toTypeName(reinterpret('', 'Array(Float64)'));

SELECT toTypeName(reinterpret('', 'Array(FixedString(4))'));

SELECT toTypeName(reinterpret('', 'Array(Decimal)'));

SELECT toTypeName(reinterpret('', 'Array(Decimal64(4))'));

SELECT toTypeName(reinterpret('', 'Array(String)')); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toTypeName(reinterpret('', 'Array(Array(Int32))')); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT reinterpret('', 'Int32');

SELECT reinterpret('', 'Array(Int32)');

SELECT reinterpret('', 'Array(Int32)');

SELECT reinterpret('1�@', 'Float32');

SELECT reinterpret('1�@', 'Float32');

SELECT reinterpret('1�@1�@1�@1�@', 'Array(Float32)');

SELECT reinterpret(repeat('1�@1�@1�@1�@', 10), 'Array(Float32)');

SELECT length(reinterpret(repeat('1�@1�@1�@1�@', 10), 'Array(Float32)'));

SELECT reinterpret('abab', 'Array(FixedString(4))');

SELECT length(reinterpret(repeat('abab', 100), 'Array(FixedString(4))')) = 100;

SELECT reinterpret('ababc', 'Array(FixedString(4))'); -- { serverError BAD_ARGUMENTS }

SELECT reinterpret('1�', 'Array(Float32)'); -- { serverError BAD_ARGUMENTS }

SELECT reinterpret(concat(repeat('1�@1�@1�@1�@', 10), '�'), 'Array(Float32)'); -- { serverError BAD_ARGUMENTS }

SELECT reinterpret(95, 'Array(FixedString(4))'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

CREATE TABLE tab1
(
    id Int32,
    s FixedString(8)
)
ENGINE = Memory;

SELECT reinterpret(s, 'Array(Float32)')
FROM tab1
ORDER BY id ASC;
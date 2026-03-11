SELECT toDecimalString(2, 77);

SELECT toDecimalString(2.123456, 2);

SELECT toDecimalString(-2, 77);

SELECT toDecimalString(-2.123456, 2);

SELECT toDecimalString(2.9876, 60);

SELECT toDecimalString(2.1456, 2);

SELECT toDecimalString(-2.9876, 60);

SELECT toDecimalString(-2.1456, 2);

SELECT toDecimalString(64.123::Float32, 10);

SELECT toDecimalString(64.234::Float64, 10);

SELECT toDecimalString(-64.123::Float32, 10);

SELECT toDecimalString(-64.234::Float64, 10);

SELECT toDecimalString(-32.345::Decimal32(3), 3);

SELECT toDecimalString(32.345::Decimal32(3), 77);

SELECT toDecimalString(32.456::Decimal32(3), 2);

SELECT toDecimalString('-64.5671232345'::Decimal64(10), 10);

SELECT toDecimalString('128.78932312332132985464'::Decimal128(20), 20);

SELECT toDecimalString('-128.78932312332132985464123123'::Decimal128(26), 20);

SELECT toDecimalString('128.78932312332132985464'::Decimal128(20), 77);

SELECT toDecimalString('128.789323123321329854641231237893231233213298546'::Decimal256(45), 10);

SELECT toDecimalString('-128.789323123321329854641231237893231233213298546'::Decimal256(45), 77);

SELECT toDecimalString('32.32'::Float32, 61);

SELECT toDecimalString('64.64'::Float64, 61);

SELECT toDecimalString('88'::UInt8, 78);

SELECT toDecimalString('646464'::Int256, 78);

SELECT toDecimalString('-128.789323123321329854641231237893231233213298546'::Decimal256(45), 78);

SELECT toDecimalString('256.256'::Decimal256(45), *);

SELECT toDecimalString('128.128'::Decimal128(30), 'str');

SELECT toDecimalString('64.64'::Decimal64(10));

SELECT toDecimalString('64.64'::Decimal64(10), 3, 3);

SELECT toDecimalString(1, 0);

SELECT toDecimalString(1.123456, 0);

SELECT toDecimalString(-1, 0);

SELECT toDecimalString(-1.123456, 0);
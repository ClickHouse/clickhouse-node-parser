-- Check that Float32 and BFloat16 return the same values for calculations with special values
SELECT
    toFloat32(0.0) == toFloat32(-0.0),
    toBFloat16(0.0) == toBFloat16(-0.0);

SELECT
    toFloat32(0.0) != toFloat32(-0.0),
    toBFloat16(0.0) != toBFloat16(-0.0);

SELECT
    toFloat32(0.0) > toFloat32(-0.0),
    toBFloat16(0.0) > toBFloat16(-0.0);

SELECT
    toFloat32(0.0) < toFloat32(-0.0),
    toBFloat16(0.0) < toBFloat16(-0.0);

SELECT
    toFloat32(0.0) + toFloat32(-0.0),
    toBFloat16(0.0) + toBFloat16(-0.0);

SELECT
    toFloat32(-0.0) + toFloat32(-0.0),
    toBFloat16(-0.0) + toBFloat16(-0.0);

SELECT
    toFloat32(nan) == toFloat32(nan),
    toBFloat16(nan) == toBFloat16(nan);

SELECT
    toFloat32(nan) + toFloat32(nan),
    toBFloat16(nan) + toBFloat16(nan);

SELECT
    toFloat32(nan) - toFloat32(nan),
    toBFloat16(nan) - toBFloat16(nan);

SELECT
    toFloat32(nan) * toFloat32(nan),
    toBFloat16(nan) * toBFloat16(nan);

SELECT
    toFloat32(nan) / toFloat32(nan),
    toBFloat16(nan) / toBFloat16(nan);

SELECT
    toFloat32(nan) % toFloat32(nan),
    toBFloat16(nan) % toBFloat16(nan);

SELECT
    toFloat32(5.5) + toFloat32(nan),
    toBFloat16(5.5) + toBFloat16(nan);

SELECT
    toFloat32(5.5) - toFloat32(nan),
    toBFloat16(5.5) - toBFloat16(nan);

SELECT
    toFloat32(5.5) * toFloat32(nan),
    toBFloat16(5.5) * toBFloat16(nan);

SELECT
    toFloat32(5.5) / toFloat32(nan),
    toBFloat16(5.5) / toBFloat16(nan);

SELECT
    toFloat32(5.5) % toFloat32(nan),
    toBFloat16(5.5) % toBFloat16(nan);

SELECT
    toFloat32(inf) == toFloat32(inf),
    toBFloat16(inf) == toBFloat16(inf);

SELECT
    toFloat32(inf) + toFloat32(inf),
    toBFloat16(inf) + toBFloat16(inf);

SELECT
    toFloat32(inf) - toFloat32(inf),
    toBFloat16(inf) - toBFloat16(inf);

SELECT
    toFloat32(inf) * toFloat32(inf),
    toBFloat16(inf) * toBFloat16(inf);

SELECT
    toFloat32(inf) / toFloat32(inf),
    toBFloat16(inf) / toBFloat16(inf);

SELECT
    toFloat32(inf) % toFloat32(inf),
    toBFloat16(inf) % toBFloat16(inf);

SELECT
    toFloat32(-inf) == toFloat32(-inf),
    toBFloat16(-inf) == toBFloat16(-inf);

SELECT
    toFloat32(5.5) + toFloat32(inf),
    toBFloat16(5.5) + toBFloat16(inf);

SELECT
    toFloat32(5.5) - toFloat32(inf),
    toBFloat16(5.5) - toBFloat16(inf);

SELECT
    toFloat32(5.5) * toFloat32(inf),
    toBFloat16(5.5) * toBFloat16(inf);

SELECT
    toFloat32(5.5) / toFloat32(inf),
    toBFloat16(5.5) / toBFloat16(inf);

SELECT
    toFloat32(5.5) % toFloat32(inf),
    toBFloat16(5.5) % toBFloat16(inf);

SELECT c0
FROM tab FINAL;
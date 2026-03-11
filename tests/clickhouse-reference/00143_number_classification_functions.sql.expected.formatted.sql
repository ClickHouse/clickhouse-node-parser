SELECT isFinite(0) = 1;

SELECT isFinite(1) = 1;

SELECT isFinite(materialize(0)) = 1;

SELECT isFinite(materialize(1)) = 1;

SELECT isFinite(1 / 0) = 0;

SELECT isFinite(-1 / 0) = 0;

SELECT isFinite(0 / 0) = 0;

SELECT isFinite(inf) = 0;

SELECT isFinite(-inf) = 0;

SELECT isFinite(nan) = 0;

SELECT isInfinite(0) = 0;

SELECT isInfinite(1) = 0;

SELECT isInfinite(materialize(0)) = 0;

SELECT isInfinite(materialize(1)) = 0;

SELECT isInfinite(1 / 0) = 1;

SELECT isInfinite(-1 / 0) = 1;

SELECT isInfinite(0 / 0) = 0;

SELECT isInfinite(inf) = 1;

SELECT isInfinite(-inf) = 1;

SELECT isInfinite(nan) = 0;

SELECT isNaN(0) = 0;

SELECT isNaN(1) = 0;

SELECT isNaN(materialize(0)) = 0;

SELECT isNaN(materialize(1)) = 0;

SELECT isNaN(1 / 0) = 0;

SELECT isNaN(-1 / 0) = 0;

SELECT isNaN(0 / 0) = 1;

SELECT isNaN(inf) = 0;

SELECT isNaN(-inf) = 0;

SELECT isNaN(nan) = 1;
SELECT arrayEnumerateUniq(anyHeavy([]), []);

SELECT arrayEnumerateDense([], [sequenceCount(NULL)]);

SELECT arrayEnumerateDense([STDDEV_SAMP(NULL, 910947.571364)], [NULL]);
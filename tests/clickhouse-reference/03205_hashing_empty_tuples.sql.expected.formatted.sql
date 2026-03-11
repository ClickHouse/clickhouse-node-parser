SELECT sipHash64(tuple());

SELECT sipHash64(tuple(), tuple());

SELECT sipHash64(tuple(), 1);

SELECT sipHash64(1, tuple());

SELECT sipHash64(1, tuple(), 1);

SELECT sipHash64(tuple(), 1, tuple());

SELECT sipHash64(tuple(), (1, 2));

SELECT sipHash64((1, 2), tuple());

SELECT sipHash64(tuple(), (1, 2), tuple());

SELECT sipHash64((1, 2), tuple(), (3, 4));

SELECT sipHash64(materialize(tuple()));

SELECT sipHash64(materialize(tuple()), materialize(tuple()));

SELECT sipHash64(materialize(tuple()), 1);

SELECT sipHash64(1, materialize(tuple()));

SELECT sipHash64(1, materialize(tuple()), 1);

SELECT sipHash64(tuple(), 1, materialize(tuple()));

SELECT sipHash64(materialize(tuple()), (1, 2));

SELECT sipHash64((1, 2), materialize(tuple()));

SELECT sipHash64(materialize(tuple()), (1, 2), tuple());

SELECT sipHash64((1, 2), materialize(tuple()), (3, 4));
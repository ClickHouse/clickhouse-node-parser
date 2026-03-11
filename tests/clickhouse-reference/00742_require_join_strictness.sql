SELECT * FROM system.one INNER JOIN (SELECT number AS k FROM system.numbers) js2 ON dummy = k; -- { serverError EXPECTED_ALL_OR_ANY }

SELECT timeSeriesRange('2025-06-01 00:00:00'::DateTime64(3), '2025-06-01 00:01:30.000'::DateTime64(3), 30);

SELECT timeSeriesRange('2025-06-01 00:00:00'::DateTime64(3), '2025-06-01 00:00:01.000'::DateTime64(3), '0.10'::Decimal64(3));

SELECT timeSeriesRange('2025-06-01 00:00:00'::DateTime64(3), '2025-06-01 00:00:30.000'::DateTime64(3), 30);

SELECT timeSeriesRange('2025-06-01 00:00:00'::DateTime64(3), '2025-06-01 00:00:00.000'::DateTime64(3), 30);

SELECT timeSeriesRange('2025-06-01 00:00:00'::DateTime64(3), '2025-06-01 00:00:00.000'::DateTime64(3), 0);

SELECT timeSeriesRange('2025-06-01 00:00:00.0'::DateTime64(1), '2025-06-01 00:00:01.00'::DateTime64(2), '0.123'::Decimal64(3));

SELECT timeSeriesRange('2025-06-01 00:01:00'::DateTime64(3), '2025-06-01 00:00:00.000'::DateTime64(3), 30);

SELECT timeSeriesRange('2025-06-01 00:01:00'::DateTime64(3), '2025-06-01 00:00:00.000'::DateTime64(3), -30);

SELECT timeSeriesRange('2025-06-01 00:00:00'::DateTime64(3), '2025-06-01 00:00:50.000'::DateTime64(3), 0);

SELECT timeSeriesRange('2025-06-01 00:00:00'::DateTime64(3), '2025-06-01 00:00:50.000'::DateTime64(3), -10);

SELECT timeSeriesFromGrid('2025-06-01 00:00:00'::DateTime64(3), '2025-06-01 00:01:30.000'::DateTime64(3), 30, [100, 200, 300, 400]);

SELECT timeSeriesFromGrid('2025-06-01 00:00:00'::DateTime64(3), '2025-06-01 00:01:30.000'::DateTime64(3), 30, [100, 200, NULL, 400]);

SELECT timeSeriesFromGrid('2025-06-01 00:00:00'::DateTime64(3), '2025-06-01 00:03:00.000'::DateTime64(3), 30, [100, NULL, 300, NULL, NULL, 600, NULL]);

SELECT timeSeriesFromGrid('2025-06-01 00:00:00'::DateTime64(3), '2025-06-01 00:01:30.000'::DateTime64(3), 30, [10, 20, 30]);

SELECT timeSeriesFromGrid('2025-06-01 00:00:00'::DateTime64(3), '2025-06-01 00:01:30.000'::DateTime64(3), 30, [10, 20, 30, 40, 50]);
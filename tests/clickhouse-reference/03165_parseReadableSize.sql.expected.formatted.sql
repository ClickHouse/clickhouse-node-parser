SELECT formatReadableSize(parseReadableSize('1 B'));

SELECT formatReadableSize(parseReadableSize('1 KiB'));

SELECT formatReadableSize(parseReadableSize('1 MiB'));

SELECT formatReadableSize(parseReadableSize('1 GiB'));

SELECT formatReadableSize(parseReadableSize('1 TiB'));

SELECT formatReadableSize(parseReadableSize('1 PiB'));

SELECT formatReadableSize(parseReadableSize('1 EiB'));

SELECT formatReadableDecimalSize(parseReadableSize('1 B'));

SELECT formatReadableDecimalSize(parseReadableSize('1 KB'));

SELECT formatReadableDecimalSize(parseReadableSize('1 MB'));

SELECT formatReadableDecimalSize(parseReadableSize('1 GB'));

SELECT formatReadableDecimalSize(parseReadableSize('1 TB'));

SELECT formatReadableDecimalSize(parseReadableSize('1 PB'));

SELECT formatReadableDecimalSize(parseReadableSize('1 EB'));

SELECT parseReadableSize('1.00 KiB');

SELECT parseReadableSize('3.00 KiB');

SELECT parseReadableSize('1    KiB');

SELECT parseReadableSize('1KiB');

SELECT parseReadableSize(toLowCardinality('1 KiB'));

SELECT parseReadableSize(toNullable('1 KiB'));

SELECT parseReadableSize(materialize('1 KiB'));

SELECT parseReadableSize(NULL);

SELECT parseReadableSize('3.14159265358979323846264338327950288419716939937510 KiB');

SELECT parseReadableSize('+3.1415 KiB');

SELECT parseReadableSize('10e2 B');

SELECT parseReadableSize('5. B');

SELECT parseReadableSize('002 KiB');

SELECT parseReadableSize('08 KiB');

SELECT
    parseReadableSize('0 KiB'),
    parseReadableSize('+0 KiB'),
    parseReadableSize('-0 KiB');

SELECT parseReadableSize();

SELECT parseReadableSize('1 B', '2 B');

SELECT parseReadableSize(12);

SELECT parseReadableSize('oh no');

SELECT parseReadableSize('12.3 rb');

SELECT parseReadableSize(' 1 B');

SELECT parseReadableSize('1 B leftovers');

SELECT parseReadableSize('-1 KiB');

SELECT parseReadableSize('1000 EiB');

SELECT parseReadableSize('0xa123 KiB');

SELECT parseReadableSize('nan KiB');

SELECT parseReadableSize('+nan KiB');

SELECT parseReadableSize('-nan KiB');

SELECT parseReadableSize('inf KiB');

SELECT parseReadableSize('+inf KiB');

SELECT parseReadableSize('-inf KiB');

SELECT parseReadableSize('infinite KiB');

SELECT parseReadableSize('+infinite KiB');

SELECT parseReadableSize('-infinite KiB');

SELECT
    arrayJoin(['1 B', '1 KiB', '1 MiB', '1 GiB', '1 TiB', '1 PiB', '1 EiB']) AS readable_sizes,
    parseReadableSizeOrNull(readable_sizes) AS filesize;

SELECT
    arrayJoin(['invalid', '1 Joe', '1KB', ' 1 GiB', '1 TiB with fries', 'NaN KiB', 'Inf KiB', '0xa123 KiB']) AS readable_sizes,
    parseReadableSizeOrNull(readable_sizes) AS filesize;

SELECT
    arrayJoin(['1 B', '1 KiB', '1 MiB', '1 GiB', '1 TiB', '1 PiB', '1 EiB']) AS readable_sizes,
    parseReadableSizeOrZero(readable_sizes) AS filesize;

SELECT
    arrayJoin(['invalid', '1 Joe', '1KB', ' 1 GiB', '1 TiB with fries', 'NaN KiB', 'Inf KiB', '0xa123 KiB']) AS readable_sizes,
    parseReadableSizeOrZero(readable_sizes) AS filesize;
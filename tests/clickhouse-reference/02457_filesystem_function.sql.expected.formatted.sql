-- Tags: no-fasttest
SELECT filesystemCapacity('s3_disk') >= filesystemAvailable('s3_disk')
    AND filesystemAvailable('s3_disk') >= filesystemUnreserved('s3_disk');

SELECT filesystemCapacity('default') >= filesystemAvailable('default')
    AND filesystemAvailable('default') >= 0
    AND filesystemUnreserved('default') >= 0;

SELECT filesystemCapacity('__un_exists_disk'); -- { serverError UNKNOWN_DISK }
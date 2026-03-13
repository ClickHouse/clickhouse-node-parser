SELECT *;

--error: should be failed for abc.*;
SELECT abc.*; --{serverError UNKNOWN_IDENTIFIER}

SELECT
    *,
    abc.*; --{serverError UNKNOWN_IDENTIFIER}

SELECT
    abc.*,
    *; --{serverError UNKNOWN_IDENTIFIER}
select count() from test where toUInt64(val) = -1; -- { serverError CANNOT_CONVERT_TYPE }

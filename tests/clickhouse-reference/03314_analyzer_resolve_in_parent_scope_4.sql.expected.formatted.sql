SELECT
    *,
    oldest_before(users.age)
FROM users; -- { serverError UNSUPPORTED_METHOD }
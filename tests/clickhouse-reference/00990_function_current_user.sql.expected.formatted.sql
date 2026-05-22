-- Since the actual user name is unknown, have to perform just smoke tests
SELECT isNotNull(currentUser());

SELECT length(currentUser()) > 0;

SELECT
    currentUser() = user(),
    currentUser() = USER(),
    current_user() = currentUser();

SELECT currentUser() = initial_user
FROM `system`.processes
WHERE like(query, '%$!@#%')
    AND current_database = currentDatabase();
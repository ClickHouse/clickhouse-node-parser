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
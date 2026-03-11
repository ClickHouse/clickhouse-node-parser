SELECT any(value > 0)
FROM `system`.events
WHERE event = 'PartsLockHoldMicroseconds'
    OR event = 'PartsLockWaitMicroseconds';
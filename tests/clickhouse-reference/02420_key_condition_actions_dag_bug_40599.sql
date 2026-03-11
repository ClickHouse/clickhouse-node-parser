select count() from (
   SELECT event_dt FROM (
      select event_dt, 403 AS event_id from (
         select event_dt from tba as tba
         where event_id = 9 and ((tba.event_dt >= 20220822 and tba.event_dt <= 20220822))
      )
  ) tba WHERE tba.event_dt >= 20220822 and tba.event_dt <= 20220822 and event_id = 403 );

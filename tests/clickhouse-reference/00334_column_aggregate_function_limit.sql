CREATE TABLE ontime (FlightDate Date, Carrier String, FlightNum String) ENGINE = Memory;
SELECT ignore(finalizeAggregation(Users)) FROM (SELECT FlightDate, Carrier, uniqState(FlightNum) AS Users FROM ontime GROUP BY FlightDate, Carrier LIMIT 1);

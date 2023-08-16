
      
        
            delete from "flights_demo"."flights_wh"."Fact_flights"
            where (
                flight_id) in (
                select (flight_id)
                from "Fact_flights__dbt_tmp202216500792"
            );

        
    

    insert into "flights_demo"."flights_wh"."Fact_flights" ("flight_id", "flight_no", "scheduled_departure", "scheduled_arrival", "departure_airport", "arrival_airport", "status", "aircraft_code", "actual_departure", "actual_arrival", "last_update", "flight_duration_expected", "duration_actual_hours", "flight_duration_case", "dbt_time")
    (
        select "flight_id", "flight_no", "scheduled_departure", "scheduled_arrival", "departure_airport", "arrival_airport", "status", "aircraft_code", "actual_departure", "actual_arrival", "last_update", "flight_duration_expected", "duration_actual_hours", "flight_duration_case", "dbt_time"
        from "Fact_flights__dbt_tmp202216500792"
    )
  
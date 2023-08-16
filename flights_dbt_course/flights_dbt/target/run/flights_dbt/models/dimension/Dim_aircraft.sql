
      insert into "flights_demo"."flights_wh"."Dim_aircraft" ("dim_aircraft_id", "aircraft_code", "model", "range", "last_update", "seat_no", "fare_conditions", "range_l_h", "model_english", "model_russian", "dbt_time")
    (
        select "dim_aircraft_id", "aircraft_code", "model", "range", "last_update", "seat_no", "fare_conditions", "range_l_h", "model_english", "model_russian", "dbt_time"
        from "Dim_aircraft__dbt_tmp202156890927"
    )


  
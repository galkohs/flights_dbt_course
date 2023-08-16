
      
        
            delete from "flights_demo"."flights_wh"."Fact_boarding_passes"
            where (
                ticket_no) in (
                select (ticket_no)
                from "Fact_boarding_passes__dbt_tmp202157601218"
            );

        
    

    insert into "flights_demo"."flights_wh"."Fact_boarding_passes" ("ticket_no", "flight_id", "boarding_no", "seat_no", "last_update", "fare_conditions", "amount", "dbt_time")
    (
        select "ticket_no", "flight_id", "boarding_no", "seat_no", "last_update", "fare_conditions", "amount", "dbt_time"
        from "Fact_boarding_passes__dbt_tmp202157601218"
    )
  
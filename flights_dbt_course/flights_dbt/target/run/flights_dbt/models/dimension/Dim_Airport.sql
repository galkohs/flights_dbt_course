
      
        
            delete from "flights_demo"."flights_wh"."Dim_Airport"
            where (
                airport_code) in (
                select (airport_code)
                from "Dim_Airport__dbt_tmp202156180746"
            );

        
    

    insert into "flights_demo"."flights_wh"."Dim_Airport" ("airport_code", "airport_name", "city", "coordinates", "timezone", "last_update", "airport_name_eng", "city_eng", "airport_name_rus", "city_rus", "dbt_time")
    (
        select "airport_code", "airport_name", "city", "coordinates", "timezone", "last_update", "airport_name_eng", "city_eng", "airport_name_rus", "city_rus", "dbt_time"
        from "Dim_Airport__dbt_tmp202156180746"
    )
  
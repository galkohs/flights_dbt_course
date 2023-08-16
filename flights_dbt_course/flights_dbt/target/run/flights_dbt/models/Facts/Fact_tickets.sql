
      
        
            delete from "flights_demo"."flights_wh"."Fact_tickets"
            where (
                ticket_no) in (
                select (ticket_no)
                from "Fact_tickets__dbt_tmp202219380814"
            );

        
    

    insert into "flights_demo"."flights_wh"."Fact_tickets" ("book_ref", "book_date", "total_amount", "ticket_no", "passenger_id", "passenger_name", "contact_data", "last_update", "email", "phone", "dbt_time")
    (
        select "book_ref", "book_date", "total_amount", "ticket_no", "passenger_id", "passenger_name", "contact_data", "last_update", "email", "phone", "dbt_time"
        from "Fact_tickets__dbt_tmp202219380814"
    )
  
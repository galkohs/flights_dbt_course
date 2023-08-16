-- Use the `ref` function to select from other models

select *
from "flights_demo"."flights_wh"."my_first_dbt_model"
where id = 1
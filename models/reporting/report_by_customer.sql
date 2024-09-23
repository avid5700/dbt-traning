{{
    config(
        materialized='table'
    )
}}

select 
    a.customerid,
    a.segment,
    a.country,
sum(a.order_profit) as profit
from  {{ ref('stg_orders') }} a
group by 
    a.customerid,
    a.segment,
    a.country


select a.productid,
       a.productname,
       a.category,
       a.subcategory,
       sum(a.order_profit) as profit
from {{ ref('stg_orders') }} a
group by 
       a.productid,
       a.productname,
       a.category,
       a.subcategory
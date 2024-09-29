select a.orderid
        ,a.ordersellingprice
from {{ ref('raw_orders') }} a
where a.ordersellingprice<0;
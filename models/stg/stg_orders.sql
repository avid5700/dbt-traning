

select 
    --from raw orders:
    orderid,
    shipmode,
    ORDERSELLINGPRICE,
    ordercostprice,
    ordersellingprice - ordercostprice as order_profit,
    cast(replace(shipdate,'/','-') as date)  as shipdate_dt, 
    cast(replace(orderdate,'/','-') as date)  as orderdate_dt, 

    --from raw customer:
    c.customername,
    c.segment, 
    c.country,
    c.customerid,
    --from raw product
    p.category,
    p.productname,
    p.subcategory,
    p.productid,
    {{ markup('ORDERSELLINGPRICE','ordercostprice') }} as markup
from {{ ref('raw_orders') }} as o 
    left join {{ ref('raw_customer') }} as c on o.customerid=c.customerid
    left join {{ ref('raw_product') }} as p  on  o.productid = p.productid
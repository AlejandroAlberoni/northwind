with 
    orders as (
    select
        *
    from {{ ref('stg_order') }}
    ),
    corrections as (
        select 
            * 
        from {{ ref ('customer_corrections') }}
    ),
    orders_corrected as (
        select
            orders.* except(CustomerId),
            coalesce(c.correct_customer_id, orders.CustomerId) as CustomerId
        from orders
        left join corrections c
            on orders.CustomerId = c.wrong_customer_id
    )
select
    od.*,
    o.CustomerId,
    o.EmployeeId,
    o.ShipperId,
    o.OrderDate,
    o.RequiredDate,
    o.ShippedDate,
    o.ShipCity,
    o.ShipRegion,
    o.ShipCountry
from {{ ref('stg_orderdetail') }} od
left join orders_corrected o on od.OrderId = o.Id
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
left join {{ ref('stg_order') }} o on od.OrderId = o.Id
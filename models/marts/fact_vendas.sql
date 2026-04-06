with
    customer as (
        select * from {{ ref('dim_customer') }}
    ),
    employee as (
        select * from {{ ref('dim_employee') }}
    ),
    shipper as (
        select * from {{ ref('dim_shipper') }}
    ),
    product as (
        select * from {{ ref('dim_product') }}
    ),
    vendas as (
        select
            odo.*,
            c.customer_sk as customer_fk,
            e.employee_sk as employee_fk,
            s.shipper_sk as shipper_fk,
            p.product_sk as product_fk
        from {{ ref('int_orderdetail_with_orders') }} odo
        left join customer c on odo.CustomerId = c.Id
        left join employee e on odo.EmployeeId = e.Id
        left join shipper s on odo.ShipperId = s.Id
        left join product p on odo.ProductId = p.Id
    )
select * from vendas
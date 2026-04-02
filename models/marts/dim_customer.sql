with 
    dim_customer as (
    select
            *
    from {{ ref('stg_customer') }}
    ),
    transformed as (
    select
        row_number() over (order by dim_customer.Id) as customer_sk
        ,*
    from dim_customer
    )
select * from transformed
with 
    dim_shipper as (
    select
            *
    from {{ ref('stg_shipper') }}
    ),
    transformed as (
    select
        row_number() over (order by dim_shipper.Id) as shipper_sk
        ,*
    from dim_shipper
    )
select * from transformed
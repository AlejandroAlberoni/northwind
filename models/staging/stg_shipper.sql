with
    source as (
        select
              Id	
            , CompanyName	
            , Phone	
        from {{ source('airbyte_data', 'Shipper') }}
    )
select * from source
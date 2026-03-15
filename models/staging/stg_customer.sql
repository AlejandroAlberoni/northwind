with
    source as (
        select
              Id	
            , CompanyName	
            , ContactName	
            , ContactTitle	
            , Address	
            , City	
            , Region	
            , PostalCode	
            , Country	
            , Phone	
            , Fax	
        from {{ source('airbyte_data', 'Customer') }}
    )
select * from source
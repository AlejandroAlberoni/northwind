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
            , HomePage
        from {{ source('airbyte_data', 'Supplier') }}
    )
select * from source
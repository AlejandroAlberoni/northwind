with
    source as (
        select
              Id	
            , LastName	
            , FirstName	
            , Title	
            , TitleOfCourtesy	
            , BirthDate	
            , HireDate	
            , Address	
            , City	
            , Region	
            , PostalCode	
            , Country	
            , HomePhone	
            , Extension	
            , Photo	
            , Notes	
            , ReportsTo	
            , PhotoPath	
        from {{ source('airbyte_data', 'Employee') }}
    )
select * from source
with
    source as (
        select
             Id	
            /* Foreign Keys */
            , CustomerId	
            , EmployeeId	
            , ShipVia as ShipperId	

            , SAFE_CAST(TRIM(OrderDate) as date) as OrderDate	
            , RequiredDate	
            , ShippedDate	
            , Freight	
            , ShipName	
            , ShipAddress	
            , ShipCity	
            , ShipRegion	
            , ShipPostalCode	
            , ShipCountry
        from {{ source('airbyte_data', 'Order') }}	
    )
select * from source
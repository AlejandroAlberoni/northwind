with
    source as (
        select
             Id	
            /* Foreign Keys */
            , CustomerId	
            , EmployeeId	
            , ShipVia as ShipperId	

            , OrderDate	
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
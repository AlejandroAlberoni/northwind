with
    source as (
        select 
              Id	
            /* Foreign Keys */
            , SupplierId	
            , CategoryId	

            , ProductName	
            , QuantityPerUnit	
            , UnitPrice	
            , UnitsInStock	
            , UnitsOnOrder	
            , ReorderLevel	
            , Discontinued	
        from {{ source('airbyte_data', 'Product') }}
    )
select * from source
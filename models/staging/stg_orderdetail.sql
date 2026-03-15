with
    source as (
        select
              Id	
            /* Foreign Keys */
            , OrderId	
            , ProductId	

            , UnitPrice	
            , Quantity	
            , Discount	
        from {{ source('airbyte_data', 'OrderDetail') }}
    )
select * from source
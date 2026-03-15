with
    source as (
        select
              Id	
            , CategoryName	
            , Description	    
        from {{ source('airbyte_data', 'Category') }}
    )
select * from source
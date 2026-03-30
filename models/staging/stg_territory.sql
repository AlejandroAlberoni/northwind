with
    source as (
        select
            Id,	
            TerritoryDescription,	
            RegionId		
        from {{ source('airbyte_data', 'Territory') }}
    )
select * from source
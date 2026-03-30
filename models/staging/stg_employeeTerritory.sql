with
    source as (
        select
            Id,	
            EmployeeId,	
            TerritoryId	
        from {{ source('airbyte_data', 'EmployeeTerritory') }}
    )
select * from source
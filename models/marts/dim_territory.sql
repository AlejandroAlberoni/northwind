with 
    dim_territory as (
    select
            *
    from {{ ref('stg_territory') }}
    ),
    transformed as (
    select
        row_number() over (order by dim_territory.Id) as territory_sk
        ,*
    from dim_territory
    )
select * from transformed
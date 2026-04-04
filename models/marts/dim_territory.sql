with 
    source as (
    select
            *
    from {{ ref('stg_territory') }}
    ),
    transformed as (
    select
        {{ dbt_utils.generate_surrogate_key(['s.Id']) }} as territory_sk,
        s.*
    from source s
    )
select * from transformed
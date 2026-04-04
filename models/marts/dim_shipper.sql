with 
    source as (
    select
            *
    from {{ ref('stg_shipper') }}
    ),
    transformed as (
    select
        {{ dbt_utils.generate_surrogate_key(['s.Id']) }} as shipper_sk,
        s.*
    from source s
    )
select * from transformed
with 
    dim_product as (
    select
            *
    from {{ ref('stg_product') }}
    ),
    transformed as (
    select
        row_number() over (order by dim_product.Id) as product_sk
        ,*
    from dim_product
    )
    -- MISSING: COLLAPSE SUPPLY AND CATEGORY TABLES
select * from transformed
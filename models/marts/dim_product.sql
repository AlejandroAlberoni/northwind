with
    products as (
        select
         {{ dbt_utils.generate_surrogate_key(['p.Id']) }} as product_sk
         , p.*
        from {{ ref('int_products_enriched') }} as p
    )
select * from products
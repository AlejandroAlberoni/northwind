with 
    product as (
        select
            *
        from {{ ref('stg_product') }}
    ),
    supplier as (
        select
            *
        from {{ ref('stg_supplier') }}

    ),
    category as (
        select
            *
        from {{ ref('stg_category') }}
    ),
    final as (
        select
            p.Id,
            s.Id as SupplierId,
            c.Id as CategoryId,

            p.ProductName,

            s.CompanyName as Supplier,
            s.Phone as SupplierPhone,

            c.CategoryName as Category

        from product p
        left join supplier s
            on p.SupplierId = s.Id
        left join category c
            on p.CategoryId = c.Id
    )
select * from final
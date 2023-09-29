with
    products as (select product_id, category, product from SF_DBT_LANDING.RETAIL_CSV_DATA.products),
    orders as (select product_id, order_date, sales from SF_DBT_LANDING.RETAIL_CSV_DATA.order_demo)

select
    p.product_id,
    p.category,
    p.product,
    year(o.order_date) as year_of_sales,
    sum(o.sales) as total_sales
from orders o
inner join products p on p.product_id = o.product_id
group by p.product_id, p.category, p.product, year(o.order_date)

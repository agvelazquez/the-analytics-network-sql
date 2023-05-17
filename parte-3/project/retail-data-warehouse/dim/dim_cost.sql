-- Table: stg.cost

DROP TABLE IF EXISTS dim.cost;

CREATE TABLE IF NOT EXISTS dim.cost
(
    product_id varchar(10) PRIMARY KEY,
    cost_usd numeric,
	constraint fk_product_id_cost
		foreign key (product_id)
		references dim.product_master(codigo_producto)
)

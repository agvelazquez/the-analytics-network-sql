-- Table: stg.cost

DROP TABLE IF EXISTS dim.cost;

CREATE TABLE IF NOT EXISTS dim.cost
(
    product_id varchar(10) PRIMARY KEY,
    cost_usd numeric
)

/* Crea tabla cost
Costo promedio actual por producto
*/
DROP TABLE IF EXISTS stg.cost;
    
CREATE TABLE stg.cost
                 (
                              product_code    VARCHAR(10)
                            , product_cost_usd DECIMAL
                 );
    

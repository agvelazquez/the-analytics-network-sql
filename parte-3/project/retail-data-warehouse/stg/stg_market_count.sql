/* Crea tabla market_count
Proveedor 1 de ingresos a tienda por fecha
*/
DROP TABLE IF EXISTS stg.market_count;
    
CREATE TABLE stg.market_count
                 (
                              store_id SMALLINT
                            , date  INTEGER
                            , traffic SMALLINT
                 );

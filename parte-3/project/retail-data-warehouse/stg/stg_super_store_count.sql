/* Crea tabla super_store_count
Proveedor 2 de ingresos a tienda por fecha
*/
DROP TABLE IF EXISTS stg.super_store_count;
    
CREATE TABLE stg.super_store_count
                 (
                              store_id SMALLINT
                            , date  VARCHAR(10)
                            , traffic SMALLINT
                 );
    

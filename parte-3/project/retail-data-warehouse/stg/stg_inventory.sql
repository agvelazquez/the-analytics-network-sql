DROP TABLE IF EXISTS stg.inventory;
    
/* Crea tabla inventory
Conteo de inventario al inicio y final del dia por fecha, tienda y codigo
*/
CREATE TABLE stg.inventory
                 (
					 		  date   DATE
                            , store_id  SMALLINT
                            , item_id     VARCHAR(10)
                            , initial SMALLINT
                            , final   SMALLINT
                 );

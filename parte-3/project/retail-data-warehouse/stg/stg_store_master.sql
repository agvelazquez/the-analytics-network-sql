/* Crea tabla store_master
Tabla maestra de tiendas 
*/
DROP TABLE IF EXISTS stg.store_master;
      
CREATE TABLE stg.store_master
                 (
                              store_id  SMALLINT
                            , country           VARCHAR(100)
                            , province      VARCHAR(100)
                            , city         VARCHAR(100)
                            , address      VARCHAR(255)
                            , name         VARCHAR(255)
                            , type           VARCHAR(100)
                            , start_date DATE
                            , latitude     DECIMAL(10, 8)
                            , longitude     DECIMAL(11, 8)
                 );

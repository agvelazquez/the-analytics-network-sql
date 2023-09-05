--CREATE DATABASE ceroamessi;

-- Crear schema stg
CREATE SCHEMA IF NOT EXISTS stg;

/* Crear tabla products
Maestro de productos que posee la empresa. 
is_active indica que productos estan actualmente a la venta
*/

DROP TABLE IF EXISTS stg.product_master ;
    
CREATE TABLE stg.product_master
                 (
                              product_code    VARCHAR(255)
                            , name            VARCHAR(255)
                            , category        VARCHAR(255)
                            , subcategory     VARCHAR(255)
                            , subsubcategory  VARCHAR(255)
                            , material        VARCHAR(255)
                            , color           VARCHAR(255)
                            , origin          VARCHAR(255)
                            , ean             bigint
                            , is_active       boolean
                            , has_bluetooth   boolean
                            , size            VARCHAR(255)
                 );
    
/* Crea tabla cost
Costo promedio actual por producto
*/
DROP TABLE IF EXISTS stg.cost;
    
CREATE TABLE stg.cost
                 (
                              product_code    VARCHAR(10)
                            , product_cost_usd DECIMAL
                 );
    
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
    
/* Crea tabla monthly_average_fx_rate
Promedio de cotizacion mensual de USD a ARS, EUR a ARS y USD a URU
*/
DROP TABLE IF EXISTS stg.monthly_average_fx_rate;
    
CREATE TABLE stg.monthly_average_fx_rate
                 (
                              month        DATE
                            , fx_rate_usd_peso DECIMAL
                            , fx_rate_usd_eur DECIMAL
                            , fx_rate_usd_uru  DECIMAL
                 );
    

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
                 );
    
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
    
/* Crea tabla order_sales_units
Ventas a nivel numero de orden, item.
*/
DROP TABLE IF EXISTS stg.order_line_sale;
    
CREATE TABLE stg.order_line_sale
                 (
                              order_number      VARCHAR(255)
                            , product   VARCHAR(10)
                            , store     SMALLINT
                            , date      date
                            , quantity   int
                            , sale      decimal(18,5)
                            , promotion  decimal(18,5)
                            , tax  decimal(18,5)
                            , credit   decimal(18,5)
                            , currency     varchar(3)
                            , pos        SMALLINT
                            , is_walkout BOOLEAN
                 );

-- Table: stg.return_movements
DROP TABLE IF EXISTS stg.return_movements;

CREATE TABLE IF NOT EXISTS stg.return_movements
(
    order_id varchar(255),
    return_id varchar(255),
    item varchar(255),
    quantity integer,
    movement_id integer,
    from_location varchar(255),
    to_location varchar(255),
    received_by varchar(255),
    date date
);

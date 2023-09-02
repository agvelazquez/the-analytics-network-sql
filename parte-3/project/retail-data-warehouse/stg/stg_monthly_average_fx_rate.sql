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
    

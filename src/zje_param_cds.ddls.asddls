@AbapCatalog.sqlViewName: 'ZJE_SQL_PARAM'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View with Parameter'
@Metadata.ignorePropagatedAnnotations: true
define view ZJE_PARAM_CDS 
 with parameters iv_carrid : abap.char(3),
                 @Environment.systemField: #SYSTEM_DATE
                 iv_date   : abap.dats
 as select from zsflight1
{
    key carrid as Carrid,
    key connid as Connid,
    :iv_date   as FlightDate,
    price      as Price
} where carrid = $parameters.iv_carrid
    and fldate = :iv_date

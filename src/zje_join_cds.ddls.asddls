@AbapCatalog.sqlViewName: 'ZJE_SQL_JOIN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Join CDS View'
@Metadata.ignorePropagatedAnnotations: true
define view ZJE_JOIN_CDS as select from zscarr1 inner join zsflight1
     on zscarr1.carrid = zsflight1.carrid
{
    key zscarr1.carrid as id,
    key zsflight1.connid as flight,
    zsflight1.fldate as flight_date,
    zsflight1.paymentsum as payment
}

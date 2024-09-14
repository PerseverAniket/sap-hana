@AbapCatalog.sqlViewName: 'ZJE_SQL_ASSOCIA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association CDS View'
@Metadata.ignorePropagatedAnnotations: true
define view ZJE_ASSOCIATION_CDS as select from zscarr1
association [1..*] to zsflight1 as _zsflight1
on $projection.Carrid = _zsflight1.carrid
{
   key zscarr1.carrid as Carrid,
   zscarr1.carrname   as Carrname,
   zscarr1.currcode   as Currcode,
   zscarr1.url        as Url,
   _zsflight1
}

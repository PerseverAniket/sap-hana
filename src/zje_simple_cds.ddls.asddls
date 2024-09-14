@AbapCatalog.sqlViewName: 'ZJE_SQL_CDS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Simple CDS View'
@Metadata.ignorePropagatedAnnotations: true
define view ZJE_SIMPLE_CDS as select from zscarr1
{
   key carrid as Carrid,
   carrname as Carrname,
   currcode as Currcode,
   url as Url
}

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

/*Select Queries on Association view
"Without association fields 
    SELECT carrid, carrname 
       FROM zje_association 
       INTO TABLE @DATA(carriers). 
    IF sy-subrc EQ 0. 
      cl_demo_output=>display( carriers ). 
    ENDIF.

"With association fields
    SELECT
       FROM zje_association_1\_zsflight1 as flight
       FIELDS flight~carrid, flight~connid
       INTO TABLE @DATA(flights).
    IF sy-subrc EQ 0.
      cl_demo_output=>display( flights ).
    ENDIF.
*/

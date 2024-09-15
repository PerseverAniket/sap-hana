CLASS zje_simple_amdp_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .
    TYPES         : tt_flights  TYPE STANDARD TABLE OF /dmo/flight.

    METHODS : get_flights IMPORTING VALUE(iv_carrid)  TYPE /dmo/flight-carrier_id
                                EXPORTING VALUE(et_flights) TYPE tt_flights.
    CLASS-METHODS : call_flight EXPORTING VALUE(et_flights) TYPE tt_flights.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zje_simple_amdp_class IMPLEMENTATION.
  METHOD get_flights BY DATABASE PROCEDURE
                     FOR HDB
                     LANGUAGE SQLSCRIPT
                     OPTIONS READ-ONLY
                     USING /dmo/flight.

    et_flights = select * from "/DMO/FLIGHT" WHERE carrier_id = :iv_carrid;

  ENDMETHOD.

  METHOD call_flight BY DATABASE PROCEDURE
                     FOR HDB
                     LANGUAGE SQLSCRIPT
                     OPTIONS READ-ONLY
                     USING zje_simple_amdp_class=>get_flights.
   CALL "ZJE_SIMPLE_AMDP_CLASS=>GET_FLIGHTS"(  iv_carrid  => 'AA',
                                               et_flights => et_flights );
  ENDMETHOD.
ENDCLASS.

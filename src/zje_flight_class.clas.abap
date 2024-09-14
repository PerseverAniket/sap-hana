CLASS zje_flight_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .
    CLASS-METHODS: get_flights for table FUNCTION zje_flight_table_function.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zje_flight_class IMPLEMENTATION.
METHOD get_flights BY DATABASE FUNCTION
                     FOR HDB LANGUAGE SQLSCRIPT
                     USING /dmo/flight.

    RETURN SELECT * from "/DMO/FLIGHT"
        WHERE carrier_id = :carrier;

  ENDMETHOD.
ENDCLASS.

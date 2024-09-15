CLASS zje_book_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zje_book_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: lt_book TYPE TABLE of zje_rap_book.

  "Fill Internal Tabel
  lt_book = VALUE #(
   ( travel_id = '00004285' booking_id = '0001' booking_date = '20240912' customer_id = '000002' carrier_id = 'AA' connection_id = '0015'
   flight_date = '20250207' flight_price = '1911.00' currency_code = 'USD' )
   ( travel_id = '00004286' booking_id = '0001' booking_date = '20240912' customer_id = '000001' carrier_id = 'AA' connection_id = '0015'
   flight_date = '20240413' flight_price = '3117.00' currency_code = 'USD' )
   ( travel_id = '00000001' booking_id = '0001' booking_date = '20240327' customer_id = '000594' carrier_id = 'UA' connection_id = '1537'
   flight_date = '20240413' flight_price = '438.00' currency_code = 'USD' )
   ( travel_id = '00000002' booking_id = '0001' booking_date = '20240411' customer_id = '000099' carrier_id = 'UA' connection_id = '1537'
   flight_date = '20240413' flight_price = '438.00' currency_code = 'USD' )
   ( travel_id = '00000004' booking_id = '0001' booking_date = '20240407' customer_id = '000665' carrier_id = 'UA' connection_id = '1537'
   flight_date = '20240413' flight_price = '438.00' currency_code = 'USD' )
   ( travel_id = '00000005' booking_id = '0001' booking_date = '20240410' customer_id = '000161' carrier_id = 'UA' connection_id = '1537'
   flight_date = '20240413' flight_price = '438.00' currency_code = 'USD' )
   ( travel_id = '00000006' booking_id = '0001' booking_date = '20240402' customer_id = '000072' carrier_id = 'UA' connection_id = '1537'
   flight_date = '20240413' flight_price = '438.00' currency_code = 'USD' )
   ( travel_id = '00000007' booking_id = '0001' booking_date = '20240324' customer_id = '000138' carrier_id = 'UA' connection_id = '1537'
   flight_date = '20240413' flight_price = '438.00' currency_code = 'USD' )
   ( travel_id = '00000008' booking_id = '0001' booking_date = '20240324' customer_id = '000698' carrier_id = 'UA' connection_id = '1537'
   flight_date = '20240413' flight_price = '438.00' currency_code = 'USD' )
   ( travel_id = '00000009' booking_id = '0001' booking_date = '20240324' customer_id = '000115' carrier_id = 'UA' connection_id = '1537'
   flight_date = '20240413' flight_price = '438.00' currency_code = 'USD' )
   ).

"Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zje_rap_book.
*   insert the new table entries
    INSERT zje_rap_book FROM TABLE @lt_book.

*   check the result
    SELECT * FROM zje_rap_book INTO TABLE @lt_book.
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully!').
  ENDMETHOD.
ENDCLASS.

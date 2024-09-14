@EndUserText.label: 'Flight Table Function'
define table function ZJE_FLIGHT_TABLE_FUNCTION
with parameters carrier : /dmo/carrier_id
returns {
  key client        : abap.clnt;
key carrier_id    : /dmo/carrier_id;
key connection_id : /dmo/connection_id;
key flight_date   : /dmo/flight_date;
@Semantics.amount.currencyCode : 'currency_code'
price             : /dmo/flight_price;
@Semantics.currencyCode: true
currency_code     : /dmo/currency_code;
plane_type_id     : /dmo/plane_type_id;
seats_max         : /dmo/plane_seats_max;
seats_occupied    : /dmo/plane_seats_occupied;
  
}
implemented by method zje_flight_class=>get_flights;
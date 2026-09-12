

import 'package:flutter_hotel_booking_assigment/core/constants/%20asset_constants.dart';

import '../../model/property_data.dart';

const List<PropertyData> dummyProperties = [
  PropertyData(
    imagePath: AssetConstants.icHotel,
    location: 'Toronto, Canada',
    distance: '150KM',
    available: 'OCT 24-25',
    price: '\$50.00',
  ),
  PropertyData(
    imagePath: AssetConstants.icHotel,
    location: 'Paris, France',
    distance: '320KM',
    available: 'NOV 02-04',
    price: '\$85.00',
  ),
  PropertyData(
    imagePath: AssetConstants.icHotel,
    location: 'Bali, Indonesia',
    distance: '890KM',
    available: 'NOV 12-15',
    price: '\$65.00',
  ),
  PropertyData(
    imagePath: AssetConstants.icHotel,
    location: 'Santorini, Greece',
    distance: '540KM',
    available: 'DEC 05-08',
    price: '\$120.00',
  ),
  PropertyData(
    imagePath: AssetConstants.icHotel,
    location: 'Dubai, UAE',
    distance: '210KM',
    available: 'DEC 20-23',
    price: '\$95.00',
  ),
];
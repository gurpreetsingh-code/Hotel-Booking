import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/%20asset_constants.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_dimensions.dart' show AppDimensions;


class HostAvatar extends StatelessWidget {
  final double screenWidth;

  const HostAvatar({super.key, 
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final size = AppDimensions.scaleWidth(
      screenWidth,
      38,
    );

    return ClipOval(
      child: Image.asset(
        AssetConstants.icProfile,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
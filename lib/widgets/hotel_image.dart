import 'package:flutter_hotel_booking_assigment/core/constants/app_colors.dart' show AppColors;
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_dimensions.dart';

class HotelImage extends StatelessWidget {
  final String imagePath;
  final double imageHeight;
  final double screenWidth;

  const HotelImage({
    super.key, 
    required this.imagePath,
    required this.imageHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(
          AppDimensions.scaleWidth(screenWidth, 28),
        ),
        bottomRight: Radius.circular(
          AppDimensions.scaleWidth(screenWidth, 28),
        ),
      ),
      child: Image.asset(
        imagePath,
        width: double.infinity,
        height: imageHeight,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: double.infinity,
            height: imageHeight,
            color: AppColors.unselectedItem,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported_outlined,
              color: AppColors.textSecondary,
            ),
          );
        },
      ),
    );
  }
}
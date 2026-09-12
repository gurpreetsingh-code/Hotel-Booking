import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_colors.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_dimensions.dart' show AppDimensions;


class DescriptionSection extends StatelessWidget {
  final double screenWidth;

  const DescriptionSection({super.key, 
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            color: AppColors.white,
            fontSize: AppDimensions.scaleWidth(
              screenWidth,
              14,
            ),
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(
          height: AppDimensions.scaleWidth(
            screenWidth,
            10,
          ),
        ),

        Text(
          'Experience a comfortable and memorable stay at '
          'our hotel, where modern amenities, warm hospitality, '
          'and convenient surroundings come together. Designed '
          'for both business and leisure travelers, the hotel '
          'offers well-appointed rooms, quality facilities, and '
          'attentive service to make every stay relaxing and '
          'enjoyable.\n\n'
          'Guests can enjoy comfortable accommodation, delicious '
          'dining options, high-speed Wi-Fi, and a welcoming '
          'atmosphere suitable for a family vacation or a '
          'weekend getaway.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: AppDimensions.scaleWidth(
              screenWidth,
              10,
            ),
            height: 1.35,
          ),
        ),
      ],
    );
  }
}
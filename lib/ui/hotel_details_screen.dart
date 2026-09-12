import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/%20asset_constants.dart';
import 'package:flutter_hotel_booking_assigment/widgets/description_section.dart' show DescriptionSection;
import 'package:flutter_hotel_booking_assigment/widgets/host_card.dart';
import 'package:flutter_hotel_booking_assigment/widgets/hotel_image.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../model/property_data.dart';

class HotelDetailsScreen extends StatelessWidget {
  final PropertyData data;

  const HotelDetailsScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final horizontalMargin = AppDimensions.scaleWidth(
      screenWidth,
      AppDimensions.bottomNavHorizontalMargin,
    );

    final imageHeight = AppDimensions.scaleWidth(
      screenWidth,
      245,
    );

    final hostCardHeight = AppDimensions.scaleWidth(
      screenWidth,
      135,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Background
          Image.asset(
            AssetConstants.appBackground,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Dark overlay
          Container(
            color: Colors.black.withValues(alpha: 0.30),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: AppDimensions.scaleWidth(
                  screenWidth,
                  110,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HotelImage(
                    imagePath: data.imagePath,
                    imageHeight: imageHeight,
                    screenWidth: screenWidth,
                  ),

                  Transform.translate(
                    offset: Offset(
                      0,
                      -AppDimensions.scaleWidth(
                        screenWidth,
                        45,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.scaleWidth(
                          screenWidth,
                          6,
                        ),
                      ),
                      child: HostCard(
                        screenWidth: screenWidth,
                        height: hostCardHeight,
                        data: data,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalMargin,
                    ),
                    child: DescriptionSection(
                      screenWidth: screenWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),

        
        ],
      ),
    );
  }
}
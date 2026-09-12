import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_colors.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_dimensions.dart';
import 'package:flutter_hotel_booking_assigment/model/property_data.dart';


class PropertyCard extends StatelessWidget {
  final PropertyData data;
  final double screenWidth;
  final VoidCallback? onTap;

  const PropertyCard({
    super.key,
    required this.data,
    required this.screenWidth,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double cardRadius = AppDimensions.scaleWidth(screenWidth, 24);
    final double panelRadius = AppDimensions.scaleWidth(screenWidth, 20);
    final double imageHeight = AppDimensions.scaleWidth(screenWidth, 300);
    final double panelPadding = AppDimensions.scaleWidth(screenWidth, 18);
    final panelOverlap = AppDimensions.scaleWidth(
  screenWidth,
  80,
);



   return InkWell(
  onTap: onTap,
  child: SizedBox(
    height: imageHeight + panelOverlap,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        // Hotel Image
        ClipRRect(
          borderRadius: BorderRadius.circular(cardRadius),
          child: Image.asset(
            data.imagePath,
            height: imageHeight,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: imageHeight,
                width: double.infinity,
                color: AppColors.unselectedItem,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.textSecondary,
                ),
              );
            },
          ),
        ),

        // Information Card
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(panelPadding),
            decoration: BoxDecoration(
              color: AppColors.cardFooter,
              borderRadius: BorderRadius.circular(panelRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.35),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppDimensions.scaleWidth(
                      screenWidth,
                      18,
                    ),
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(
                  height: AppDimensions.scaleWidth(
                    screenWidth,
                    14,
                  ),
                ),

                Row(
                  children: [
                    _Stat(
                      label: 'Distance',
                      value: data.distance,
                      screenWidth: screenWidth,
                    ),

                    _StatDivider(
                      screenWidth: screenWidth,
                    ),

                    _Stat(
                      label: 'Available',
                      value: data.available,
                      screenWidth: screenWidth,
                    ),

                    _StatDivider(
                      screenWidth: screenWidth,
                    ),

                    _Stat(
                      label: 'Price',
                      value: data.price,
                      screenWidth: screenWidth,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  final double screenWidth;

  const _Stat({
    required this.label,
    required this.value,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: AppDimensions.scaleWidth(screenWidth, 11),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: AppDimensions.scaleWidth(screenWidth, 4)),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.white,
              fontSize: AppDimensions.scaleWidth(screenWidth, 13),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  final double screenWidth;

  const _StatDivider({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: AppDimensions.scaleWidth(screenWidth, 28),
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.scaleWidth(screenWidth, 10),
      ),
      color: AppColors.divider,
    );
  }
}
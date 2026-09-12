import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_colors.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_dimensions.dart';
import 'package:flutter_hotel_booking_assigment/model/property_data.dart';
import 'package:flutter_hotel_booking_assigment/widgets/host_avatar.dart';

class HostCard extends StatelessWidget {
  final double screenWidth;
  final double height;
  final PropertyData data;

  const HostCard({super.key, 
    required this.screenWidth,
    required this.height,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(
        AppDimensions.scaleWidth(screenWidth, 14),
      ),
      decoration: BoxDecoration(
        color: AppColors.cardFooter,
        borderRadius: BorderRadius.circular(
          AppDimensions.scaleWidth(screenWidth, 22),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.30),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HostAvatar(
                screenWidth: screenWidth,
              ),

              SizedBox(
                width: AppDimensions.scaleWidth(
                  screenWidth,
                  10,
                ),
              ),

              Expanded(
                child: Text(
                  'Hosted by Trang Luxury,\nLifestyle',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppDimensions.scaleWidth(
                      screenWidth,
                      12,
                    ),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: AppDimensions.scaleWidth(
              screenWidth,
              10,
            ),
          ),

          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.white,
                size: 12,
              ),

              const SizedBox(width: 4),

              Text(
                '4.9',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: AppDimensions.scaleWidth(
                    screenWidth,
                    10,
                  ),
                ),
              ),

              SizedBox(
                width: AppDimensions.scaleWidth(
                  screenWidth,
                  16,
                ),
              ),

              Text(
                '1,648 reviews',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: AppDimensions.scaleWidth(
                    screenWidth,
                    10,
                  ),
                ),
              ),

              const Spacer(),

              Text(
                '${data.available}',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: AppDimensions.scaleWidth(
                    screenWidth,
                    10,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: AppDimensions.scaleWidth(
              screenWidth,
              10,
            ),
          ),

          Row(
            children: [
              Container(
                width: AppDimensions.scaleWidth(
                  screenWidth,
                  28,
                ),
                height: AppDimensions.scaleWidth(
                  screenWidth,
                  28,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: AppDimensions.scaleWidth(
                    screenWidth,
                    15,
                  ),
                ),
              ),

              SizedBox(
                width: AppDimensions.scaleWidth(
                  screenWidth,
                  10,
                ),
              ),

              Expanded(
                child: Text(
                  '1155 Rue Sherbrooke Ouest, Toronto,\nCanada H3A 2N3',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppDimensions.scaleWidth(
                      screenWidth,
                      9,
                    ),
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
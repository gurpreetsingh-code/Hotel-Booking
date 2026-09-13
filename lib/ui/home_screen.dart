import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_colors.dart' show AppColors;
import 'package:flutter_hotel_booking_assigment/core/constants/dummy_property.dart';
import 'package:flutter_hotel_booking_assigment/widgets/property_card.dart' show PropertyCard;
import '../core/constants/app_dimensions.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onHotelTap;
  final VoidCallback? openDrawer;

  const HomeScreen({
    super.key,
    this.onHotelTap, 
    this.openDrawer,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final horizontalMargin = AppDimensions.scaleWidth(
      screenWidth,
      AppDimensions.bottomNavHorizontalMargin,
    );

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppDimensions.scaleWidth(
                screenWidth,
                8,
              ),
            ),

            _Header(
              screenWidth: screenWidth, openDrawer: openDrawer,
            ),

            SizedBox(
              height: AppDimensions.scaleWidth(
                screenWidth,
                20,
              ),
            ),

            _SearchBar(
              screenWidth: screenWidth,
            ),

            SizedBox(
              height: AppDimensions.scaleWidth(
                screenWidth,
                20,
              ),
            ),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(
                  bottom: AppDimensions.scaleWidth(
                    screenWidth,
                    110,
                  ),
                ),
                itemCount: dummyProperties.length,
                separatorBuilder: (_, _) {
                  return SizedBox(
                    height: AppDimensions.scaleWidth(
                      screenWidth,
                      16,
                    ),
                  );
                },
                itemBuilder: (context, index) {
                  return PropertyCard(
                    data: dummyProperties[index],
                    screenWidth: screenWidth,
                    onTap: onHotelTap,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class _Header extends StatelessWidget {
  final double screenWidth;
    final VoidCallback? openDrawer;

 
  const _Header({required this.screenWidth, 
  required this.openDrawer});
 
  @override
  Widget build(BuildContext context) {
    final double iconButtonSize = AppDimensions.scaleWidth(screenWidth, 44);
 
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Good Morning\n',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppDimensions.scaleWidth(screenWidth, 22),
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
                TextSpan(
                  text: 'Prabhat',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppDimensions.scaleWidth(screenWidth, 26),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: iconButtonSize,
          height: iconButtonSize,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: openDrawer,
            icon:Icon(Icons.menu,size: AppDimensions.scaleWidth(screenWidth, 20),color: AppColors.white,)
          ),
        ),
      ],
    );
  }
}
 
class _SearchBar extends StatelessWidget {
  final double screenWidth;
 
  const _SearchBar({required this.screenWidth});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.scaleWidth(screenWidth, 52),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.scaleWidth(screenWidth, 16),
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(
          AppDimensions.scaleWidth(screenWidth, 100),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColors.textSecondary,
            size: AppDimensions.scaleWidth(screenWidth, 20),
          ),
          SizedBox(width: AppDimensions.scaleWidth(screenWidth, 10)),
          Expanded(
            child: Text(
              'Search Location',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: AppDimensions.scaleWidth(screenWidth, 14),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            Icons.mic_none_rounded,
            color: AppColors.textSecondary,
            size: AppDimensions.scaleWidth(screenWidth, 20),
          ),
        ],
      ),
    );
  }
}
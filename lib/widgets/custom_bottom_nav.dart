import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_dimensions.dart';
import '../core/constants/ asset_constants.dart';
import '../core/constants/app_colors.dart';
import 'bottom_nav_item.dart';



class CustomBottomNav extends StatefulWidget {
  final int initialIndex;
    final ValueChanged<int>? onItemSelected;


  const CustomBottomNav({
    super.key,
    this.initialIndex = 0,
        this.onItemSelected,

  });

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  late int selectedIndex = widget.initialIndex;

  final List<_NavData> items = const [
    _NavData(
      iconPath: AssetConstants.icHome,
      label: 'Dashboard',
    ),
    _NavData(
      iconPath: AssetConstants.icAir,
      label: 'Hotels Resort',
    ),
    _NavData(
      iconPath: AssetConstants.icCall,
      label: 'Booking Hotel',
    ),
    _NavData(
      iconPath: AssetConstants.icProfile,
      isImageIcon: true,
      label: 'Account',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // get the screen width for the responsive ui
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      height: AppDimensions.scaleWidth(screenWidth, 72),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.scaleWidth(screenWidth, 6),
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(
          AppDimensions.scaleWidth(screenWidth, 100),
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(-1, 3),
            blurRadius: 8,
            color: Color(0x70474747),
          ),
        ],
      ),
      child: Row(
        children: [
          for (int index = 0; index < items.length; index++) ...[
            if (index != 0) SizedBox(width: AppDimensions.scaleWidth(screenWidth, 6)),
            _buildItem(index, screenWidth),
          ],
        ],
      ),
    );
  }

  Widget _buildItem(int index, double screenWidth) {
    final item = items[index];
    final isSelected = selectedIndex == index;

    final navItem = BottomNavItem(
      label: item.label,
      selected: isSelected,
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
          widget.onItemSelected?.call(index);

      },
      iconPath: item.iconPath,
      isImageIcon: item.isImageIcon,
      screenWidth: screenWidth,
    );

    return isSelected ? Expanded(child: navItem) : navItem;
  }
}

class _NavData {
  final String iconPath;
  final bool isImageIcon;
  final String label;

  const _NavData({
    required this.iconPath,
    this.isImageIcon = false,
    required this.label,
  });
}


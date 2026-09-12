import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_colors.dart' show AppColors;
import 'package:flutter_hotel_booking_assigment/core/constants/app_dimensions.dart' show AppDimensions;
import 'package:flutter_svg/svg.dart';


class BottomNavItem extends StatelessWidget {
  final String iconPath;
  final bool isImageIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final double screenWidth;

  const BottomNavItem({
    super.key,
    required this.iconPath,
    this.isImageIcon = false,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final double itemHeight = AppDimensions.scaleWidth(screenWidth, 60);
    final double iconSize = AppDimensions.scaleWidth(screenWidth, 20);

    // svg icons: derive padding so icon + 2*padding == itemHeight (a circle)
    final double unselectedIconPadding = (itemHeight - iconSize) / 2;
    final double selectedPadding = AppDimensions.scaleWidth(screenWidth, 20);

    // Avatar photo: fills the circle edge-to-edge when unselected (inset 0),
    // and sits slightly inset once the pill is selected — sized off the
    // container's own height, never off iconSize.
    final double avatarInset =
        selected ? AppDimensions.scaleWidth(screenWidth, 4) : 0;
    final double avatarSize = itemHeight - (avatarInset * 2);

    final EdgeInsets contentPadding = isImageIcon
        ? EdgeInsets.only(
            left: selected ? AppDimensions.scaleWidth(screenWidth, 4) : 0,
            right: selected ? selectedPadding : 0,
          )
        : EdgeInsets.symmetric(
            horizontal: selected ? selectedPadding : unselectedIconPadding,
          );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(itemHeight),
      child: AnimatedContainer(
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 350),
        height: itemHeight,
        clipBehavior: Clip.antiAlias,
        padding: contentPadding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryBlue : AppColors.unselectedItem,
          borderRadius: BorderRadius.circular(itemHeight),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isImageIcon)
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: selected ? avatarInset : 0,
                ),
                child: ClipOval(
                  child: Image.asset(
                    iconPath,
                    width: avatarSize -2,
                    height: avatarSize- 2,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              SvgPicture.asset(
                iconPath,
                width: iconSize,
                height: iconSize,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            if (selected) ...[
              SizedBox(width: AppDimensions.scaleWidth(screenWidth, 7)),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppDimensions.scaleWidth(screenWidth, 14),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}



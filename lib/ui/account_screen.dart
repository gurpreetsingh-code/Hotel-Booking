import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_dimensions.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_text_styles.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final horizontalPadding =
        AppDimensions.scaleWidth(screenWidth, 20);

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        50,
        horizontalPadding,
        110,
      ),
      child: Column(
        children: [
          SizedBox(height: 50,),
          _buildAccountItem(
            icon: Icons.person_outline_rounded,
            title: 'Edit Profile',
            subtitle: 'Manage your professional profile',
          ),
          _buildAccountItem(
            icon: Icons.account_tree_outlined,
            title: 'Account',
            subtitle: 'Manage account and login settings',
          ),
          _buildAccountItem(
            icon: Icons.notifications_none_rounded,
            title: 'Notification',
            subtitle: 'Manage your notification preferences',
          ),
          _buildAccountItem(
            icon: Icons.palette_outlined,
            title: 'Appearance',
            subtitle: 'Customize your app experience',
          ),
          _buildAccountItem(
            icon: Icons.help_outline_rounded,
            title: 'Help & Feedback',
            subtitle: 'Get help or share feedback',
          ),
          _buildAccountItem(
            icon: Icons.person_add_alt_1_outlined,
            title: 'Invite a friend',
            subtitle: 'Invite friends to NextRole.app',
          ),
          _buildAccountItem(
            icon: Icons.shield_outlined,
            title: 'Privacy & Security',
            subtitle: 'Manage privacy and data settings',
          ),
          _buildAccountItem(
            icon: Icons.credit_card_outlined,
            title: 'Subscription',
            subtitle: 'Manage your plan and billing',
            showComingSoon: true,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountItem({
  required IconData icon,
  required String title,
  required String subtitle,
  bool showComingSoon = false,
}) {
  return Container(
    height: 55,
    margin: const EdgeInsets.only(bottom: 9),
    padding: const EdgeInsets.symmetric(
      horizontal: 9,
    ),
    decoration: BoxDecoration(
      color: const Color(0xFF1D1D1F),
      borderRadius: BorderRadius.circular(26),
    ),
    child: Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: const Color(0xFF202124),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.05),
            ),
          ),
          child: Icon(
            icon,
            color: const Color(0xFFD9DBDD),
            size: 20,
          ),
        ),

        const SizedBox(width: 9),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                 style: AppTextStyles.profileTitle,

              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF8D9295),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        if (showComingSoon)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF6B4D18),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Coming Soon',
              style: TextStyle(
                color: Color(0xFFE7A832),
                fontSize: 8,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

        if (!showComingSoon)
          const Icon(
            Icons.chevron_right_rounded,
            color: Color(0xFFB8BCBE),
            size: 16,
          ),
      ],
    ),
  );
}
}
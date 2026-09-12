import 'package:flutter/material.dart';

import '../core/constants/ asset_constants.dart';
import '../core/constants/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    this.onClose,
  });

  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 265,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0C0F0E),
              Color(0xFF0E2C3F),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              9,
              28,
              9,
              20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfile(),

                const SizedBox(height: 25),

                _buildSectionTitle('Account Setting'),

                _buildItem(
                  icon: Icons.notifications_none_rounded,
                  title: 'Notification',
                  showBadge: true,
                ),

                _buildItem(
                  icon: Icons.payment_outlined,
                  title: 'Payment',
                ),

                _buildItem(
                  icon: Icons.translate_rounded,
                  title: 'Translate',
                ),

                _buildItem(
                  icon: Icons.lock_outline_rounded,
                  title: 'Privacy',
                ),

                const SizedBox(height: 20),

                _buildSectionTitle('Account Setting'),

                _buildItem(
                  icon: Icons.list_alt_rounded,
                  title: 'Listing',
                ),

                _buildItem(
                  icon: Icons.person_outline_rounded,
                  title: 'Host',
                ),

                const SizedBox(height: 20),

                _buildSectionTitle('Account Setting'),

                _buildItem(
                  icon: Icons.dark_mode_outlined,
                  title: 'Dark Mode',
                ),

                _buildItem(
                  icon: Icons.system_update_outlined,
                  title: 'Update',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                AssetConstants.icProfile,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(width: 9),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alice Premium',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Toronto, Canada',
                style: TextStyle(
                  color: Color(0xFF969B9E),
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),

        GestureDetector(
          onTap: onClose,
          child: const Icon(
            Icons.close_rounded,
            color: Color(0xFFB9BEC1),
            size: 19,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 3,
        bottom: 8,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 9,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String title,
    bool showBadge = false,
  }) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          const SizedBox(width: 5),

          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFF202529),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 17,
              color: Color(0xFF9EA4A7),
            ),
          ),

          const SizedBox(width: 9),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFFB7BBBE),
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          if (showBadge)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFA500),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '12',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 7,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

          if (!showBadge)
            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFFB7BBBE),
              size: 16,
            ),

          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
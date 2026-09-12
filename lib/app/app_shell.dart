import 'package:flutter/material.dart';

import 'package:flutter_hotel_booking_assigment/core/constants/app_dimensions.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/dummy_property.dart';

import 'package:flutter_hotel_booking_assigment/ui/account_screen.dart';
import 'package:flutter_hotel_booking_assigment/ui/booking_date_screen.dart';
import 'package:flutter_hotel_booking_assigment/ui/hotel_details_screen.dart';
import 'package:flutter_hotel_booking_assigment/ui/home_screen.dart';

import 'package:flutter_hotel_booking_assigment/widgets/app_drawer.dart';
import 'package:flutter_hotel_booking_assigment/widgets/custom_bottom_nav.dart';

import '../core/constants/ asset_constants.dart' show AssetConstants;

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  Widget? _detailScreen;

  bool _isDrawerOpen = false;

  static const double _drawerWidth = 265;

  void _openHotelDetails() {
    setState(() {
      _selectedIndex = 1;

      _detailScreen = HotelDetailsScreen(
        data: dummyProperties.first,
      );
    });
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
      _detailScreen = null;
    });
  }

  void _openDrawer() {
    setState(() {
      _isDrawerOpen = true;
    });
  }

  void _closeDrawer() {
    setState(() {
      _isDrawerOpen = false;
    });
  }

  Widget _currentScreen() {
    if (_detailScreen != null) {
      return _detailScreen!;
    }

    switch (_selectedIndex) {
      case 0:
        return HomeScreen(
          onHotelTap: _openHotelDetails,
          openDrawer: _openDrawer,
        );

      case 1:
        return HotelDetailsScreen(
          data: dummyProperties.first,
        );

      case 2:
        return const BookingDateScreen();

      case 3:
        return const AccountScreen();

      default:
        return HomeScreen(
          onHotelTap: _openHotelDetails,
          openDrawer: _openDrawer,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final horizontalMargin = AppDimensions.scaleWidth(
      screenWidth,
      AppDimensions.bottomNavHorizontalMargin,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Common background
          Image.asset(
            AssetConstants.appBackground,
            fit: BoxFit.cover,
          ),

          // Common scrim
          Container(
            color: Colors.black.withValues(
              alpha: 0.35,
            ),
          ),

          // Current screen + bottom navigation
          AnimatedPositioned(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOutCubic,
            left: _isDrawerOpen ? _drawerWidth : 0,
            right: _isDrawerOpen ? -_drawerWidth : 0,
            top: 0,
            bottom: 0,
            child: Stack(
              children: [
                // Current screen
                Positioned.fill(
                  child: _currentScreen(),
                ),

                // Bottom navigation
                Positioned(
                  left: horizontalMargin,
                  right: horizontalMargin,
                  bottom: 20,
                  child: CustomBottomNav(
                    initialIndex: _selectedIndex,
                    onItemSelected: _onBottomNavTap,
                  ),
                ),
              ],
            ),
          ),

          // Custom drawer
          if (_isDrawerOpen)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: _drawerWidth,
              child: AppDrawer(
                onClose: _closeDrawer,
              ),
            ),
        ],
      ),
    );
  }
}
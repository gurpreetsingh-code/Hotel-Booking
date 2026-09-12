import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_assigment/core/constants/app_dimensions.dart';

import '../../core/constants/app_colors.dart';

class BookingDateScreen extends StatelessWidget {
  const BookingDateScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width; 

    final horizontalPadding =
        AppDimensions.scaleWidth(screenWidth, 37);

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        58,
        horizontalPadding,
        110,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          _buildHeader(),
          const SizedBox(height: 50),
          _buildCalendar(),
          const SizedBox(height: 25),
          _buildMonthButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2-night stay',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 7),
              Text(
                'Mon, Oct 24 → Wed, Oct 26',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text(
              'Cancel Date',
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        14,
        10,
        14,
        16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            'Feb 2026',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
          _buildWeekHeader(),
          const SizedBox(height: 5),
          _buildCalendarDays(),
        ],
      ),
    );
  }

  Widget _buildWeekHeader() {
    const days = [
      'S',
      'M',
      'T',
      'W',
      'T',
      'F',
      'S',
    ];

    return Row(
      children: days.map((day) {
        return Expanded(
          child: Center(
            child: Text(
              day,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 10,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarDays() {
    const dates = [
      ['', '1', '2', '3', '4', '5', '6'],
      ['7', '8', '9', '10', '11', '12', '13'],
      ['14', '15', '16', '17', '18', '19', '20'],
      ['21', '22', '23', '24', '25', '26', '27'],
      ['28', '1', '2', '3', '4', '5', '6'],
    ];

    return Column(
      children: dates.map((week) {
        return Row(
          children: week.map((day) {
            return Expanded(
              child: SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    day,
                    style: const TextStyle(
                      color: Color(0xFFD0D2D4),
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  Widget _buildMonthButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildArrowButton(
          Icons.chevron_left_rounded,
        ),
        const SizedBox(width: 34),
        _buildArrowButton(
          Icons.chevron_right_rounded,
        ),
      ],
    );
  }

  Widget _buildArrowButton(IconData icon) {
    return Container(
      width: 22,
      height: 22,
      decoration: const BoxDecoration(
        color: AppColors.primaryBlue,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: AppColors.white,
        size: 18,
      ),
    );
  }
}
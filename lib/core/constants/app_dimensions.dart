class AppDimensions {
  AppDimensions._();


// figma design width and margin 
  static const double designWidth = 393.0;
  static const double bottomNavHorizontalMargin = 23.0;

  static double scaleWidth(
    double screenWidth,
    double value,
  ) {
    return screenWidth * (value / designWidth);
  }
}
import 'package:flutter/material.dart';

/// Responsive breakpoints and utilities for the luxury store app
class Responsive {
  // Breakpoint values
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  /// Check if current screen is mobile
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  /// Check if current screen is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  /// Check if current screen is desktop
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  /// Check if current screen is large desktop
  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;

  /// Get current screen width
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  /// Get current screen height
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  /// Get number of columns for product grid based on screen width
  static int getGridColumns(BuildContext context) {
    final width = screenWidth(context);
    if (width >= desktopBreakpoint) return 4;
    if (width >= tabletBreakpoint) return 3;
    if (width >= mobileBreakpoint) return 3;
    return 2;
  }

  /// Get product card aspect ratio based on screen size
  /// Lower values = taller cards (more room for content)
  static double getProductCardAspectRatio(BuildContext context) {
    if (isDesktop(context)) return 0.62;
    if (isTablet(context)) return 0.60;
    return 0.58;
  }

  /// Get horizontal padding based on screen size
  static double getHorizontalPadding(BuildContext context) {
    final width = screenWidth(context);
    if (width >= desktopBreakpoint) return 80;
    if (width >= tabletBreakpoint) return 48;
    if (width >= mobileBreakpoint) return 32;
    return 20;
  }

  /// Get content max width for centered layouts
  static double getContentMaxWidth(BuildContext context) {
    final width = screenWidth(context);
    if (width >= desktopBreakpoint) return 1200;
    if (width >= tabletBreakpoint) return 900;
    return double.infinity;
  }

  /// Get font scale factor based on screen size
  static double getFontScaleFactor(BuildContext context) {
    final width = screenWidth(context);
    if (width >= desktopBreakpoint) return 1.15;
    if (width >= tabletBreakpoint) return 1.1;
    return 1.0;
  }

  /// Get spacing factor based on screen size
  static double getSpacingFactor(BuildContext context) {
    if (isLargeDesktop(context)) return 1.5;
    if (isDesktop(context)) return 1.3;
    if (isTablet(context)) return 1.15;
    return 1.0;
  }

  /// Get image height for product detail based on screen
  static double getProductImageHeight(BuildContext context) {
    final height = screenHeight(context);
    if (isDesktop(context)) return height * 0.55;
    if (isTablet(context)) return height * 0.50;
    return height * 0.45;
  }

  /// Build responsive value - returns different values based on screen size
  static T value<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context)) return desktop ?? tablet ?? mobile;
    if (isTablet(context)) return tablet ?? mobile;
    return mobile;
  }
}

/// Responsive wrapper widget for adaptive layouts
class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }
    if (Responsive.isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}

/// Responsive constraint wrapper for max-width layouts
class ResponsiveConstraint extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  final EdgeInsets? padding;

  const ResponsiveConstraint({
    super.key,
    required this.child,
    this.maxWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? Responsive.getContentMaxWidth(context),
        ),
        child: Padding(
          padding:
              padding ??
              EdgeInsets.symmetric(
                horizontal: Responsive.getHorizontalPadding(context),
              ),
          child: child,
        ),
      ),
    );
  }
}

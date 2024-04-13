// import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class THelperFunctions {
  static void showSnackBar(String message, BuildContext context,
      {Color? backgroundColor, int seconds = 2}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(message),
        duration: Duration(seconds: seconds),
      ),
    );
  }

  // static String getArabicDayName(DateTime date) {
  //   var dayName = DateFormat('EEEE', 'ar').format(date);
  //   return dayName;
  // }

  // static void showAlert(String title, String message, BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(title),
  //         content: Text(message),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: Text(AppLocalizations.of(context).ok),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // static void navigateToScreen(
  //   BuildContext context,
  //   Widget screen, [
  //   Duration duration = const Duration(milliseconds: 500),
  // ]) {
  //   Navigator.push(
  //     context,
  //     PageRouteBuilder(
  //       pageBuilder: (context, animation, secondaryAnimation) =>
  //           SharedAxisTransition(
  //         animation: animation,
  //         secondaryAnimation: secondaryAnimation,
  //         transitionType: SharedAxisTransitionType.horizontal,
  //         child: screen,
  //       ),
  //       transitionDuration: duration,
  //       reverseTransitionDuration: duration,
  //
  //       barrierColor: Theme.of(context).scaffoldBackgroundColor,
  //       // transitionsBuilder: (context, animation, secondaryAnimation, child) => SharedAxisTransition(animation: animation, secondaryAnimation: secondaryAnimation, transitionType: SharedAxisTransitionType.vertical, child: child),
  //     ),
  //   );
  // }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // static String getFormattedDate(DateTime date,
  //     {String format = 'dd MMM yyyy'}) {
  //   return DateFormat(format).format(date);
  // }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}

extension BuildContextExtension<T> on BuildContext {
  //Device Size

  bool get isMobile => MediaQuery.of(this).size.width <= 500;
  bool get isTablet =>
      MediaQuery.of(this).size.width <= 1024 &&
      MediaQuery.of(this).size.width >= 650;
  bool get isSmallTablet =>
      MediaQuery.of(this).size.width <= 600 &&
      MediaQuery.of(this).size.width > 500;
  bool get isDesktop => MediaQuery.of(this).size.width >= 1024;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  Size get size => MediaQuery.of(this).size;
//text styles
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle;

  TextStyle? get bodyExtraSmall =>
      bodySmall?.copyWith(fontSize: 10, height: 1.6, letterSpacing: .5);

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get dividerTextSmall => bodySmall?.copyWith(
      letterSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 12.0);

  TextStyle? get dividerTextLarge => bodySmall?.copyWith(
      letterSpacing: 1.5,
      fontWeight: FontWeight.w700,
      fontSize: 13.0,
      height: 1.23);
  //Theme colors
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get cardColor => Theme.of(this).cardColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get background => Theme.of(this).colorScheme.background;
  //functions
  Future<T?> showBottomSheet({
    required Widget child,
    bool isScrollControlled = false,
    Color backgroundColor = Colors.white,
    Color? barrierColor,
  }) {
    return showModalBottomSheet(
      backgroundColor: backgroundColor,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      context: this,
      builder: (context) {
        return child;
      },
    );
  }
}

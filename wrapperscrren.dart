import 'package:cartify/screens/splashscreen.dart';
import 'package:flutter/material.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

// final themeProvider = Provider.of<AppThemeProvider>(context);
// TextButton(
          //     onPressed: () {
          //       bool isDarkTheme = themeProvider.isDarkMode;
          //       final provider =
          //           Provider.of<AppThemeProvider>(context, listen: false);
          //       provider.toggleTheme(!isDarkTheme);
          //     },
          //     child: Text("Dark Mode"))
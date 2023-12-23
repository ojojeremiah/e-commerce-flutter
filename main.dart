import 'package:cartify/screens/wrapperscrren.dart';
import 'package:cartify/services/app_service_locator.dart';
import 'package:cartify/utils/provider/app_provider.dart';
import 'package:cartify/utils/theme/app_colors.dart';
import 'package:cartify/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupApiLocation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const Cartify(),
        theme: ThemeData(
          sliderTheme: const SliderThemeData(thumbColor: AppColors.brandColor),
        ));
  }
}

class Cartify extends StatelessWidget {
  const Cartify({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppThemeProvider()..initialize(),
        builder: (context, _) {
          final themeProvider = Provider.of<AppThemeProvider>(context);

          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).hintColor,
              statusBarBrightness: themeProvider.themeMode == ThemeMode.light
                  ? Brightness.light
                  : Brightness.dark));

          return ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, _) => OverlaySupport(
                child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Cartify",
              themeMode: themeProvider.themeMode,
              theme: AppThemes.appLightTheme,
              // darkTheme: AppThemes.appDarkTheme,
              home: const WrapperScreen(),
            )),
          );
        });
  }
}

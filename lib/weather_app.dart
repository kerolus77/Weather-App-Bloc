import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/app_router.dart';
import 'core/themes/app_theme.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          theme: AppTheme.data(context),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouting.splashScreen,
          debugShowCheckedModeBanner: false,
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:weather_app/features/home/presentation/view_model/search/search_bloc.dart';
import 'package:weather_app/features/weather_details/presentation/view/weather_details_screen.dart';

import '../../features/home/presentation/view/home_screen.dart';
import '../../features/splash/presentaion/view/splash_screen.dart';
import '../../features/weather_details/presentation/view_model/bloc/weather_details_bloc.dart';
import '../services/services_locator/services_locator.dart';

class AppRouting {
  static const String splashScreen = "/splashs";
  static const String homeScreen = "/home";
  static const String weatherDetailsScreen = "/weatherDetails";
}

class AppRouter {
  static Route<dynamic> animateRouteBuilder(
    Widget widget, {
    PageRouteAnimation? pageRouteAnimation,
    Duration? duration,
  }) {
    return buildPageRoute(
        widget,
        pageRouteAnimation ?? PageRouteAnimation.SlideBottomTop,
        duration ?? 300.ms);
  }

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    var args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRouting.splashScreen:
        return animateRouteBuilder(
          const SplashScreen(),
          pageRouteAnimation: PageRouteAnimation.SlideBottomTop,
        );

      case AppRouting.homeScreen:
        return animateRouteBuilder(
          BlocProvider(
            create: (context) => sl<SearchBloc>(),
            child: const HomeScreen(),
          ),
          pageRouteAnimation: PageRouteAnimation.SlideBottomTop,
        );

      case AppRouting.weatherDetailsScreen:
        return animateRouteBuilder(
          BlocProvider(
            create: (context) => sl<WeatherDetailsBloc>(param1: args),
            child: WeatherDetailsScreen(),
          ),
          pageRouteAnimation: PageRouteAnimation.SlideBottomTop,
        );
      default:
        return null;
    }
  }
}

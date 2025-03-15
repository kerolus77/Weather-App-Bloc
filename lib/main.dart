import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:weather_app/observers/bloc_observer.dart';
import 'package:weather_app/weather_app.dart';

import 'core/services/services_locator/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObservers();
  ServiceLocator.init();
  await initialize();
  await ScreenUtil.ensureScreenSize();
  runApp(const WeatherApp());
}

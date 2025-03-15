import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/bloc/weather_details_bloc.dart';
import 'hourly_forecat_item.dart';

class HourlyForecastList extends StatefulWidget {
  const HourlyForecastList({Key? key}) : super(key: key);

  @override
  State<HourlyForecastList> createState() => _HourlyForecastListState();
}

class _HourlyForecastListState extends State<HourlyForecastList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentHour();
    });
  }

  void _scrollToCurrentHour() {
    final cubit = context.read<WeatherDetailsBloc>();
    final currentHour = DateTime.now().hour;

    final hoursList = cubit.weatherData?.forecast?.forecastday?[0].hour ?? [];
    final currentHourIndex = hoursList.indexWhere(
      (hour) => DateTime.parse(hour.time ?? '').hour == currentHour,
    );

    if (currentHourIndex != -1) {
      _scrollController.animateTo(
        currentHourIndex * 77.w,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherDetailsBloc>();
    return Flexible(
      child: BlocBuilder<WeatherDetailsBloc, WeatherDetailsState>(
        builder: (context, state) {
          return ListView.builder(
            controller: _scrollController,
            itemCount:
                cubit.weatherData?.forecast?.forecastday?[0].hour?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => HourlyForecastItem(
              hour: cubit.weatherData?.forecast?.forecastday?[0].hour?[index],
            ),
          );
        },
      ),
    );
  }
}

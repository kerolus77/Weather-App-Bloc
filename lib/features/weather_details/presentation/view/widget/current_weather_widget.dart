import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:weather_app/core/presentation/view/widget/custom_image_view.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_strings.dart';

import '../../../../../core/themes/text_styles.dart';
import '../../view_model/cubit/Weather_details_cubit.dart';
import 'weather_info_item.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherDetailsCubit>();
    return BlocBuilder<WeatherDetailsCubit, WeatherDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                cubit.weatherData?.location?.name ?? '',
                style: AppTextStyle.font24BlackW700
                    .copyWith(color: AppColors.primary),
              ),
              8.height,
              Text(
                cubit.showWeatherData?.condition?.text ?? '',
                style: AppTextStyle.font18PrimaryW700,
              ),
              8.height,
              Text(
                '${cubit.showWeatherData?.tempC}°',
                style: AppTextStyle.font28PrimaryW700,
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WeatherInfoItem(
                          label: AppStrings.avgTemp,
                          value: cubit.weatherData?.forecast?.forecastday?[0]
                                  .day?.avgtempC
                                  .toString() ??
                              ''),
                      WeatherInfoItem(
                          label: AppStrings.maxTemp,
                          value: cubit.weatherData?.forecast?.forecastday?[0]
                                  .day?.maxtempC
                                  .toString() ??
                              ''),
                      WeatherInfoItem(
                          label: AppStrings.minTemp,
                          value: cubit.weatherData?.forecast?.forecastday?[0]
                                  .day?.mintempC
                                  .toString() ??
                              ''),
                      WeatherInfoItem(
                          label: AppStrings.humidity,
                          value: cubit.showWeatherData?.humidity.toString()??''),
                      WeatherInfoItem(
                          label: AppStrings.pressure,
                          value: cubit.showWeatherData?.pressureMb.toString()??''),
                      WeatherInfoItem(
                          label: AppStrings.wind,
                          value: cubit.showWeatherData?.windKph.toString()??''),
                      WeatherInfoItem(
                          label: AppStrings.visible,
                          value: cubit.weatherData?.forecast?.forecastday?[0]
                                  .day?.avgvisKm
                                  .toString() ??
                              ''),
                    ],
                  ),
                  CustomImageView(
                    url: "https:${cubit.showWeatherData?.condition?.icon ?? ''}",
                    height: 100.h,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:weather_app/core/presentation/view/widget/custom_image_view.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/assets.dart';
import 'package:weather_app/features/weather_details/presentation/view_model/cubit/Weather_details_cubit.dart';

import '../../../../core/presentation/view/widget/custom_app_bar.dart';
import '../../../../core/utils/app_strings.dart';
import 'widget/current_weather_widget.dart';
import 'widget/hourly_forecast_list.dart';
import 'widget/weather_details_shimmer.dart';

class WeatherDetailsScreen extends StatefulWidget {
  const WeatherDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  @override
  void initState() {
    context.read<WeatherDetailsCubit>().getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherDetailsCubit>();
    return BlocBuilder<WeatherDetailsCubit, WeatherDetailsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: getWeatherColor(context
                  .read<WeatherDetailsCubit>()
                  .showWeatherData
                  ?.condition
                  ?.text ??
              ''),
          appBar: CustomAppBar(
            title: AppStrings.appName,
          ),
          body: SafeArea(
            child: cubit.weatherData == null &&
                    state is GetWeatherDetailsLoadingState
                ? const WeatherDetailsShimmer()
                : cubit.weatherData == null
                    ? NoDataWidget(
                        title: AppStrings.noData,
                        imageWidget: CustomImageView(
                          svgPath: Assets.svgNoData,
                        ),
                        onRetry: () => finish(context),
                      )
                    : Column(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: CurrentWeatherWidget(),
                          ),
                          const HourlyForecastList(),
                        ],
                      ),
          ),
        );
      },
    );
  }

  Color getWeatherColor(String condition) {
    print('condition: $condition');
    switch (condition.toLowerCase().trim()) {
      case 'sunny':
        return AppColors.yellow;
      case 'moderate rain at times':
        return AppColors.grayShade800;
      case 'partly cloudy':
        return AppColors.blueGrey;
      case 'clear':
        return AppColors.lightBlue;
      case 'patchy rain nearby':
        return AppColors.darkGrey;
      case 'patchy light snow':
        return AppColors.whiteColor;
      case 'overcast':
        return AppColors.lightRed;

      default:
        return AppColors.whiteColor;
    }
  }
}

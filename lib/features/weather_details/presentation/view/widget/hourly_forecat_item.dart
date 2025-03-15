import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:weather_app/core/presentation/view/widget/custom_image_view.dart';
import 'package:weather_app/core/themes/text_styles.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/weather_response_model/hour.dart';
import '../../view_model/bloc/weather_details_bloc.dart';

class HourlyForecastItem extends StatelessWidget {
  final Hour? hour;

  const HourlyForecastItem({Key? key, required this.hour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected =
        context.read<WeatherDetailsBloc>().showWeatherData == hour;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(21),
          topRight: Radius.circular(21),
        ),
        border: Border.all(
          color: isSelected
              ? AppColors.primary
              : Colors.transparent, // Green border if selected
          width: 3.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(hour?.time.splitAfter(' ') ?? '',
              style: AppTextStyle.font16RedW500),
          6.height,
          Text(
            '${hour?.tempC}°',
            style: AppTextStyle.font16RedW500,
          ),
          6.height,
          CustomImageView(
            url: "https:${hour?.condition?.icon ?? ''}",
          ),
          6.height,
          Text(
            hour?.condition?.text ?? '',
            style: AppTextStyle.font16RedW500,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).onTap(() {
      context
          .read<WeatherDetailsBloc>()
          .add(ShowHourlyForecastDetailsEvent(hour: hour));
    });
  }
}

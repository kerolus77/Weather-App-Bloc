import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:weather_app/core/presentation/view/widget/custom_app_shimmer.dart';
import 'package:weather_app/core/utils/app_colors.dart';

class WeatherDetailsShimmer extends StatelessWidget {
  const WeatherDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              CustomAppShimmer(
                width: 100.w,
                height: 30.h,
              ),
              6.height,
              CustomAppShimmer(
                width: 150.w,
                height: 30.h,
              ),
              6.height,
              CustomAppShimmer(
                width: 100.w,
                height: 30.h,
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomAppShimmer(
                        width: 70.w,
                        height: 30.h,
                      ),
                      6.height,
                      CustomAppShimmer(
                        width: 100.w,
                        height: 30.h,
                      ),
                      6.height,
                      CustomAppShimmer(
                        width: 100.w,
                        height: 30.h,
                      ),
                      6.height,
                      CustomAppShimmer(
                        width: 70.w,
                        height: 30.h,
                      ),
                      6.height,
                      CustomAppShimmer(
                        width: 100.w,
                        height: 30.h,
                      ),
                    ],
                  ),
                  CustomAppShimmer(
                    width: 100.w,
                    height: 100.w,
                  )
                ],
              ).paddingSymmetric(horizontal: 16.w),
            ],
          ),
        ),

        // Hourly forecast
        Expanded(
          flex: 1,
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => 8.width,
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomAppShimmer(
                child: Container(
                  width: 120.w,
                  height: 150.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:weather_app/core/helpers/extensions.dart';

import '../../../../../core/config/app_router.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../view_model/search/search_bloc.dart';
import '../../view_model/search/search_state.dart';
import 'search_shimmer.dart';

class SearchCities extends StatelessWidget {
  const SearchCities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchMyCitySuccessfullyState) {
          return ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => 8.height,
              itemCount: state.cities.length,
              itemBuilder: (context, index) {
                return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.lightGreyColor,
                    ),
                    child: Row(
                      children: [
                        Text(
                          state.cities[index].name ?? "",
                          style: AppTextStyle.font18BlackW700.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary),
                        ),
                        Text(
                          ' (${state.cities[index].country ?? ""})',
                          style:
                              AppTextStyle.font16BlackWithOpacityW400.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )).onTap(() {
                  context.pushNamed(AppRouting.weatherDetailsScreen,
                      arguments: state.cities[index].name);
                });
              });
        } else if (state is SearchMyCitySuccessfullyEmptyState) {
          return Center(
            child: Text(AppStrings.thereIsNoDataTryToSearchByCityName,
                style: AppTextStyle.font20RedW500),
          );
        } else if (state is SearchMyCityLoadingState) {
          return SearchShimmer();
        }
        return Center(
          child: Text(AppStrings.thereIsNoDataTryToSearchByCityName,
              style: AppTextStyle.font20RedW500),
        );
      },
    );
  }
}

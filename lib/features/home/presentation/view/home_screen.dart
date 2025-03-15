import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:weather_app/core/config/app_router.dart';
import 'package:weather_app/core/helpers/extensions.dart';
import 'package:weather_app/core/presentation/view/widget/custom_app_bar.dart';
import 'package:weather_app/core/presentation/view/widget/custom_image_view.dart';
import 'package:weather_app/core/presentation/view/widget/custom_text_field.dart';
import 'package:weather_app/core/utils/app_strings.dart';

import '../../../../core/utils/assets.dart';
import '../view_model/search/search_bloc.dart';
import '../view_model/search/search_event.dart';
import 'widget/search_cities.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.appName,
        onButtonTap: () =>
            FocusScope.of(context).requestFocus(searchBloc.searchFocusNode),
      ),
      body: Column(
        children: [
          CustomTextFormField(
            onSubmit: (value) {
              context.pushNamed(AppRouting.weatherDetailsScreen,
                  arguments: value);
            },
            focusNode: searchBloc.searchFocusNode,
            onChanged: (value) => searchBloc.add(SearchEvent(text: value)),
            textInputType: TextInputType.text,
            controller: searchBloc.searchController,
            validator: (d) {
              if (d!.isEmpty) {
                return AppStrings.enterCityName;
              }
            },
            hintText: AppStrings.enterCityName,
            name: AppStrings.cityName,
            prefixIcon: CustomImageView(
              svgPath: Assets.svgBuildings,
            ).paddingAll(8),
          ),
          20.height,
          SearchCities(),
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}

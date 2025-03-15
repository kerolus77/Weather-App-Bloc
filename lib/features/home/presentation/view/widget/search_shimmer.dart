import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../core/presentation/view/widget/custom_app_shimmer.dart';
import '../../../../../core/utils/app_colors.dart';

class SearchShimmer extends StatelessWidget {
  const SearchShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => 8.height,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomAppShimmer(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.lightGreyColor,
            ),
          ));
        });
  }
}

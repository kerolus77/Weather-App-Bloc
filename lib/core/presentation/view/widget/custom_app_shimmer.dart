import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_colors.dart';

class CustomAppShimmer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double? borderRaduis;

  const CustomAppShimmer(
      {super.key, this.child, this.borderRaduis, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 2000),
      baseColor: AppColors.greyColor,
      highlightColor: AppColors.whiteColor,
      child: child ??
          Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRaduis ?? 21.r),
                color: AppColors.greyColor,
              ),
              child: child),
    );
  }
}

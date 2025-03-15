import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/app_colors.dart';

class CustomSearchButton extends StatelessWidget {
  final Function()? onTap;
  const CustomSearchButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
      color: AppColors.primary,
      size: 20.w,
    ).onTap(() => onTap == null ? finish(context) : onTap!);
  }
}

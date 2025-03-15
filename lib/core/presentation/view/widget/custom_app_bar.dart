import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../themes/text_styles.dart';
import '../../../utils/app_colors.dart';
import 'custom_search_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? action;
  final Widget? leading;
  final TextStyle? style;
  final Function()? onButtonTap;
  final Widget? widget;
  final Color? backgroundColor;
  final double? leadingWidth;
  final double? height;
  const CustomAppBar(
      {super.key,
      this.style,
      this.title,
      this.action,
      this.leading,
      this.widget,
      this.backgroundColor,
      this.onButtonTap,
      this.height,
      this.leadingWidth});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        forceMaterialTransparency: true,
        scrolledUnderElevation: 0,
        backgroundColor: backgroundColor ?? AppColors.whiteColor,
        actions: [
          action ??
              CustomSearchButton(
                onTap: onButtonTap,
              )
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        leadingWidth: leadingWidth,
        leading: leading?.animate().flipH() ?? const SizedBox.shrink(),
        title: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
            width: 135.w,
            child: widget ??
                Text(
                  title ?? "",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: style ?? AppTextStyle.font18PrimaryW700,
                ),
          ),
        )).paddingSymmetric(vertical: 8.h, horizontal: 24.w);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, height ?? 60.h);
}

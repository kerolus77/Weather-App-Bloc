import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../themes/text_styles.dart';
import '../../../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? name;
  final FocusNode? focusNode;
  final Function(dynamic)? onSubmit;
  final TextInputType textInputType;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final int? minLines;
  final int? maxLines;
  final bool showName;
  final String hintText;
  final Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    this.name,
    this.onSubmit,
    this.focusNode,
    required this.textInputType,
    required this.controller,
    this.textInputAction,
    required this.validator,
    this.readOnly,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.minLines,
    this.maxLines,
    this.onChanged,
    this.showName = false,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: readOnly ?? false,
      child: TextFormField(
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        readOnly: readOnly ?? false,
        textAlign: TextAlign.start,
        minLines: minLines ?? 1,
        maxLines: maxLines ?? 1,
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText ?? false,
        style: AppTextStyle.font14BlackW400,
        cursorColor: AppColors.primary,
        obscuringCharacter: '●',
        decoration: InputDecoration(
          errorMaxLines: 3,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16),
          alignLabelWithHint: true,
          labelText: showName ? null : name,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          hintText: hintText,
          hintStyle: AppTextStyle.font16BlackWithOpacityW400,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          floatingLabelStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle: AppTextStyle.font12errorW500,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(21.r),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 1.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(21.r),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 1.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(21.r),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 1.5.w,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(21.r),
            borderSide: BorderSide(
              color: AppColors.error,
              width: 1.w,
            ),
          ),
        ),
        keyboardType: textInputType,
        textInputAction: textInputAction,
        validator: validator,
      ),
    );
  }
}

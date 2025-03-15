import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:weather_app/core/helpers/extensions.dart';
import 'package:weather_app/core/utils/assets.dart';

import '../../../../core/config/app_router.dart';
import '../../../../core/presentation/view/widget/custom_image_view.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToNextScreen();
    });
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    context.pushReplacementNamed(AppRouting.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomImageView(
              imagePath: Assets.imagesLogo,
              width: 200.w,
            ).animate().move(
                  duration: 700.ms,
                  curve: Curves.ease,
                  transformHitTests: false,
                  begin: const Offset(0, -500),
                  end: const Offset(0, 0),
                ),
          ),
          10.height,
          Center(
              child: Text(
            AppStrings.appName,
            style: AppTextStyle.font24BlackW700,
          ).animate().move(
                    duration: 700.ms,
                    curve: Curves.ease,
                    transformHitTests: false,
                    begin: const Offset(0, 500),
                    end: const Offset(0, 0),
                  )),
        ],
      ),
    );
  }
}

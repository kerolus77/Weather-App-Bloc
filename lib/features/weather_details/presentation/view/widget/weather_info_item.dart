import 'package:flutter/material.dart';

import '../../../../../core/themes/text_styles.dart';

class WeatherInfoItem extends StatelessWidget {
  final String label;
  final String value;

  const WeatherInfoItem({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text('$label: ',
              style: AppTextStyle.font20RedW500.copyWith(
                fontSize: 14,
              )),
          Text(value,
              style: AppTextStyle.font20RedW500.copyWith(
                fontSize: 14,
              )),
        ],
      ),
    );
  }
}

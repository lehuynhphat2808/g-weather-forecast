import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/ui/theme/app.text_styles.dart';

class BasicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;

  const BasicButton({super.key, required this.text, required this.backgroundColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(),
        minimumSize: Size.fromHeight(50.h),
      ),
      child: Text(text, style: AppTextStyles.buttonText),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/ui/theme/app.text_styles.dart';

class InputTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const InputTextFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 383.w,
      height: 52.h,
      child: TextField(
        controller: controller,
        style: AppTextStyles.inputText,
        decoration: InputDecoration(hintText: AppLocalizations.of(context)?.search_weather_hint_text ?? ''),
      ),
    );
  }
}

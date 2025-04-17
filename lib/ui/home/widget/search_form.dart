import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/ui/widget/input_text_form_field.dart';

class SearchForm extends StatelessWidget {
  SearchForm({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)?.search_weather_title ?? '', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 9.h),
        InputTextFormField(controller: _searchController),
        SizedBox(height: 22.h),
      ],
    );
  }
}

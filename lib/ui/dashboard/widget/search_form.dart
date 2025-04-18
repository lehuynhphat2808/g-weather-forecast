import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/di_locator.dart';
import 'package:g_weather_forecast/ui/widget/basic_button.dart';
import 'package:g_weather_forecast/ui/widget/input_text_form_field.dart';
import 'package:messages/weather/get_weather.request.dart';
import 'package:queries/weather/get_weather_query.handler.dart';

class SearchForm extends StatelessWidget {
  SearchForm({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)?.search_weather_form_title ?? '',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: 9.h),
        InputTextFormField(controller: _searchController),
        SizedBox(height: 22.h),
        BasicButton(
          onPressed: () async {
            print(_searchController.text);
            final result = await getIt<GetWeatherQueryHandler>().handle(
              GetWeatherRequest(locationName: _searchController.text),
            );
            result.fold(
              (left) {
                print('left: ${left.detail}');
              },
              (right) {
                print('right: ${right.current?.toJson()}');
              },
            );
          },
          text: AppLocalizations.of(context)?.search_weather_form_button_search_text ?? '',
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                AppLocalizations.of(context)?.search_weather_form_or ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).dividerColor),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: 16.h),
        BasicButton(
          onPressed: () {},
          text: AppLocalizations.of(context)?.search_weather_form_button_use_current_location_text ?? '',
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:g_weather_forecast/ui/theme/app.text_styles.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(AppLocalizations.of(context)?.search_form_title ?? '', style: Theme.of(context).textTheme.titleSmall)],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/bloc/email/email_bloc.dart';
import 'package:g_weather_forecast/bloc/weather/weather_bloc.dart';
import 'package:g_weather_forecast/ui/widget/basic_button.dart';
import 'package:g_weather_forecast/ui/widget/basic_form_with_otp.dart';
import 'package:g_weather_forecast/ui/widget/input_text_form_field.dart';
import 'package:messages/email/register.request.dart';
import 'package:messages/email/unsubscribe.request.dart';
import 'package:messages/weather/get_weather.request.dart';

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
          onPressed: () {
            context.read<WeatherBloc>().add(
              OnGettingWeatherEvent(GetWeatherRequest(locationName: _searchController.text)),
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
        SizedBox(height: 30.h),
        Text(
          AppLocalizations.of(context)?.dashboard_receive_email_notification ?? '',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: BasicButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text(AppLocalizations.of(context)?.dashboard_register ?? ''),
                          content: BlocBuilder(
                            bloc: context.read<EmailBloc>(),
                            builder: (context, state) {
                              if (state is LoadingRegisterState) {
                                return Center(child: CircularProgressIndicator());
                              } else if (state is ErrorRegisterState) {
                                return Center(child: Text(AppLocalizations.of(context)?.email_register_failed ?? ''));
                              }
                              return BasicFormWithOTP(
                                onSuccess: (email) {
                                  context.read<EmailBloc>().add(OnRegisteringEvent(RegisterRequest(email: email)));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(AppLocalizations.of(context)?.email_register_success ?? '')),
                                  );
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          ),
                        ),
                  );
                },
                text: AppLocalizations.of(context)?.dashboard_register ?? '',
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            Expanded(
              child: BasicButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text(AppLocalizations.of(context)?.dashboard_unsubscribe ?? ''),
                          content: Builder(
                            builder: (context) {
                              return BlocBuilder(
                                bloc: context.read<EmailBloc>(),
                                builder: (context, state) {
                                  if (state is LoadingRegisterState) {
                                    return Center(child: CircularProgressIndicator());
                                  } else if (state is ErrorRegisterState) {
                                    return Center(
                                      child: Text(AppLocalizations.of(context)?.email_unsubscribe_failed ?? ''),
                                    );
                                  }

                                  return BasicFormWithOTP(
                                    onSuccess: (email) {
                                      context.read<EmailBloc>().add(
                                        OnUnsubscribingEvent(UnsubscribeRequest(email: email)),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(AppLocalizations.of(context)?.email_unsubscribe_success ?? ''),
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                  );
                },
                text: AppLocalizations.of(context)?.dashboard_unsubscribe ?? '',
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

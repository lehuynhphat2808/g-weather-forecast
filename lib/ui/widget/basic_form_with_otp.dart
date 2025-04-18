import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_weather_forecast/bloc/email/email_bloc.dart';
import 'package:g_weather_forecast/ui/theme/app.text_styles.dart';
import 'package:messages/email/send_otp.request.dart';

class BasicFormWithOTP extends StatefulWidget {
  final void Function(String email) onSuccess;

  const BasicFormWithOTP({super.key, required this.onSuccess});

  @override
  State<BasicFormWithOTP> createState() => _BasicFormWithOTPState();
}

class _BasicFormWithOTPState extends State<BasicFormWithOTP> {
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _generatedOTP = '';

  String _generateOTP() {
    final rand = Random();
    return List.generate(6, (_) => rand.nextInt(10).toString()).join();
  }

  Future<void> _sendOTP() async {
    if (!_formKey.currentState!.validate()) return;
    _generatedOTP = _generateOTP();
    context.read<EmailBloc>().add(OnSendingOTPEvent(SendOTPRequest(email: _emailController.text, otp: _generatedOTP)));
  }

  void _verifyOTP() {
    if (_otpController.text.trim() == _generatedOTP) {
      widget.onSuccess(_emailController.text.trim());
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)?.email_incorrect_otp ?? '')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Form(
            key: _formKey,
            child: TextFormField(
              controller: _emailController,
              style: AppTextStyles.inputText,
              decoration: InputDecoration(hintText: AppLocalizations.of(context)?.email ?? ''),
              validator:
                  (value) =>
                      EmailValidator.validate(value ?? '') ? null : AppLocalizations.of(context)?.invalid_email ?? '',
            ),
          ),
          SizedBox(height: 12.h),
          BlocConsumer(
            listener: (context, state) {
              if (state is ErrorSentOTPState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)?.email_send_otp_failed ?? '')));
              }
              ;
            },
            bloc: context.read<EmailBloc>(),
            builder: (context, state) {
              return state is! SuccessSentOTPState
                  ? ElevatedButton(
                    onPressed: state is LoadingSentOTPState ? null : _sendOTP,
                    child:
                        state is LoadingSentOTPState
                            ? SizedBox(height: 12.w, width: 12.w, child: const CircularProgressIndicator())
                            : Text(AppLocalizations.of(context)?.send_otp ?? ''),
                  )
                  : Column(
                    children: [
                      TextField(
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: InputDecoration(labelText: AppLocalizations.of(context)?.enter_otp ?? ''),
                      ),
                      SizedBox(height: 8.h),
                      ElevatedButton(
                        onPressed: _verifyOTP,
                        child: Text(AppLocalizations.of(context)?.verify_and_subscribe ?? ''),
                      ),
                    ],
                  );
            },
          ),
        ],
      ),
    );
  }
}

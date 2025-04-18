import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  bool _isOTPSent = false;
  String _generatedOTP = '';
  bool _isLoading = false;

  String _generateOTP() {
    final rand = Random();
    return List.generate(6, (_) => rand.nextInt(10).toString()).join();
  }

  Future<void> _sendOTP() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
    });
    _generatedOTP = _generateOTP();
    context.read<EmailBloc>().add(OnSendingOTPEvent(SendOTPRequest(email: _emailController.text, otp: _generatedOTP)));

    setState(() {
      _isOTPSent = true;
      _isLoading = false;
    });
  }

  void _verifyOTP() {
    if (_otpController.text.trim() == _generatedOTP) {
      widget.onSuccess(_emailController.text.trim());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Incorrect OTP.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Form(
          key: _formKey,
          child: TextFormField(
            controller: _emailController,
            style: AppTextStyles.inputText,
            decoration: const InputDecoration(hintText: 'Email'),
            validator: (value) => EmailValidator.validate(value ?? '') ? null : 'Invalid email',
          ),
        ),
        const SizedBox(height: 12),
        !_isOTPSent
            ? ElevatedButton(
              onPressed: _isLoading ? null : _sendOTP,
              child: _isLoading ? const CircularProgressIndicator() : const Text('Send OTP'),
            )
            : Column(
              children: [
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: const InputDecoration(labelText: 'Enter OTP'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(onPressed: _verifyOTP, child: const Text('Verify & Subscribe')),
              ],
            ),
      ],
    );
  }
}

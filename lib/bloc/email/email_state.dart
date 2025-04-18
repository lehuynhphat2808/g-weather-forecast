part of 'email_bloc.dart';

abstract class EmailState {
  const EmailState();
}

class EmailInitialState extends EmailState {}

// --------------------Start SentOTP States-------------------- //

class LoadingSentOTPState extends EmailState {}

class ErrorSentOTPState extends EmailState {
  final SendOTPErrorResponse sendOTPErrorResponse;

  ErrorSentOTPState(this.sendOTPErrorResponse);
}

class SuccessSentOTPState extends EmailState {
  final SendOTPResponse sendOTPResponse;

  SuccessSentOTPState({required this.sendOTPResponse});
}

// --------------------End Sent OTP States-------------------- //

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

// --------------------Start Unsubscribe States-------------------- //
class LoadingUnsubscribeState extends EmailState {}

class ErrorUnsubscribeState extends EmailState {
  final UnsubscribeErrorResponse unsubscribeErrorResponse;

  ErrorUnsubscribeState(this.unsubscribeErrorResponse);
}

class SuccessUnsubscribeState extends EmailState {
  final UnsubscribeResponse unsubscribeResponse;

  SuccessUnsubscribeState({required this.unsubscribeResponse});
}

class UnsubscribeInitialState extends EmailState {}

// --------------------End Unsubscribe States-------------------- //
// --------------------Start Register States-------------------- //
class LoadingRegisterState extends EmailState {}

class ErrorRegisterState extends EmailState {
  final RegisterErrorResponse registerErrorResponse;

  ErrorRegisterState(this.registerErrorResponse);
}

class SuccessRegisterState extends EmailState {
  final RegisterResponse registerResponse;

  SuccessRegisterState({required this.registerResponse});
}

class RegisterInitialState extends EmailState {}

// --------------------End Register States-------------------- //

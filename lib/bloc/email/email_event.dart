part of 'email_bloc.dart';

abstract class EmailEvent {
  const EmailEvent();
}

// On Sent OTP
class OnSendingOTPEvent extends EmailEvent {
  final bool isLoading;
  final SendOTPRequest sendOTPRequest;

  OnSendingOTPEvent(this.sendOTPRequest, {this.isLoading = true});
}

// On Unsubscribe
class OnUnsubscribingEvent extends EmailEvent {
  final bool isLoading;
  final UnsubscribeRequest unsubscribeRequest;

  OnUnsubscribingEvent(this.unsubscribeRequest, {this.isLoading = true});
}

// On Register
class OnRegisteringEvent extends EmailEvent {
  final bool isLoading;
  final RegisterRequest registerRequest;

  OnRegisteringEvent(this.registerRequest, {this.isLoading = true});
}

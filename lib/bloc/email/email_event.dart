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

// On Fetching Email By Saved Data
class OnGettingSavedEmailEvent extends EmailEvent {
  final bool isLoading;

  OnGettingSavedEmailEvent({this.isLoading = true});
}

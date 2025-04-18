import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_weather_forecast/di_locator.dart';
import 'package:messages/email/register.request.dart';
import 'package:messages/email/register.response.dart';
import 'package:messages/email/register_error.response.dart';
import 'package:messages/email/send_otp.request.dart';
import 'package:messages/email/send_otp.response.dart';
import 'package:messages/email/send_otp_error.response.dart';
import 'package:messages/email/unsubscribe.request.dart';
import 'package:messages/email/unsubscribe.response.dart';
import 'package:messages/email/unsubscribe_error.response.dart';
import 'package:queries/email/register.handler.dart';
import 'package:queries/email/send_otp.handler.dart';
import 'package:queries/email/unsubscribe.handler.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc() : super(EmailInitialState()) {
    on<OnSendingOTPEvent>(_onSendOTPEvent);
    on<OnUnsubscribingEvent>(_onUnsubscribingEvent);
    on<OnRegisteringEvent>(_onRegisteringEvent);
  }

  _onSendOTPEvent(OnSendingOTPEvent event, Emitter<EmailState> emitter) async {
    if (event.isLoading) {
      emitter(LoadingSentOTPState());
    }
    final result = await getIt<SendOTPQueryHandler>().handle(event.sendOTPRequest);
    await result.fold(
      (l) {
        emitter(ErrorSentOTPState(SendOTPErrorResponse(title: l.title, detail: l.detail, status: l.status)));
      },
      (r) async {
        emitter(SuccessSentOTPState(sendOTPResponse: r));
      },
    );
  }

  _onUnsubscribingEvent(OnUnsubscribingEvent event, Emitter<EmailState> emitter) async {
    if (event.isLoading) {
      emitter(LoadingUnsubscribeState());
    }
    final result = await getIt<UnsubscribeQueryHandler>().handle(event.unsubscribeRequest);
    await result.fold(
      (l) {
        emitter(ErrorUnsubscribeState(UnsubscribeErrorResponse(title: l.title, detail: l.detail, status: l.status)));
      },
      (r) async {
        emitter(SuccessUnsubscribeState(unsubscribeResponse: r));
      },
    );
  }

  _onRegisteringEvent(OnRegisteringEvent event, Emitter<EmailState> emitter) async {
    if (event.isLoading) {
      emitter(LoadingRegisterState());
    }
    final result = await getIt<RegisterQueryHandler>().handle(event.registerRequest);
    await result.fold(
      (l) {
        emitter(ErrorRegisterState(RegisterErrorResponse(title: l.title, detail: l.detail, status: l.status)));
      },
      (r) async {
        emitter(SuccessRegisterState(registerResponse: r));
      },
    );
  }
}

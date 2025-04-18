import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_weather_forecast/di_locator.dart';
import 'package:messages/email/send_otp.request.dart';
import 'package:messages/email/send_otp.response.dart';
import 'package:messages/email/send_otp_error.response.dart';
import 'package:queries/email/send_otp.handler.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc() : super(EmailInitialState()) {
    on<OnSendingOTPEvent>(_onSendOTPEvent);
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
}

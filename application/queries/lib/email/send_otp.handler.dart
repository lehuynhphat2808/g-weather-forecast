import 'package:application_base/request.handler.dart';
import 'package:domain/email/abstract.email.readable.repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:messages/abstract.error.response.dart';
import 'package:messages/email/send_otp.request.dart';
import 'package:messages/email/send_otp.response.dart';
import 'package:messages/email/send_otp_error.response.dart';

/// This class is a query handler for sent otp.
///
/// It implements the RequestHandler interface, which defines a handle method for processing requests.
/// The handle method takes a SendOTPRequest object as input and returns an Either object containing either an
/// AbstractErrorResponse or a SendOTPResponse object.
@injectable
class SendOTPQueryHandler extends RequestHandler<SendOTPRequest, SendOTPResponse> {
  final AbstractEmailReadableRepository emailReadableRepository;

  SendOTPQueryHandler(this.emailReadableRepository);

  @override
  Future<Either<AbstractErrorResponse, SendOTPResponse>> handle(SendOTPRequest request) async {
    final result = await emailReadableRepository.sendOTP(request);
    if (result.statusCode == 200) {
      return Right(SendOTPResponse());
    }
    return Left(SendOTPErrorResponse(
      title: result.reasonPhrase,
      status: result.statusCode,
      detail: result.body,
    ));
  }
}

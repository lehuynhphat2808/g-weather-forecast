import 'package:application_base/request.handler.dart';
import 'package:domain/email/abstract.email.readable.repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:messages/abstract.error.response.dart';
import 'package:messages/email/register.request.dart';
import 'package:messages/email/register.response.dart';
import 'package:messages/email/register_error.response.dart';

@injectable
class RegisterQueryHandler extends RequestHandler<RegisterRequest, RegisterResponse> {
  final AbstractEmailReadableRepository emailReadableRepository;

  RegisterQueryHandler(this.emailReadableRepository);

  @override
  Future<Either<AbstractErrorResponse, RegisterResponse>> handle(RegisterRequest request) async {
    final result = await emailReadableRepository.register(request);
    if (result.statusCode == 200) {
      return Right(RegisterResponse());
    }
    return Left(RegisterErrorResponse(
      title: result.reasonPhrase,
      status: result.statusCode,
      detail: result.body,
    ));
  }
}

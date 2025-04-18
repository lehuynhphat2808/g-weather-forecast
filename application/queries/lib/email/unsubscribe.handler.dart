import 'package:application_base/request.handler.dart';
import 'package:domain/email/abstract.email.readable.repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:messages/abstract.error.response.dart';
import 'package:messages/email/unsubscribe.request.dart';
import 'package:messages/email/unsubscribe.response.dart';
import 'package:messages/email/unsubscribe_error.response.dart';

@injectable
class UnsubscribeQueryHandler extends RequestHandler<UnsubscribeRequest, UnsubscribeResponse> {
  final AbstractEmailReadableRepository emailReadableRepository;

  UnsubscribeQueryHandler(this.emailReadableRepository);

  @override
  Future<Either<AbstractErrorResponse, UnsubscribeResponse>> handle(UnsubscribeRequest request) async {
    final result = await emailReadableRepository.unsubscribe(request);
    if (result.statusCode == 200) {
      return Right(UnsubscribeResponse());
    }
    return Left(UnsubscribeErrorResponse(
      title: result.reasonPhrase,
      status: result.statusCode,
      detail: result.body,
    ));
  }
}

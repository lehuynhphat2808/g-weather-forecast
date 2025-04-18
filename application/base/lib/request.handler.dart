import 'package:either_dart/either.dart';
import 'package:messages/abstract.error.response.dart';

// RequestHandler is an abstract class that defines a method for handling requests.
// It takes two type parameters:
// - TRequest: The type of the request object.
// - TResponse: The type of the response object.
// The handle method takes a request object as input and returns a Future that resolves to either an error response or a response object.
abstract class RequestHandler<TRequest, TResponse> {
  Future<Either<AbstractErrorResponse, TResponse>> handle(TRequest request);
}

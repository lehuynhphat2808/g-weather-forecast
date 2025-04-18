import 'package:http/http.dart' as http;
import 'package:messages/email/register.request.dart';
import 'package:messages/email/send_otp.request.dart';
import 'package:messages/email/unsubscribe.request.dart';

abstract class AbstractEmailReadableRepository {
  /// send otp
  Future<http.Response> sendOTP(SendOTPRequest request);

  /// register
  Future<http.Response> register(RegisterRequest request);

  /// unsubscribe
  Future<http.Response> unsubscribe(UnsubscribeRequest request);
}

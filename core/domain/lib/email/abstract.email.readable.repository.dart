import 'package:http/http.dart' as http;
import 'package:messages/email/send_otp.request.dart';

abstract class AbstractEmailReadableRepository {
  /// send otp
  Future<http.Response> sendOTP(SendOTPRequest request);
}

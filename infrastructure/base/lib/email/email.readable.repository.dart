import 'dart:convert';

import 'package:domain/email/abstract.email.readable.repository.dart';
import 'package:http/http.dart' as http;
import 'package:infrastructure_base/email_context.dart';
import 'package:infrastructure_base/x_helper/endpoint.constant.dart';
import 'package:injectable/injectable.dart';
import 'package:messages/email/register.request.dart';
import 'package:messages/email/send_otp.request.dart';
import 'package:messages/email/unsubscribe.request.dart';

@Injectable(as: AbstractEmailReadableRepository)
class EmailReadableRepository implements AbstractEmailReadableRepository {
  final EmailContext emailContext = EmailContext();
  final http.Client client = http.Client();

  EmailReadableRepository();

  @override
  Future<http.Response> sendOTP(SendOTPRequest request) async {
    final url = Uri.parse('${emailContext.endpoint}/${EndpointConstant.sendOtp}');

    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode(request.toJson());

    final response = await client.post(url, headers: headers, body: body);

    return response;
  }

  @override
  Future<http.Response> register(RegisterRequest request) async {
    final url = Uri.parse('${emailContext.endpoint}/${EndpointConstant.subscribe}');

    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode(request.toJson());

    final response = await client.post(url, headers: headers, body: body);

    return response;
  }

  @override
  Future<http.Response> unsubscribe(UnsubscribeRequest request) async {
    final url = Uri.parse('${emailContext.endpoint}/${EndpointConstant.unsubscribe}');

    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode(request.toJson());

    final response = await client.post(url, headers: headers, body: body);

    return response;
  }
}

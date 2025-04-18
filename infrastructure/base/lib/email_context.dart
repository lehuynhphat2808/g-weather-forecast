import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@injectable
class EmailContext {
  String _endpoint = dotenv.get('EMAIL_API_URL');

  String get endpoint => _endpoint;

  set endpoint(String value) {
    _endpoint = value;
  }
}

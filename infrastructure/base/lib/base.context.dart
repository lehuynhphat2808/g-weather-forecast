import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@injectable
class BaseContext {
  String _endpoint = dotenv.get('API_URL');
  String _apiKey = dotenv.get('API_KEY');

  String get endpoint => _endpoint;

  set endpoint(String value) {
    _endpoint = value;
  }

  String get apiKey => _apiKey;

  set apiKey(String value) {
    _apiKey = value;
  }
}

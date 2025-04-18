import 'dart:async';
import 'dart:io';

import 'package:core_base/abstract.writeable.repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infrastructure_base/xfw.context.dart';

/// A repository that provides methods for adding, updating, and deleting data.
class WriteableRepository implements AbstractWriteableRepository {
  final XFWContext context;
  final http.Client client = http.Client();

  WriteableRepository(this.context);

  @override

  /// Adds a new resource to the repository.
  ///
  /// [endPoint] The endpoint to send the request to.
  /// [body] The body of the request.
  ///
  /// Returns a [http.Response] object containing the response from the server.
  Future<http.Response> add<T>(String endPoint, T body) async {
    final url = '${context.endpoint}/$endPoint';
    return await client.post(
      Uri.parse(url),
      body: body,
      headers: await getHeaders(),
    );
  }

  /// Updates an existing resource in the repository.
  ///
  /// [endPoint] The endpoint to send the request to.
  /// [body] The body of the request.
  ///
  /// Returns a [http.Response] object containing the response from the server.
  @override
  Future<http.Response> update<T>(String endPoint, T body) async {
    final url = '${context.endpoint}/$endPoint';
    return await client.put(
      Uri.parse(url),
      body: body,
      headers: await getHeaders(),
    );
  }

  /// Deletes a resource from the repository.
  ///
  /// [endPoint] The endpoint to send the request to.
  @override
  Future<http.Response> delete<T>(String endPoint, T body) async {
    final url = '${context.endpoint}/$endPoint';
    return await client.delete(
      Uri.parse(url),
      headers: await getHeaders(),
      body: body,
    );
  }

  void close() {
    // Close the client when it is no longer needed.
    client.close();
  }

  /// Returns a map of headers to be used in the request.
  ///
  /// By default, the headers include the content type and accept headers.
  @protected
  Future<Map<String, String>> getHeaders([Map<String, String>? additionalHeaders]) async {
    final defaultHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.userAgentHeader: 'Mobile',
    };
    if (additionalHeaders != null) {
      defaultHeaders.addAll(additionalHeaders);
    }
    return defaultHeaders;
  }
}

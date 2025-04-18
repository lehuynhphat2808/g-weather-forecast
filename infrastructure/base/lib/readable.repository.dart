import 'dart:async';
import 'dart:io';

import 'package:core_base/abstract.readable.repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infrastructure_base/base.context.dart';

/// A repository that provides read operations for entities.
class ReadableRepository implements AbstractReadableRepository {
  final BaseContext context;
  final http.Client client = http.Client();

  ReadableRepository({required this.context});

  /// Finds an entity by its ID.
  ///
  /// [endPoint] The endpoint of the entity.
  /// [id] The ID of the entity.
  ///
  /// Returns a [Future] that resolves to the entity if found, otherwise throws an exception.
  @override
  Future<http.Response> findById(String endPoint, String id) async {
    final url = '${context.endpoint}/$endPoint?Id=$id';
    return await client.get(Uri.parse(url), headers: await getHeaders());
  }

  /// Finds all entities.
  ///
  /// [endPoint] The endpoint of the entity.
  ///
  /// Returns a [Future] that resolves to a list of entities.
  @override
  Future<http.Response> findAll(String endPoint) async {
    final url = '${context.endpoint}/$endPoint&key=${context.apiKey}';
    return await client.get(Uri.parse(url), headers: await getHeaders());
  }

  /// Finds entities based on the provided body.
  ///
  /// [endPoint] The endpoint of the entity.
  /// [body] The body of the request.
  /// [options] Optional parameters for the request.
  ///
  /// Returns a [Future] that resolves to a list of entities.
  @override
  Future<http.Response> findInAll<T>(String endPoint, T body, [Map<String, dynamic>? options]) async {
    final url = '${context.endpoint}/$endPoint';
    return await client.post(
      Uri.parse(url),
      body: body,
      headers: {
        ...?await getHeaders(),
        ...?options,
      },
    );
  }

  /// Closes the HTTP client.
  void close() {
    client.close();
  }

  /// Gets the headers for the HTTP request.
  ///
  /// Returns a [Future] that resolves to a map of headers.
  ///
  /// By default, it includes content-type and accept headers for JSON.
  @protected
  Future<Map<String, String>?> getHeaders() async {
    return {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.userAgentHeader: 'Mobile',
    };
  }
}

import 'dart:async';

import 'package:http/http.dart' as http;

/// This abstract class defines the methods for reading data from a data source.
abstract class AbstractReadableRepository {
  /// Finds an entity by its ID.
  ///
  /// [endPoint] The endpoint to make the request to.
  /// [id] The ID of the entity to find.
  ///
  /// Returns a `Future<http.Response>` containing the response from the data source.
  Future<http.Response> findById(String endPoint, String id);

  /// Finds all entities.
  ///
  /// [endPoint] The endpoint to make the request to.
  ///
  /// Returns a `Future<http.Response>` containing the response from the data source.
  Future<http.Response> findAll(String endPoint);

  /// Finds entities based on a search query within all entities.
  ///
  /// [endPoint] The endpoint to make the request to.
  /// [body] The search criteria for the query.
  /// [options] Optional parameters for the request.
  ///
  /// Returns a `Future<http.Response>` containing the response from the data source.
  Future<http.Response> findInAll<T>(String endPoint, T body, [Map<String, dynamic>? options]);
}

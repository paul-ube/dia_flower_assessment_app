import 'dart:convert';
import 'dart:io';

import 'package:dia_flowers_assessment/app/app.logger.dart';
import 'package:dia_flowers_assessment/exceptions/api_exception.dart';
import 'package:dia_flowers_assessment/model/product/product.dart';
import 'package:dia_flowers_assessment/model/product_details/product_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum _HttpMethod { get, post, put, delete }

class Api {
  final log = getLogger('Api');

  late final Dio _httpClient;

  Api() {
    _httpClient = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: dotenv.get('Api_endpoint'),
      ),
    );
  }

  Future<List<Product>> fetchProducts({
    required String lang,
    required int limit,
    required int offset,
  }) async {
    var allProducts = <Product>[];

    final response = await _makeHttpRequest(
      method: _HttpMethod.get,
      path: '/index.php',
      queryParameters: {
        'action': 'all',
        'lang': lang,
        'limit': limit,
        'offset': offset,
      },
    );

    if (response.statusCode != 200) {
      log.e(response.statusMessage);
      return Future.error(Exception(response.statusMessage));
    }

    var parsed = json.decode(response.data) as List<dynamic>;

    if (parsed.isEmpty) return allProducts;

    for (var product in parsed) {
      allProducts.add(Product.fromJson(product));
    }

    return allProducts;
  }

  Future<ProductDetails> fetchProductDetails({
    required String id,
    required String lang,
  }) async {
    // FormData formData = FormData.fromMap({
    //   'action': 'detail',
    //   'id': id,
    //   'lang': lang,
    // });

    final response = await _makeHttpRequest(
      method: _HttpMethod.get,
      path: '/index.php',
      queryParameters: {'action': 'detail', 'id': id, 'lang': lang},
      // body: formData,
    );

    if (response.statusCode != 200) {
      log.e(response.statusMessage);
      return Future.error(Exception(response.statusMessage));
    }

    return ProductDetails.fromJson(json.decode(response.data));
  }

  Future<Response> _makeHttpRequest({
    required _HttpMethod method,
    required String path,
    Map<String, dynamic> queryParameters = const {},
    Object? body,
    bool verbose = false,
    bool verboseResponse = false,
    Options? options,
  }) async {
    try {
      final response = await _sendRequest(
        method: method,
        path: path,
        queryParameters: queryParameters,
        body: body,
        options: options,
      );

      final statusText = 'Status Code: ${response.statusCode}';
      final responseText = 'Response Data: ${response.data}';

      if (verbose) {
        log.v('$statusText${verboseResponse ? responseText : ''}');
      }

      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown && e.error is SocketException) {
        log.e(
          'There seems to be a network issue. Please check your network and try again.',
        );
        throw ApiException(
          message:
              'There seems to be a network issue. Please check your network and try again.',
        );
      }

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        log.e(
          'There seems to be a network issue. Please check your network and try again.',
        );
        throw ApiException(
          message:
              'There seems to be a network issue. Please check your network and try again.',
          // devDetails: e.toString(),
        );
      }
      log.e(
        'A response error occurred. ${e.response?.statusCode}\nERROR: ${e.message}',
      );
      throw ApiException(
        message:
            'A response error occurred. ${e.response?.statusCode}\nERROR: ${e.message}',
      );
    } catch (e) {
      log.e('Request to $path failed. Error details: $e');

      throw ApiException(message: 'Request failed. Error details: $e');
    }
  }

  Future<Response> _sendRequest({
    required _HttpMethod method,
    required String path,
    Map<String, dynamic> queryParameters = const {},
    Object? body,
    Options? options,
  }) async {
    Response response;

    switch (method) {
      case _HttpMethod.post:
        response = await _httpClient.post(
          path,
          queryParameters: queryParameters,
          data: body,
          options: options,
        );
        break;
      case _HttpMethod.put:
        response = await _httpClient.put(
          path,
          queryParameters: queryParameters,
          data: body,
          options: options,
        );
        break;
      case _HttpMethod.delete:
        response = await _httpClient.delete(
          path,
          queryParameters: queryParameters,
          options: options,
        );
        break;
      case _HttpMethod.get:
        response = await _httpClient.get(
          path,
          queryParameters: queryParameters,
          options: options,
        );
    }

    return response;
  }
}

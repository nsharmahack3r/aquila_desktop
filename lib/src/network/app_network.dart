import 'dart:developer';

import 'package:aquila/src/common/providers/providers.dart';
import 'package:aquila/src/constants/event_messages.dart';
import 'package:aquila/src/constants/log_lables.dart';
import 'package:aquila/src/core/failure.dart';
import 'package:aquila/src/core/request_types.dart';
import 'package:aquila/src/core/types.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final networkProvider = Provider(
    (ref) => AppNetwork(authToken: ref.watch(authTokenProvider) ?? ''));

class AppNetwork {
  final String _authToken;
  late final Map<String, String> _headers;

  AppNetwork({required String authToken}) : _authToken = authToken {
    _headers = {
      'Authorization': _authToken,
      'Content-Type': "application/json",
    };
  }

  final _dio = Dio();

  FutureEither<Response> getRequest({
    required String url,
    dynamic headers,
    bool requireAuth = true,
  }) async {
    try {
      final response = await _dio.get(
        url,
        options: Options(headers: headers ?? _headers),
      );
      _printRequest(
          url: url,
          type: RequestType.GET,
          response: response,
          headers: headers ?? _headers);
      return Right(response);
    } catch (e) {
      _printRequest(
          url: url, type: RequestType.GET, headers: headers ?? _headers);

      if (e is DioException) {
        final response = e.response;
        if (response != null) {
          final message = response.data['message'];
          if (kDebugMode) {
            print(message);
          }
          return Left(Failure(message: message));
        }
      }
      return Left(Failure(message: EventMessages.GET_REQUEST_FAIL_MESSAGE));
    }
  }

  FutureEither<Response> deleteRequest({
    required String url,
    dynamic headers,
    dynamic body,
    bool requireAuth = true,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        options: Options(headers: headers ?? _headers),
        data: body,
      );
      _printRequest(
          url: url,
          type: RequestType.DELETE,
          response: response,
          headers: headers ?? _headers);
      return Right(response);
    } catch (e) {
      _printRequest(
          url: url, type: RequestType.DELETE, headers: headers ?? _headers);
      if (e is DioException) {
        final response = e.response;
        if (response != null) {
          final message = response.data['message'];
          if (kDebugMode) {
            print(message);
          }
          return Left(Failure(message: message));
        }
      }
      return Left(Failure(message: EventMessages.DELETE_REQUEST_FAIL_MESSAGE));
    }
  }

  FutureEither<Response> postRequest({
    required String url,
    required dynamic body,
    dynamic headers,
    bool requireAuth = true,
  }) async {
    try {
      final response = await _dio.post(
        url,
        options: Options(headers: headers ?? _headers),
        data: body,
      );
      _printRequest(
          url: url,
          type: RequestType.POST,
          response: response,
          headers: headers ?? _headers,
          data: body);
      return Right(response);
    } catch (e) {
      _printRequest(
          url: url,
          type: RequestType.POST,
          headers: headers ?? _headers,
          data: body);

      if (e is DioException) {
        final response = e.response;
        if (response != null) {
          final message = response.data['message'];
          if (kDebugMode) {
            print(message);
          }
          return Left(Failure(message: message));
        }
      }
      if (kDebugMode) {
        print(e);
      }
      return Left(Failure(message: EventMessages.POST_REQUEST_FAIL_MESSAGE));
    }
  }

  FutureEither<Response> putRequest({
    required String url,
    required dynamic body,
    dynamic headers,
    bool requireAuth = true,
  }) async {
    try {
      final response = await _dio.put(
        url,
        options: Options(headers: headers ?? _headers),
        data: body,
      );
      _printRequest(
          url: url,
          type: RequestType.PUT,
          response: response,
          headers: headers ?? _headers,
          data: body);
      return Right(response);
    } catch (e) {
      _printRequest(
          url: url,
          type: RequestType.PUT,
          headers: headers ?? _headers,
          data: body);
      if (e is DioException) {
        final response = e.response;
        if (response != null) {
          final message = response.data['message'];
          if (kDebugMode) {
            print(message);
          }
          return Left(Failure(message: message));
        }
      }
      return Left(Failure(message: EventMessages.PUT_REQUEST_FAIL_MESSAGE));
    }
  }

  void _printRequest({
    required String url,
    dynamic data,
    Response? response,
    required RequestType type,
    required dynamic headers,
  }) {
    if (response != null) {
      log('Success $type @ $url\nDATA $data\nHEADERS $headers',
          name: LogLabel.NETWORK);
      log(
        'Response ${response.data}',
        name: LogLabel.NETWORK,
      );
    } else {
      log('Failed $type @ $url\nDATA $data\nHEADERS $headers',
          name: LogLabel.NETWORK);
    }
  }
}

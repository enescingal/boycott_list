import 'dart:developer';
import 'dart:io';

import 'package:boycott_list/product/init/config/app_environment.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

/// Product network manager
final class ProductNetworkManager extends NetworkManager<EmptyModel> {
  ProductNetworkManager.base()
      : super(
          options: BaseOptions(
            baseUrl: AppEnvironmentItems.baseUrl.value,
          ),
        );

  /// locale Code
  String acceptLanguage = 'en';

  /// Handle error
  /// [onErrorStatus] is error status code [HttStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Accept-Language'] = acceptLanguage;
          log(
            'REQUEST==> PATH-> ${options.path} \n METHOD -> ${options.method} \n DATA-> ${options.data} \n QUERY-> ${options.queryParameters} \n ${options.headers}',
          );
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log('RESPONSE==> \n ${response.data}');
          return handler.next(response);
        },
        onError: (e, handler) {
          onErrorStatus(e.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(e);
        },
      ),
    );
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:boycott_list/product/init/config/app_environment.dart';
import 'package:easy_localization/easy_localization.dart';
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

  /// Handle error
  /// [onErrorStatus] is error status code [HttStatus]
  void listenErrorState({
    required ValueChanged<int> onErrorStatus,
    required BuildContext context,
  }) {
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Accept-Language'] = context.locale.languageCode;
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

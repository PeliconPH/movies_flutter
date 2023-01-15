import 'package:movies_flutter/api/api_host.dart';

class Endpoint {
  String path;
  dynamic data;
  String method;
  String? contentType;
  final Map<String, String> _queryParameters = ApiHost.defaultQueryParams;

  set queryParameters(Map<String, String> parametes) {
    _queryParameters.addAll(parametes);
  }

  Map<String, String> get queryParameters {
    return _queryParameters;
  }

  Endpoint({
    this.data,
    this.contentType,
    required this.path,
    required this.method,
    Map<String, String>? queryParameters,
  }) {
    if (queryParameters != null) {
      this.queryParameters = queryParameters;
    }
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc_clean/core/platform/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../di/inyector.dart';
import '../global/endpoints.dart';
import '../utils/logger.dart';


export 'package:http/http.dart';

class NetworkHandler {
  final Logger _logger;
  final SharedPreferencesManager _sharedP;
  bool _certificateCheck(X509Certificate cert, String host, int port) => true;

  NetworkHandler(this._sharedP, this._logger);

  ///Returns the common headers with authentication values
  Future<Map<String, String>> _commonHeaders() async {
    final v = {
      'Authorization':
          '${await _sharedP.getTokenType()} ${await _sharedP.getAccessToken()}',
      'Content-Type': 'application/json'
    };

    return v;
  }

  ///Returns the common headers with authentication values
  Future<Map<String, String>> _multipartHeaders() async {
    final v = {
      'Authorization':
          '${await _sharedP.getTokenType()} ${await _sharedP.getAccessToken()}',
      'Content-Type': 'multipart/form-data'
    };

    return v;
  }

  ///Get operations.
  ///-The base URL by default is the one provided by the Injector.
  ///-The [path] is mandatory
  ///-The request already handles authentication
  ///-The request already handles refresh token implementation
  Future<http.Response> get({
    required String path,
    String params = '',
    bool baseUrl = true,
    Map<String, String> header = const {},
  }) async {
    String _url = "";
    if (baseUrl)
      _url = Injector.apiBaseUrl + path + params;
    else
      _url = path;
    final _headers = await _commonHeaders();

    try {
      _logger.log("-> GET: $_url");
      _logger.log("-> HEADERS: $_headers");

      final res = await http.get(Uri.parse(_url), headers: _headers);

      _logger.log("<- RESPONSE CODE: ${res.statusCode}");
      _logger.log("<- RESPONSE BODY: ${res.body}");
      if (res.statusCode == Endpoint.code_un_authorized) {
        final refreshResult = await _refreshToken();
        if (refreshResult.statusCode == Endpoint.code_success) {
          final _newHeaders = await _commonHeaders();
          final resAfterRefresh =
              await http.get(Uri(path: _url), headers: _newHeaders);
          return resAfterRefresh;
        } else
          return refreshResult;
      }
      return res;
    } catch (ex) {
      _logger.log("<- EXCEPTION: $ex");
      throw ex;
    }
  }

  ///Post operations.
  ///-The base URL by default is the one provided by the Injector.
  ///-The [path] is mandatory
  ///-The request's content type is application/json
  ///-The request already handles authentication
  ///-The request already handles refresh token implementation
  Future<http.Response> post({
    required String path,
    String params = '',
    String body = "",
  }) async {
    final _url = Injector.apiBaseUrl + path + params;
    final _headers = await _commonHeaders();

    try {
      _logger.log("-> POST: $_url");
      _logger.log("-> HEADERS: $_headers");
      _logger.log("-> BODY: $body");

      final res =
          await http.post(Uri.parse(_url), headers: _headers, body: body);

      _logger.log("<- RESPONSE CODE: ${res.statusCode}");
      _logger.log("<- RESPONSE BODY: ${res.body}");

      if (res.statusCode == Endpoint.code_un_authorized) {
        final refreshResult = await _refreshToken();
        if (refreshResult.statusCode == Endpoint.code_success) {
          final _newHeaders = await _commonHeaders();
          final resAfterRefresh = await http.post(Uri.parse(_url),
              headers: _newHeaders, body: body);
          return resAfterRefresh;
        } else
          return refreshResult;
      }

      return res;
    } catch (ex) {
      _logger.log("<- EXCEPTION: $ex");
      throw ex;
    }
  }

  Future<http.Response> postMailGmail({
    required String path,
    required Map<String, String> header,
    String params = '',
    String body = "",
  }) async {
    final _url = path;
    final _headers = header;

    try {
      _logger.log("-> POST: $_url");
      _logger.log("-> HEADERS: $_headers");
      _logger.log("-> BODY: $body");
      final res =
          await http.post(Uri.parse(_url), headers: _headers, body: body);
      _logger.log("<- RESPONSE CODE: ${res.statusCode}");
      _logger.log("<- RESPONSE BODY: ${res.body}");

      return res;
    } catch (ex) {
      _logger.log("<- EXCEPTION: $ex");
      throw ex;
    }
  }

  ///Put operations.
  ///-The base URL by default is the one provided by the Injector.
  ///-The [path] is mandatory
  ///-The request's content type is application/json
  ///-The request already handles authentication
  ///-The request already handles refresh token implementation
  Future<http.Response> put({
    required String path,
    String params = '',
    required String body,
    Map<String, String> headers = const {},
  }) async {
    final _url = Injector.apiBaseUrl + path + params;
    final _headers = await _commonHeaders();
    try {
      _logger.log("-> PUT: $_url");
      _logger.log("-> HEADERS: $_headers");
      _logger.log("-> BODY: $body");
      final res =
          await http.put(Uri.parse(_url), headers: _headers, body: body);
      _logger.log("<- RESPONSE CODE: ${res.statusCode}");
      _logger.log("<- RESPONSE BODY: ${res.body}");
      if (res.statusCode == Endpoint.code_un_authorized) {
        final refreshResult = await _refreshToken();
        if (refreshResult.statusCode == Endpoint.code_success) {
          final _newHeaders = await _commonHeaders();
          final resAfterRefresh =
              await http.put(Uri(path: _url), headers: _newHeaders, body: body);
          return resAfterRefresh;
        } else
          return refreshResult;
      }
      return res;
    } catch (ex) {
      _logger.log("<- EXCEPTION: $ex");
      throw ex;
    }
  }

  ///Patch operations.
  ///-The base URL by default is the one provided by the Injector.
  ///-The [path] is mandatory
  ///-The request's content type is application/json
  ///-The request already handles authentication
  ///-The request already handles refresh token implementation
  Future<http.Response> patch({
    required String path,
    String params = '',
    required String body,
    Map<String, String> headers = const {},
  }) async {
    final _url = Injector.apiBaseUrl + path + params;
    final _headers = await _commonHeaders();
    try {
      _logger.log("-> PATCH: $_url");
      _logger.log("-> HEADERS: $_headers");
      _logger.log("-> BODY: $body");
      final res =
          await http.patch(Uri.parse(_url), headers: _headers, body: body);
      _logger.log("<- RESPONSE CODE: ${res.statusCode}");
      _logger.log("<- RESPONSE BODY: ${res.body}");
      if (res.statusCode == Endpoint.code_un_authorized) {
        final refreshResult = await _refreshToken();
        if (refreshResult.statusCode == Endpoint.code_success) {
          final _newHeaders = await _commonHeaders();
          final resAfterRefresh = await http.patch(Uri(path: _url),
              headers: _newHeaders, body: body);
          return resAfterRefresh;
        } else
          return refreshResult;
      }
      return res;
    } catch (ex) {
      _logger.log("<- EXCEPTION: $ex");
      throw ex;
    }
  }

  ///Delete operations.
  ///-The base URL by default is the one provided by the Injector.
  ///-The [path] is mandatory
  ///-The request already handles authentication
  ///-The request already handles refresh token implementation
  Future<http.Response> delete({
    required String path,
    String params = '',
    Map<String, String> headers = const {},
  }) async {
    final _url = Injector.apiBaseUrl + path + params;
    final _headers = await _commonHeaders();
    try {
      _logger.log("-> DELETE: $_url");
      _logger.log("-> HEADERS: $_headers");
      final res = await http.delete(Uri.parse(_url), headers: _headers);
      _logger.log("<- RESPONSE CODE: ${res.statusCode}");
      _logger.log("<- RESPONSE BODY: ${res.body}");
      if (res.statusCode == Endpoint.code_un_authorized) {
        final refreshResult = await _refreshToken();
        if (refreshResult.statusCode == Endpoint.code_success) {
          final _newHeaders = await _commonHeaders();
          final resAfterRefresh =
              await http.delete(Uri(path: _url), headers: _newHeaders);
          return resAfterRefresh;
        } else
          return refreshResult;
      }
      return res;
    } catch (ex) {
      _logger.log("<- EXCEPTION: $ex");
      throw ex;
    }
  }

  Future<http.Response> login({
    required String url,
    required String body,
  }) async {
    try {
      final _url = Injector.apiBaseUrl + url;
      final headers = {'Content-Type': 'application/json'};
      _logger.log("-> POST: $url");
      _logger.log("-> BODY: $body");
      final res =
          await http.post(Uri.parse(_url), headers: headers, body: body);
      _logger.log("<- RESPONSE CODE: ${res.statusCode}");
      _logger.log("<- RESPONSE BODY: ${res.body}");

      if (res.statusCode == 200 || res.statusCode == 204) {
        _sharedP.setAccessToken(res.headers["authorization"] ?? "");
        _sharedP.setRefreshToken(res.headers["refreshtoken"] ?? "");
      }

      return res;
    } catch (ex) {
      _logger.log("<- EXCEPTION: $ex");
      throw ex;
    }
  }

  Future<http.Response> validateToken() async {
    final url = "${Injector.apiBaseUrl}";
    final accessToken = await _sharedP.getAccessToken();
    final body = {
      Endpoint.token: accessToken.startsWith("Bearer ")
          ? accessToken.split("Bearer ")[1]
          : accessToken
    };
    try {
      _logger.log("-> POST: $url");
      _logger.log("-> BODY: $body");
      final headers = {'Content-Type': 'application/json'};

      var res = await http.post(Uri.parse(url),
          headers: headers, body: json.encode(body));
      _logger.log("<- RESPONSE CODE: ${res.statusCode}");
      _logger.log("<- RESPONSE BODY: ${res.body}");

      if (res.statusCode == Endpoint.code_un_authorized) {
        final refreshResult = await _refreshToken();
        if (refreshResult.statusCode == Endpoint.code_success) {
          final _newHeaders = await _commonHeaders();
          final resAfterRefresh = await http.post(Uri(path: url),
              headers: _newHeaders, body: json.encode(body));
          return resAfterRefresh;
        } else
          return refreshResult;
      }
      return res;
    } catch (ex) {
      _logger.log("<- EXCEPTION: $ex");
      throw ex;
    }
  }

  Future<http.Response> _refreshToken() async {
    _logger.log('-> Sending Refresh Token');

    final url = Injector.apiBaseUrl + Endpoint.REFRESH_TOKEN;

    final refreshToken = await _sharedP.getRefreshToken();
    final accessToken = await _sharedP.getAccessToken();

    final body = json.encode({
      "token": accessToken.startsWith("Bearer ")
          ? accessToken.split("Bearer ")[1]
          : accessToken,
      "refreshToken": refreshToken
    });
    try {
      _logger.log("-> POST: $url");
      _logger.log("-> BODY: $body");
      final _headers = {'Content-Type': 'application/json'};
      _logger.log("-> HEADERS: $_headers");

      var res = await http.post(Uri.parse(url), headers: _headers, body: body);
      _logger.log("<- RESPONSE CODE: ${res.statusCode}");
      _logger.log("<- RESPONSE BODY: ${res.body}");

      _sharedP.setAccessToken(res.headers["authorization"] ?? "");
      _sharedP.setRefreshToken(res.headers["refreshtoken"] ?? "");

      return res;
    } catch (ex) {
      throw ex;
    }
  }

  Future<http.Response> multipart({
    required String path,
    required Stream<Uint8List> file,
    required int fileLength,
  }) async {
    final _url = Injector.apiBaseUrl + path;
    final _headers = await _multipartHeaders();

    try {
      _logger.log("-> POST: $_url");
      _logger.log("-> HEADERS: $_headers");

      final request = http.MultipartRequest('POST', Uri.parse(_url))
        ..headers.addAll(_headers);

      request.files.add(http.MultipartFile('file', file, fileLength,
          filename: 'file', contentType: MediaType('image', 'png')));

      final res = await request.send();

      _logger.log("<- RESPONSE CODE: ${res.statusCode}");

      if (res.statusCode == Endpoint.code_un_authorized) {
        final refreshResult = await _refreshToken();
        if (refreshResult.statusCode == Endpoint.code_success) {
          final _newHeaders = await _multipartHeaders();

          final resAfterRefresh = http.MultipartRequest('POST', Uri.parse(_url))
            ..headers.addAll(_newHeaders);
          resAfterRefresh.files.add(http.MultipartFile('file', file, fileLength,
              filename: 'file', contentType: MediaType('image', 'png')));

          return http.Response.fromStream(await resAfterRefresh.send());
        } else
          return refreshResult;
      }

      return http.Response.fromStream(res);
    } catch (ex) {
      _logger.log("<- EXCEPTION: $ex");
      throw ex;
    }
  }
}

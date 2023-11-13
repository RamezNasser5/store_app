import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.body.isNotEmpty) {
      if (response.statusCode == 200) {
        final contentType = response.headers['content-type'];
        if (contentType != null && contentType.contains('application/json')) {
          return jsonDecode(response.body);
        } else {
          throw Exception('Response is not JSON: ${response.body}');
        }
      } else {
        throw Exception(
            "There is an error with status code get equal ${response.statusCode} with body ${response.body}");
      }
    } else {
      throw Exception('response body is Empty');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      final contentType = response.headers['content-type'];
      if (contentType != null && contentType.contains('application/json')) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Response is not JSON: ${response.body}');
      }
    } else {
      throw Exception(
          "There is an error with status code post equal ${response.statusCode} with body ${response.body}");
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      final contentType = response.headers['content-type'];
      if (contentType != null && contentType.contains('application/json')) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Response is not JSON: ${response.body}');
      }
    } else {
      throw Exception(
          "There is an error with status code put equal ${response.statusCode} with body ${response.body}");
    }
  }
}

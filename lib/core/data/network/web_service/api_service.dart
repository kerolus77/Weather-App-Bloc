import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'dio_service.dart';

class AppDio {
  AppDio._privateConstructor(); // Private constructor
  static final AppDio _instance =
      AppDio._privateConstructor(); // Singleton instance
  factory AppDio() => _instance; // Factory to return the same instan

  final ValueNotifier<int> _progressNotifier = ValueNotifier<int>(0);

  ValueNotifier<int> get progressNotifier => _progressNotifier;

  // Create (POST)
  Future<Response> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await DioService.instance.sendRequest(
        method: 'POST',
        path: path,
        data: data,
        queryParams: queryParams,
        headers: await DioService.instance.getHeaders(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

// Read (GET)
  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await DioService.instance.sendRequest(
        method: 'GET',
        data: data,
        path: path,
        queryParams: queryParams,
        headers: await DioService.instance.getHeaders(),
      );
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // Update (PUT)
  Future<Response> put({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await DioService.instance.sendRequest(
        method: 'PUT',
        path: path,
        data: data,
        queryParams: query,
        headers: await DioService.instance.getHeaders(),
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  // Delete (DELETE)
  Future<Response> delete({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await DioService.instance.sendRequest(
        method: 'DELETE',
        path: path,
        data: data,
        headers: await DioService.instance.getHeaders(),
      );
      return response;
    } on DioException catch (e) {
      print(e.response?.data);
      rethrow;
    }
  }

  // Patch (PATCH)
  Future<Response> patch({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await DioService.instance.sendRequest(
        method: 'PATCH',
        path: path,
        data: data,
        headers: await DioService.instance.getHeaders(),
      );
      return response;
    } on DioException {
      rethrow;
    }
  }
}

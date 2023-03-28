import 'package:banhawy/common_component/show_snack_bar.dart';
import 'package:banhawy/core/app_storage/app_storage.dart';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:url_launcher/url_launcher.dart';

class DioHelper {
  static const _baseUrl = 'https://banhawy.technoraft.com/api/';

  static Dio dioSingleton = Dio()..options.baseUrl = _baseUrl;

  static Future<Response<dynamic>> post(String path, bool isAuh,
      {FormData? formData,
        Map<String, dynamic>? body,
        Function(int, int)? onSendProgress}) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('YAY! Free cute dog pics!');
    } else {
      showSnackBar('You are disconnected from the internet');
    }
    dioSingleton.options.headers =
    isAuh ? {'Authorization': 'Bearer ${AppStorage.getToken}'} : null;
    final response = dioSingleton.post(path,
        data: formData ?? FormData.fromMap(body!),
        options: Options(
            headers: {
              'Authorization': 'Bearer ${AppStorage.getToken}',
              'Accept': 'application/json',
              'Accept-Language':  'ar'
            },
            followRedirects: false,
            receiveDataWhenStatusError: true,
            sendTimeout: Duration(minutes: 1),
            //60 seconds
            receiveTimeout:  Duration(minutes: 1),
            // 60 seconds
            validateStatus: (status) {
              return status! < 500;
            }),
        onSendProgress: onSendProgress);
    return response;
  }

  static Future<Response<dynamic>> put(String path, bool isAuh,
      {FormData? formData,
        Map<String, dynamic>? body,
        Function(int, int)? onSendProgress}) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('YAY! Free cute dog pics!');
    } else {
      showSnackBar('You are disconnected from the internet');
    }
    dioSingleton.options.headers =
    isAuh ? {'Authorization': 'Bearer ${AppStorage.getToken}'} : null;
    final response = dioSingleton.put(path,
        data: formData ?? FormData.fromMap(body!),
        options: Options(
            headers: {
              'Authorization': 'Bearer ${AppStorage.getToken}',
              'Accept': 'application/json',
              'Accept-Language':  'ar'
            },
            followRedirects: false,
            receiveDataWhenStatusError: true,
            sendTimeout:  Duration(minutes: 1),
            //60 seconds
            receiveTimeout:  Duration(minutes: 1),
            // 60 seconds
            validateStatus: (status) {
              return status! < 500;
            }),
        onSendProgress: onSendProgress);
    return response;
  }

  static Future<Response<dynamic>> delete(
      String path, {
        Map<String, dynamic>? body,
      }) {
    try {
      dioSingleton.options.headers = {
        'Authorization': 'Bearer ${AppStorage.getToken}'
      };
      final response = dioSingleton.delete(
        path,
        data: body,
        options: Options(
            headers: {
              'Authorization': 'Bearer ${AppStorage.getToken}',
              'Accept': 'application/json'
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  static Future<Response<dynamic>> get(String path, {dynamic body}) async {
    if (AppStorage.isLogged) {
      bool result = await InternetConnectionChecker().hasConnection;
      if (result == true) {
        print('YAY! Free cute dog pics!');
      } else {
        showSnackBar('You are disconnected from the internet');
      }
      dioSingleton.options.headers = {
        'Authorization': 'Bearer ${AppStorage.getToken}',
        'Accept': 'application/json',
        'Accept-Language':  'ar',
      };
    }else{
      dioSingleton.options.headers = {
        'Accept': 'application/json',
        'Accept-Language':  'ar',
      };
    }
    print(dioSingleton.options.headers);
    final response = dioSingleton.get(path,
        queryParameters: body,
        options: Options(
          sendTimeout:  Duration(minutes: 1), //60 seconds
          receiveTimeout: Duration(minutes: 1), // 60 seconds
        ));
    dioSingleton.options.headers = null;
    return response;
  }

  static Future<void>? launchURL(url) async {
    if (!await launch(
      url,
    )) throw 'Could not launch $url';
  }
}
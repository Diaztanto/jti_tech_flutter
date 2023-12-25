import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/get.dart';

class ApiService extends GetxService with DioMixin {
  static String get _domain => dotenv.env['domain']!;
  static String get _tld => dotenv.env['tld']!;
  static String get _schema => dotenv.env['schema'] ?? "https://";
  static String get _prepath => dotenv.env['prepath']!;

  @override
  void onInit() {
    super.onInit();
    httpClientAdapter = IOHttpClientAdapter();

    dotenv.load().then((_) {
      options = BaseOptions(baseUrl: _schema + _domain + _tld + _prepath);
      login(User.admin);
    });
  }

  Future<void> login(String user) async {
    try {
      Response res = await get('/Auth',
          data: {"act": 'LOGIN', "un": '$user@$user.com', "up": user});

      print(res);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> bgApiHit() async {
    try {
      Response res = await get('/BgService/Hit', data: {
        "nama": dotenv.env['nama'],
        "email": dotenv.env['email'],
        "nohp": dotenv.env['nohp']
      });

      print(res);
    } catch (err) {
      rethrow;
    }
  }
}

class User {
  User._();

  static const String admin = 'admin';
  static const String user = 'user';
  static const String manager = 'manager';
}
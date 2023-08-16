import 'package:flutter/material.dart';
import 'package:weather_app/services/dio/dio.dart';
import 'package:weather_app/services/shared_reference/shared_preference.dart';
import 'package:weather_app/src/root_app.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await SharedPreference.init();
  runApp(RootApp());
}

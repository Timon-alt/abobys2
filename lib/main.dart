import 'package:abobys/repositories/crypto_coins/crypto_coins.dart';
import 'package:abobys/theme/myapp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


void main() {
  GetIt.I.registerLazySingleton(() => CryptoCoinsRepository(dio: Dio()));
  runApp(const MyApp());
}
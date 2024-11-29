import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:krishi_sathi/src/core/network/connectivity_checker.dart';

GetIt sl = GetIt.instance;

Future<void> initApp() async {
  _initCore();
}

void _initCore() {
  sl.registerSingleton<Dio>(Dio());
  // add connectivity
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  // add checkInternetConnectivity
  sl.registerLazySingleton<BaseCheckInternetConnectivity>(
    () => CheckInternetConnectivity(connectivity: sl()),
  );
}

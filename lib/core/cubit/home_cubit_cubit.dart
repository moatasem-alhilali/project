import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  static HomeCubit get(context) => BlocProvider.of(context);
  StreamSubscription? _subscription;

  void checkInternet() async {
    InternetConnectionChecker internetConnectionChecker =
        InternetConnectionChecker();

    bool result = await internetConnectionChecker.hasConnection;
    if (result == true) {
      print('Data connection  .');

      emit(HomeState(isDeviceConnected: true));
    } else {
      emit(HomeState(isDeviceConnected: false));
      print('You are disconnected   .');
    }

    //listen
    _subscription = internetConnectionChecker.onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          print('Data connection is available.');
          emit(HomeState(isDeviceConnected: true));

          break;
        case InternetConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          emit(HomeState(isDeviceConnected: false));
          break;
      }
    });
  }
}

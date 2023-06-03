  // //check if connect of internet
  // if (Connectivity().checkConnectivity() == ConnectivityResult.none) {
  //   ISCONNECTED = false;
  // }
// StreamSubscription? _subscription;

  //   //internet checker
  // void checkConnection() async {
  //   //check if connect of internet
  //   var _subscription = Connectivity();

  //   _subscription.onConnectivityChanged.listen((ConnectivityResult result) {
  //     if (result == ConnectivityResult.wifi ||
  //         result == ConnectivityResult.mobile) {
  //       emit(ConnectedState());
  //       ISCONNECTED = true;
  //     } else {
  //       ISCONNECTED = false;
  //       emit(NoConnectedState());
  //     }
  //   });
  // }
  
// @override
// Future<void> close() {
//   _subscription!.cancel();
//   return super.close();
// }

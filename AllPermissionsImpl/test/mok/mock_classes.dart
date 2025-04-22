import 'package:location/location.dart';
import 'package:mockito/mockito.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MockConnectivity extends Mock implements Connectivity {
  @override
  Future<ConnectivityResult> checkConnectivity() async {
    return ConnectivityResult.none;
  }
}

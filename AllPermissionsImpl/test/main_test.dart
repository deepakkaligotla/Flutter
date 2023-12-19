import 'package:all_permissions_impl/main.dart';
import 'package:location/location.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;
import 'package:test/test.dart' as test;

void main() {
  flutter_test.testWidgets('Test checking - Bluetooth, Location, MobileData, Wifi services', (flutter_test.WidgetTester tester) async {
    await tester.runAsync(() async {
      tester.pumpWidget(const MyApp());
      await testBluetooth();
      await testLocation();
      await testMobileData();
      await testWifi();
    });
  });
}

Future<void> testBluetooth() async {
  test.test('Check Bluetooth Enabled', () async {
    final ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    final bool bluetoothEnabled = connectivityResult == ConnectivityResult.bluetooth;

    test.expect(bluetoothEnabled, test.isTrue);
  });
}

Future<void> testLocation() async {
  test.test('Check Location Enabled', () async {
    final Location location = Location();
    bool locationEnabled = await location.serviceEnabled();

    test.expect(locationEnabled, test.isTrue);
  });
}

Future<void> testMobileData() async {
  test.test('Check Mobile Data Enabled', () async {
    final ConnectivityResult connectivityResult =
    await Connectivity().checkConnectivity();

    final bool mobileDataEnabled =
        connectivityResult == ConnectivityResult.mobile;

    test.expect(mobileDataEnabled, test.isTrue);
  });
}

Future<void> testWifi() async {
  test.test('Check Wifi Enabled', () async {
    final ConnectivityResult connectivityResult =
    await Connectivity().checkConnectivity();

    final bool wifiEnabled = connectivityResult == ConnectivityResult.wifi;

    test.expect(wifiEnabled, test.isTrue);
  });
}

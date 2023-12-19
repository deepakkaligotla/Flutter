import 'package:all_permissions_impl/main.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:location/location.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test checking - Bluetooth, Location, MobileData, Wifi services', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(const MyHomePage(title: ""));

      expect(find.text('Hello'), findsOneWidget);

      await testBluetooth();
      await testLocation();
      await testMobileData();
      await testWifi();
    });
  });
}

Future<void> testBluetooth() async {
  test('Check Bluetooth Enabled', () async {
    final FlutterBlue flutterBlue = FlutterBlue.instance;
    final bool bluetoothEnabled = await flutterBlue.isOn;

    expect(bluetoothEnabled, isTrue);
  });
}

Future<void> testLocation() async {
  test('Check Location Enabled', () async {
    final Location location = Location();
    bool locationEnabled = await location.serviceEnabled();

    expect(locationEnabled, isTrue);
  });
}

Future<void> testMobileData() async {
  test('Check Mobile Data Enabled', () async {
    final ConnectivityResult connectivityResult =
    await Connectivity().checkConnectivity();

    final bool mobileDataEnabled =
        connectivityResult == ConnectivityResult.mobile;

    expect(mobileDataEnabled, isTrue);
  });
}

Future<void> testWifi() async {
  test('Check Wifi Enabled', () async {
    final ConnectivityResult connectivityResult =
    await Connectivity().checkConnectivity();

    final bool wifiEnabled = connectivityResult == ConnectivityResult.wifi;

    expect(wifiEnabled, isTrue);
  });
}

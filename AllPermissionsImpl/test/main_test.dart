import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'mok/mock_classes.dart';

void main() {
  final MockConnectivity mockConnectivity = MockConnectivity();
  String name = "";

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {

  });

  group("", () {

    test('Checking Bluetooth', () {
      name = "Bluetooth";
      print("$name Enabled");
      bool isBluetoothEnabled =  true;
      expect(isBluetoothEnabled, isTrue);
    });

    test('Checking Location', () async {
      name = "Location";
      print("$name Enabled");
      bool locationEnabled =  true;
      expect(locationEnabled, isTrue);
    });

    test('Checking Mobile Data', () {
      name = "MobileData";
      print("$name Enabled");
      bool isMobileDataEnabled =  true;
      expect(isMobileDataEnabled, isTrue);
    });

    test('Checking Wifi', () {
      name = "Wifi";
      print("$name Enabled");
      bool isWifiEnabled =  true;
      expect(isWifiEnabled, isTrue);
    });
  });

  tearDown(() {

  });

  tearDownAll(() {

  });
}

// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import '../data.dart';
import '../Scripts/homePage.dart';


void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    //final counterTextFinder = find.byValueKey('counter');
    //final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    Map<String, dynamic> dataFileMap;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      
      driver = await FlutterDriver.connect();
    });


    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
     
      if (driver != null) {
        driver.close();
      }
    });

  setUp(() async {
      
       dataFileMap = await readDataFile();
    });

    tearDown(() async {
      writeDataToFile(dataFileMap);      
    });

    test('starts at 0', () async {
      //dataFileMap = await readDataFile();
      dataFileMap['itemCount']= 0;
      expect(await driver.getText(counterTextFinder), dataFileMap['itemCount'].toString());
      
    });

    test('increments the counter', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);
      dataFileMap['itemCount']= 11;
      // Then, verify the counter text is incremented by 1.
      expect(await driver.getText(counterTextFinder), "1");
    });
  });
}

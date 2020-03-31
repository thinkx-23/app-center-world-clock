// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;


void main() {

  test('Load a file', () async {
    final file = new File('test_resources/data.json');
    final json = jsonDecode(await file.readAsString());
    final item = json['ItemCount'];
    final username = json['ItemCount'];

    print("item count 01 :"+ item);

    //final seth = contacts.first;
    expect(item, 1);
    expect(username, 'testUser');
    expect(item, 2);

  });

  int count(int a, int b) {
  int innerThing(int c, int d) => c + d;

  return innerThing(a, b);
}

  void dataReading() async {
    final file = new File('test_resources/data.json');
    final json = jsonDecode(await file.readAsString());
    String item = json['ItemCount'];
    final username = json['ItemCount'];

  
    print("item count 02 :"+ item);
    //final seth = contacts.first;
    expect(item, 1);
    expect(username, 'testUser');
    expect(item, 2);
    int a = 2;
    //return a;
  }

  group('Counter App', () {

    final item = dataReading() ;

    //print("item count 03 :"+ item);

    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      
      print('World');
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('read data',()async{
        final file = new File('test_resources/data.json');
        final json = jsonDecode(await file.readAsString());
        String item = json['ItemCount'];
        stderr.writeln('print me');
    });
    test('starts at 0', () async {
      print("item count   item"); 
      stderr.writeln("print me +++++");
      developer.log('log me', name: 'my.app.category');

      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      // Then, verify the counter text is incremented by 1.
      expect(await driver.getText(counterTextFinder), "1");
    });
  });
}

// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'dart:convert';
import 'dart:io';


void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

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

  // test('Read and Write File', () async {
  //   readDataFile();

  // });

  // test('Write File',() async{

  //   writeDataToFile();

  // });

    test('starts at 0', () async {
      dataFileMap = await readDataFile();
      // Use the `driver.getText` method to verify the counter starts at 0.
      dataFileMap['itemCount']= 0;
      expect(await driver.getText(counterTextFinder), dataFileMap['itemCount'].toString());
       writeDataToFile(dataFileMap);
    });

    test('increments the counter', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      // Then, verify the counter text is incremented by 1.
      expect(await driver.getText(counterTextFinder), "1");
    });
  });
}

void writeDataToFile(Map<String, dynamic> jon) async{
  final File file = File('test_resources/data.json');
  //final Map<String, dynamic> dataJson = await readDataFile();
  print ("data write ----- ");
  //print ("data write ----- "+dataJson);
   print ("data write ----- "+jsonEncode(jon));
  // print ("data write ----- "+dataJson['username']);
  await file.writeAsString(jsonEncode(jon));
}

Future<Map<String, dynamic>> readDataFile() async{
    final file = new File('test_resources/data.json');
    final json = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    print(json);
    final username = json['username'];

    print ("data  ----- "+username);
    //print ("data  ----- "+json);
    expect("0", "0");
    expect(username, "testUser");
    json['username'] = 'abc';
    //json['itemCount'] = 10;
    print ("after  ----- "+json['username']);

    return json;
}

// Future<String> loadFromAsset(String name) async {
//     String content = await rootBundle.loadString("test_resources/$name.json");
//     return content;
// }
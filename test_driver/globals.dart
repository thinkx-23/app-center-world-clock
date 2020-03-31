import 'dart:convert';
import 'dart:io';

void readDataFile() async{
    final file = new File('test_resources/data.json');
    final json = jsonDecode(await file.readAsString());
    final username = json['username'];

    print ("data  ----- "+username);
    print ("data  ----- "+json['username']);
    json['Username'] = 'abc';
    print ("after  ----- "+json['username']);
}

void writeDataToFile() async{
  final File file = File('test_resources/data.json');
  jsonEncode(await file.writeAsString("abc"));
}
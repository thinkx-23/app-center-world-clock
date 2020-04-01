import 'dart:convert';
import 'dart:io';

void writeDataToFile(Map<String, dynamic> data) async{
  final File file = File('test_resources/data.json');
  print ("data write ----- "+jsonEncode(data));
  await file.writeAsString(jsonEncode(data));
}

Future<Map<String, dynamic>> readDataFile() async{
    final file = new File('test_resources/data.json');
    final dataMap = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    
    print ("read file ++++++");
    print(dataMap);

    return dataMap;
}
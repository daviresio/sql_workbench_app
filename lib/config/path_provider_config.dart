import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PathProviderConfig {

  static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.absolute.path;
  }

  static Future<String> get _tempPath async {
    final directory = await getTemporaryDirectory();
    return directory.absolute.path;
  }

  static Future<dynamic> writeStringFile(String content, String filename) async {
    final File file = File('${await localPath}/$filename');
    await file.writeAsString(content);
  }

  static Future<dynamic> writeTempStringFile(String content, String filename) async {
    final File file = File('${await _tempPath}/$filename');
    return await file.writeAsString(content);
  }

}